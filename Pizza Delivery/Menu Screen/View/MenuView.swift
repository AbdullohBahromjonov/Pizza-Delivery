//
//  MenuView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var networking: Networking
    
    @State var selectedCategory = 0
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Text("Москва")
                        .font(.system(size: 17, weight: .medium))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 17, weight: .medium))
                }
                .padding()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        BannerView()
                        
                        Section {
                            VStack(spacing: 1) {
                                if let loadedPizzas = networking.pizzas {
                                    ForEach(loadedPizzas[selectedCategory].foods) { pizza in
                                        PizzaCardView(
                                            name: pizza.name,
                                            img: pizza.img,
                                            price: pizza.price,
                                            description: pizza.description)
                                    }
                                } else {
                                    ProgressView()
                                }
                            }
                            .cornerRadius(25)
                        } header: {
                            CategoriesView(selectedCategory: $selectedCategory)
                                .background(Color("Background"))
                        }
                    }
                }
            }
        }
        .task {
            do {
                try await networking.fetchData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


#Preview {
    MenuView()
        .environmentObject(Networking())
}
