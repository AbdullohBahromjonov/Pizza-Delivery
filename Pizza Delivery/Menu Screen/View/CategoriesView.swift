//
//  CategoriesView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct CategoriesView: View {
    @State var selectedCategory = "Пицца"
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: columns,
                content: {
                    ForEach(categories) { category in
                        CategoryItem(
                            text: category.name,
                            isActive: category.name == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category.name
                        }
                    }
                }
            )
            .padding(.horizontal)
        }
        .padding(.bottom, 15)
    }
}


#Preview {
    CategoriesView()
}

