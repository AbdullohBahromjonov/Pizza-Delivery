//
//  PizzaCardView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import SwiftUI

struct PizzaCardView: View {
    let name: String
    let price: Int
    let description: String
    
    var body: some View {
        HStack() {
            Image("Pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 132)
                .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 17, weight: .medium))
                
                Text(description)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                
                Button(
                    action: {},
                    label: {
                        Text("от \(price) р")
                            .font(.system(size: 13))
                            .foregroundStyle(.pink)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.pink)
                            )
                    }
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.trailing, 10)
        }
        .padding()
        .background(
            Color.white
        )
    }
}


#Preview {
    PizzaCardView(name: "Ветчина и грибы", price: 345, description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус")
}
