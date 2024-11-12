//
//  smart_city_parkingApp.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-10-30.
//

import SwiftUI
import FirebaseCore

@main
struct smart_city_parkingApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            SplashScreenView()
            BookingDetails()
            
            
            
        }
    }
}
