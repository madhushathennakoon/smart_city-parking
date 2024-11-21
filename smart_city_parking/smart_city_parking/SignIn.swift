//
//  SignIn.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToLocation: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var bookingData: BookingData
    
    
    var body: some View {
        NavigationStack{
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
                        HStack{
                            TextField("Enter your username", text: $email)
                            
                            if(email.count != 0){
                                Image(systemName: "checkmark")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        Text("Password")
                            .font(.headline)
                        HStack{
                            SecureField("Enter your password", text: $password)
                            
                            if(password.count != 0){
                                Image(systemName: "checkmark")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                        }
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
                    Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                        if let error = error{
                            print(error.localizedDescription)
                            alertMessage = "Login failed: \(error.localizedDescription)"
                            showAlert = true
                            return
                        }
                        
                        if authResult != nil {
                            
                            navigateToLocation = true
                            print(authResult?.user.uid as Any)
                            authViewModel.userID = authResult?.user.uid
                            
                        }
                    }
                    
                    
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
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
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
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    }
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUp()){
                        Text("Register")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.top, 20)
                
                
            }
            .padding(.vertical)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToLocation){
                Location()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Login Status"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    SignIn()
        .environmentObject(AuthViewModel())
        .environmentObject(ParkName())
        .environmentObject(VehicleModel())
        .environmentObject(SlotName())
        .environmentObject(BookingData())
}
