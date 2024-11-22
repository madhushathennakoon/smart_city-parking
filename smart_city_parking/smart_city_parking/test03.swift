import SwiftUI

struct FaceIDView: View {
    
    @StateObject private var authManager = AuthenticationManager()
    
    var body: some View {
        VStack {
            if authManager.isAuthenticated {
                // If the user is authenticated, show a welcome message
                Text("Welcome! You are authenticated.")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            } else {
                // If the user is not authenticated, show the Face ID prompt
                VStack {
                    Text("Please authenticate using Face ID")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        authManager.authenticateWithFaceID()
                    }) {
                        Text("Authenticate with Face ID")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    // Display error message if authentication failed
                    if let errorMessage = authManager.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
        .padding()
    }
}


#Preview {
    FaceIDView()
}
