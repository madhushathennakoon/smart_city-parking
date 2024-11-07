//
//  Verification 1.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI

struct Verification_1: View {
    var body: some View {
            VStack(spacing: 20) {
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Add
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                    Text("Verification")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal,20)
                .padding(.top,20)

                ZStack{
                    Circle()
                        .fill(Color.pink.opacity(0.2))
                        .frame(width: 150, height: 150)
                    Image("Verification")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                        .background(Circle().fill(Color.pink.opacity(0.2)))
                        
                }
                .padding(.top,30)
                
                
                
                Text("Verification Code")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack{
                    Text("We have sent the code verification to")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Text("abcd*******@gmail.com")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                
                HStack(spacing: 15) {
                    TextField("", text: .constant(""))
                        .frame(width: 50, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .keyboardType(.numberPad)
                    TextField("", text: .constant(""))
                        .frame(width: 50, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .keyboardType(.numberPad)
                    TextField("", text: .constant(""))
                        .frame(width: 50, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .keyboardType(.numberPad)
                    TextField("", text: .constant(""))
                        .frame(width: 50, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        .keyboardType(.numberPad)
                        
                }
                .padding(.top,10)
                
                

               
                Button(action: {
                    // Add
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                }
                .padding(.horizontal,30)
                .padding(.top,180)
                
                Spacer()

                
                HStack {
                    Text("Don't receive the code?")
                        .foregroundColor(.gray)
                    Button(action: {
                        // Add
                    }) {
                        Text("Resend")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true)
            
        }
}

#Preview {
    Verification_1()
}
