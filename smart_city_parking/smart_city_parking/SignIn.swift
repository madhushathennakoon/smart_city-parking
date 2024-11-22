
//
//  SignIn.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-06.
//

import SwiftUI
import FirebaseAuth
import LocalAuthentication
import UserNotifications

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToLocation: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isAuthenticated: Bool = false

    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var bookingData: BookingData

    // LocalAuthentication instance for Face ID
    let biometricAuthenticator = BiometricAuthenticator()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text("Login Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)

                    Text("Please fill in the details and create your Parkspot account.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 30)

                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Email Or Phone Number")
                            .font(.headline)
                        HStack {
                            TextField("Enter your email", text: $email)

                            if email.count != 0 {
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
                        HStack {
                            SecureField("Enter your password", text: $password)

                            if password.count != 0 {
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
                            .foregroundColor(.blue)
                            .padding(.leading, 250)
                            .padding(.top, 15)
                    }
                }
                .padding(.horizontal, 20)

                Button(action: {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error.localizedDescription)
                            alertMessage = "Login failed: \(error.localizedDescription)"
                            showAlert = true
                            return
                        }

                        if authResult != nil {
                            navigateToLocation = true
                            authViewModel.userID = authResult?.user.uid
                            loginNotification()
                        }
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 13)
                
                // Face ID Button
                Button(action: {
                    biometricAuthenticator.authenticate { result in
                        switch result {
                        case .success:
                            isAuthenticated = true
                            navigateToLocation = true
                            loginNotification()
                        case .failure(let error):
                            alertMessage = error.localizedDescription
                            showAlert = true
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "faceid")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("Use Face ID")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .frame(width: 320, height: 20)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                }
                .padding(.horizontal, 20)
                .padding(.top, 0)

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
                                .padding(.trailing, 4)
                            Text("Sign Up with Google")
                                .font(.headline)
                                .padding(.leading, 5)
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
                                .padding(.trailing, 10)
                            Text("Sign Up with Apple")
                                .font(.headline)
                                .padding(.trailing, 10)
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
                    NavigationLink(destination: SignUp()) {
                        Text("Register")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.top, 20)

                
            }
            .padding(.vertical)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToLocation) {
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

struct BiometricAuthenticator {

    //authenticate using Face ID
    func authenticate(completion: @escaping (Result<Void, Error>) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Log in with Face ID") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        completion(.success(()))
                    } else {
                        completion(.failure(authenticationError ?? NSError(domain: "", code: -1, userInfo: nil)))
                    }
                }
            }
        } else {
            completion(.failure(error ?? NSError(domain: "", code: -1, userInfo: nil)))
        }
    }
}

// local notification
func loginNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Login Successful!"
    content.body = "You have successfully logged in to the Parkspot app."
    content.sound = .default

    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
   
    let request = UNNotificationRequest(identifier: "TestNotification", content: content, trigger: trigger)
    
   
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled.")
        }
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

