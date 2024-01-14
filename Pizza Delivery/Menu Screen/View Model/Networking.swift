//
//  Networking.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 14/01/24.
//

import SwiftUI

class Networking: ObservableObject {
    @Published var foods: [Category]? = nil
    
    func fetchData() {
        guard let url = URL(string: "https://my-json-server.typicode.com/AbdullohBahromjonov/FakeAPI/categories") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode([Category].self, from: data)
                        self.foods = decodedData
                    } catch let error {
                        print("Error decoding: ", error.localizedDescription)
                    }
                }
            } else if (400...499).contains(response.statusCode) {
                print("Client error")
            } else if (500...599).contains(response.statusCode) {
                print("Server error")
            }
        }

        task.resume()
    }
}
