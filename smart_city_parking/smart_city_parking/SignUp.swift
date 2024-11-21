//
//  SignUp.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userID: String? = nil
}

struct SignUp: View {
    @State private var username: String = ""
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
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal,20)
                    
                    Text("Please fill in the details below to create your ParkSpot account.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,20)
                }
                .padding(.bottom,15)
                
                
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Username")
                            .font(.headline)
                        HStack{
                            TextField("Enter your username", text: $username)
                            
                            if(username.count != 0){
                                Image(systemName: "checkmark")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        
                        Text("Email Or Phone Number")
                            .font(.headline)
                        
                        HStack{
                            TextField("Enter your email or phone", text: $email)
                            
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
                        
                    }
                }
                .padding(.horizontal,20)
                
                
                Button(action: {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                      
                        if let error = error{
                            print(error.localizedDescription)
                            alertMessage = "registration failed: \(error.localizedDescription)"
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
                    Text("Create Account")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal,20)
                .padding(.top,13)
                
                
                
                
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
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignIn()){
                        Text("Login")
                            .foregroundColor(.pink)
                    }
                    
                    
                }
                .padding(.top, 20)
            }
            .padding(.vertical)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToLocation){
                Verification_1()
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

//#Preview {
//    SignUp()
//}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(AuthViewModel())
            .environmentObject(ParkName())
            .environmentObject(VehicleModel())
            .environmentObject(SlotName())
            .environmentObject(BookingData())
            
    }
}
