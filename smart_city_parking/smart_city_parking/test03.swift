import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Local Notification Example")
                .font(.largeTitle)
                .padding()
            
            Button("Send Notification") {
                scheduleNotification()
            }
            .padding()
        }
    }
    
//    // Request permission for sending notifications
//    func requestNotificationPermission() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                print("Notification permission granted.")
//            } else {
//                print("Notification permission denied.")
//            }
//        }
//    }
    
    // Schedule a simple local notification
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "This is a test notification."
        content.sound = .default

        // Trigger notification after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Create a notification request with a unique identifier
        let request = UNNotificationRequest(identifier: "TestNotification", content: content, trigger: trigger)
        
        // Add the notification request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled.")
            }
        }
    }
}


#Preview {
    ContentView()
}
