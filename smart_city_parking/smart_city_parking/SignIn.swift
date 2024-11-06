//
//  SignIn.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI

struct SignIn: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing:8){
                Text("Login Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,20)

                Text("Please filled below details and create you parkspot account.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,20)
            }
            .padding(.bottom,30)
                    
                        

            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("Email Or Phone Number")
                        .font(.headline)
                    TextField("Enter your email or phone", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)

                    Text("Password")
                        .font(.headline)
                    SecureField("Enter your password", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Text("Forgot password")
                        .font(.footnote)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 250)
                        .padding(.top, 15)
                        }
                    }
                    .padding(.horizontal,20)
                    
                    

                    
                    Button(action: {
                        // Create
                    }) {
                        Text("Login ")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal,20)
                    .padding(.top,43)

                    
                    Text("Or using other Method")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        

                    
                    VStack(spacing: 10) {
                        Button(action: {
                            // Google sign-up action
                        }) {
                            HStack {
                                Image("Google")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing,4)
                                Text("Sign Up with Google")
                                    .font(.headline)
                                    .padding(.leading,5)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Button(action: {
                            // Apple sign-up action
                        }) {
                            HStack {
                                Image("Apple")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing,10)
                                Text("Sign Up with Apple")
                                    .font(.headline)
                                    .padding(.trailing,10)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    .padding(.horizontal, 20)
      
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            // Login action
                        }) {
                            Text("Register")
                                .foregroundColor(.pink)
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.vertical)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignIn()
}
