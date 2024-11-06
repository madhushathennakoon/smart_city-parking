//
//  Onboarding 1.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-05.
//

import SwiftUI

struct Onboarding_1: View {
    var body: some View {
        NavigationView{
            VStack {
                
                Image("Onboarding 1")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width:330,height: 350)
                    .padding(.top, 100)
                
                
                Text("Welcome to PARKSPOT!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 36)
                
                
                Text("PARKSPOT helps you find and book the best parking spots in seconds.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,40)
                    .padding(.top, 2)
                
                Spacer()
                
                
                HStack(spacing: 10) {
                    
                    
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 45, height: 8)
                        .cornerRadius(20)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 30, height: 8)
                        .cornerRadius(20)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 30, height: 8)
                        .cornerRadius(20)
                }
                .padding(.bottom, 75)
                
                
                HStack(spacing: 20) {
                    NavigationLink(destination: SignUp()){
                        Text("Skip")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                            .frame(width: 120, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.pink, lineWidth: 2)
                            )
                        
                    }
                    
                    
                    
                    NavigationLink(destination: Onboarding_2()){
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 50)
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    Onboarding_1()
}
