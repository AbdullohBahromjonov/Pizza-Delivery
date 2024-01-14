//
//  CategoriesView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var networking: Networking
    
    @Binding var selectedCategory: Int
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: columns,
                content: {
                    if let loadedCategory = networking.foods {
                        ForEach(loadedCategory) { category in
                            CategoryItem(
                                text: category.name,
                                isActive: category.id == selectedCategory
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedCategory = category.id
                                }
                            }
                        }
                    }
                }
            )
            .padding(.horizontal)
        }
        .padding(.bottom, 15)
        .onAppear {
            networking.fetchData()
        }
    }
}


#Preview {
    CategoriesView(selectedCategory: .constant(0))
        .environmentObject(Networking())
}

