import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var errorMessage: String? = nil
    
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?
        
        // Check if the device supports biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Try to authenticate with biometrics
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // Successfully authenticated
                        self.isAuthenticated = true
                        self.errorMessage = nil
                    } else {
                        // Authentication failed
                        self.isAuthenticated = false
                        self.errorMessage = "Authentication failed. Please try again."
                    }
                }
            }
        } else {
            // Device does not support biometric authentication
            self.errorMessage = "Biometric authentication not available."
        }
    }
}




