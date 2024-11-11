//
//  Location.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI

struct Location: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.pink.opacity(0.2))
                    .frame(width: 150, height: 150)
                Image("Location")
                    .resizable()
                    .foregroundColor(.pink)
                    .frame(width: 110, height: 110)
            }
            
            
            Text("What is Your Location")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            
            Text("We need to know location in order to suggest near by service.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,40)
            
            
            Spacer()
           
            
            NavigationLink(destination: MainView()){
                Text("Allow Location Access")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal,20)
            
            
            NavigationLink(destination: ManualLocation()){
                Text("Enter Location Manually")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .padding(.horizontal,20)
            
            
            Spacer()
        }
        .padding()
        
        
        
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Location()
}
