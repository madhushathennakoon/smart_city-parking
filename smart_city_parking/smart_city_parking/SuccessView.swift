//
//  SuccessView.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct SuccessView: View {
    
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.pink.opacity(0.2))
                        .frame(width: 150, height: 150)
                    Image("Success")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 110, height: 110)
                }
                
                
                Text("Successful!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                NavigationLink(destination: MainView(), isActive: $navigateToHome) {
                    EmptyView()
                }
                
                
                
                
                Button(action: {
                    navigateToHome = true
                }) {
                    Text("Back to Home")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                .padding(.horizontal,20)
                
                
                Spacer()
            }
            .padding()
            
            
            
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    SuccessView()
}
