//
//  CategoryItem.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct CategoryItem: View {
    let text: String
    let isActive: Bool
    
    var body: some View {
        Text(text)
            .font(.system(size: 13))
            .foregroundStyle(isActive ? Color.white : Color.pink)
            .padding(.vertical, 8)
            .padding(.horizontal, 25)
            .background {
                if isActive {
                    Capsule()
                        .fill(Color.pink)
                } else {
                    Capsule()
                        .stroke(lineWidth: 1)
                }
            }
            .foregroundStyle(.pink)
            .opacity(isActive ? 1 : 0.4)
    }
}


#Preview {
    CategoryItem(text: "Pizza", isActive: false)
}
