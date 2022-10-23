//
//  ContentView.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            TabView {
                LastCatalogs()
                 .tabItem {
                    Image(systemName: "doc.fill")
                    Text("Catalogs")
                  }
                Shops()
                .tabItem {
                   Image(systemName: "cart.fill")
                   Text("Categories")
                 }
                FavoriteView()
                .tabItem {
                  Image(systemName: "heart.fill")
                  Text("Favorites")
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
