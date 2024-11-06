//
//  ContentView.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-10-30.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var showOnboarding = false
    
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    
                
            }
            
            .opacity(showOnboarding ? 0 : 1)
            
            if showOnboarding{
                Onboarding_1()
                    .transition(.opacity)
            }
        }
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation{
                    showOnboarding = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
