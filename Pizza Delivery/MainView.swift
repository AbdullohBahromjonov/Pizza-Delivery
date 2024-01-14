//
//  ContentView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 12/01/24.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITableView.appearance().backgroundColor = UIColor(Color.white)
    }
    
    var body: some View {
        TabView(
            selection: .constant(1),
            content:  {
                MenuView()
                    .tag(1)
                    .tabItem {
                        VStack {
                            Image("Menu")
                            Text("Меню")
                        }
                    }
                
                Text("Contacts view")
                    .tag(2)
                    .tabItem {
                        VStack {
                            Image("Pin")
                            Text("Контаты")
                        }
                    }
                
                Text("Profile view")
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image("Person")
                            Text("Пофиль")
                        }
                    }
                
                Text("Cart view")
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image("Cart")
                            Text("Корзина")
                        }
                    }
            }
        )
        .tint(.pink)
    }
}

#Preview {
    MainView()
        .environmentObject(Networking())
}





