//
//  MenuView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct MenuView: View {
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
                                ForEach(pizzas) { pizza in
                                    PizzaCardView(
                                        name: pizza.name,
                                        price: pizza.price,
                                        description: pizza.description)
                                }
                            }
                            .cornerRadius(25)
                        } header: {
                            CategoriesView()
                                .background(Color("Background"))
                        }
                    }
                }
            }
        }
        
    }
}


#Preview {
    MenuView()
}
