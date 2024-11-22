//
//  MainView.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Explore()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            MyBooking()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Booking")
                }
            Favourite()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourite")
                }
            Profile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
