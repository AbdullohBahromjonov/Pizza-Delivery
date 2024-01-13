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
                            Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                            Text("Menu")
                        }
                    }
                
                Text("Contacts view")
                    .tag(2)
                    .tabItem {
                        VStack {
                            Image(systemName: "mappin.circle")
                            Text("Contacts")
                        }
                    }

                
                Text("Profile view")
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                    }
                
                Text("Cart view")
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "cart.fill")
                            Text("Cart")
                        }
                    }
            }
        )
        .tint(.pink)
    }
}

#Preview {
    MainView()
}





