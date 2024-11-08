//
//  MainView.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
                   // Home Tab
            Home()
                       .tabItem {
                           Image(systemName: "house.fill")
                           Text("Home")
                       }
                   
                   // Parking Tab
            SignUp()
                       .tabItem {
                           Image(systemName: "magnifyingglass")
                           Text("Explore")
                       }
                   
                   // Settings Tab
            ManualLocation()
                       .tabItem {
                           Image(systemName: "calendar")
                           Text("Booking")
                       }
            // Settings Tab
            ManualLocation()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favourite")
                        }
            // Settings Tab
            ManualLocation()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
            
               }
               .accentColor(.blue)
    }
}

#Preview {
    MainView()
}
