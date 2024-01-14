//
//  Category.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 14/01/24.
//

import Foundation

struct Category: Identifiable, Decodable {
    let id: Int
    let name: String
    let foods: [Food]
}
