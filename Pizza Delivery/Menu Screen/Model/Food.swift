//
//  File.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 13/01/24.
//

import Foundation

struct Food: Identifiable, Decodable {
    let id: Int
    let name: String
    let img: String
    let price: Int
    let description: String
}
