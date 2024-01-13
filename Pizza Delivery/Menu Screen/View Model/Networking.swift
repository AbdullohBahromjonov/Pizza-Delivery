//
//  Networking.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 14/01/24.
//

import Foundation

class Networking: ObservableObject {
    @Published var pizzas: [Category]? = nil
    
    func fetchData() async throws {
        guard let url = URL(string: "https://my-json-server.typicode.com/AbdullohBahromjonov/FakeAPI/categories") else { fatalError("Wrong url") }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode([Category].self, from: data)
        self.pizzas = decodedData
    }
}
