//
//  Onboarding 3.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI

struct Onboarding_3: View {
    var body: some View {
        NavigationView{
            VStack {
                
                Image("Onboarding 3")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width:330,height: 350)
                    .padding(.top, 100)
                
                
                Text("No More Wating Tickets")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 36)
                
                
                Text("Enjoy peace of mind with our verified parking spots and secure payment options.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,40)
                    .padding(.top, 2)
                
                Spacer()
                
                
                HStack(spacing: 10) {
                    
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 30, height: 8)
                        .cornerRadius(20)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 30, height: 8)
                        .cornerRadius(20)
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 45, height: 8)
                        .cornerRadius(20)
                }
                .padding(.bottom, 75)
                
                
                HStack(spacing: 20) {
                    NavigationLink(destination: Verification_2()){
                        Text("Get Started")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 240, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 50)
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboarding_3()
}
