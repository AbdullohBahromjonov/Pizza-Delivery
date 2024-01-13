//
//  ContentView.swift
//  Pizza Delivery
//
//  Created by Abdulloh on 12/01/24.
//

import SwiftUI

struct ContentView: View {
    
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
    ContentView()
}

struct PizzaCardView: View {
    var body: some View {
        HStack() {
            Image("Pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 132)
                .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                Text("Ветчина и грибы")
                    .font(.system(size: 17, weight: .medium))
                
                Text("Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                
                Button(
                    action: {},
                    label: {
                        Text("от 345 р")
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

struct MenuView: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    let types = [
        "Пицца",
        "Комбо",
        "Десерты",
        "Напитки"
    ]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Text("Москва")
                        .font(.system(size: 17, weight: .medium))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 17, weight: .medium))
                }
                .padding()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        BannerView()
                        
                        Section {
                            VStack(spacing: 1) {
                                ForEach(1...5, id: \.self) { i in
                                    PizzaCardView()
                                }
                            }
                            .cornerRadius(25)
                        } header: {
                            TypesView()
                                .background(Color("Background"))
                        }
                    }
                }
            }
        }
        
    }
}

struct BannerView: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: columns,
                content: {
                    ForEach(1...5, id: \.self) { _ in
                        Image("Banner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            )
            .frame(height: 112)
        }
    }
}

struct TypesView: View {
    let columns = [
        GridItem(.flexible())
    ]
    
    let types = [
        "Пицца",
        "Комбо",
        "Десерты",
        "Напитки"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: columns,
                content: {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                            .font(.system(size: 13))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 25)
                            .background(
                                Capsule()
                                    .stroke(lineWidth: 1)
                            )
                            .foregroundStyle(.pink)
                    }
                }
            )
            .padding(.horizontal)
        }
        .padding(.bottom, 15)
    }
}
