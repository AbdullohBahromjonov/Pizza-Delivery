//
//  Pizza_DeliveryApp.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 12/01/24.
//

import SwiftUI

@main
struct Pizza_DeliveryApp: App {
    var networking = Networking()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(networking)
        }
    }
}
