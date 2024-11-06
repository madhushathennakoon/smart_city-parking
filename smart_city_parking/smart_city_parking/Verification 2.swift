//
//  Verification 2.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI

struct Verification_2: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Add
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal,20)
                .padding(.top,20)
                
                
                Image("Success")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 130)
                    .background(Circle().fill(Color.pink.opacity(0.2)))
                    .padding(.top,40)
                
                
                Text("Register Success ")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Text("Congratulation your account already created. Please login to amazing experience.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,40)
                    .padding(.top, 2)
                
                
                NavigationLink(destination: SignIn()){
                    Text("Go to Homepage")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                
                
                .padding(.horizontal,30)
                .padding(.top,280)
                
                Spacer()
                
                
                
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    Verification_2()
}
