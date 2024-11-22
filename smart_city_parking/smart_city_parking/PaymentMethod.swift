//
//  PaymentMethod.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct PaymentMethod: View {
    @State private var selectedPaymentMethod = "Credit/Debit Card"
    @State private var navigateToConfirmation = false 
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Payment Method")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    PaymentOptionRow(
                        title: "Credit/Debit Card",
                        isSelected: selectedPaymentMethod == "Credit/Debit Card"
                    ) {
                        selectedPaymentMethod = "Credit/Debit Card"
                    }
                    
                    if selectedPaymentMethod == "Credit/Debit Card" {
                        
                        Image("CreditCard")
                            .resizable()
                            .frame(width: 320, height: 180)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        Text("Add New Card")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.pink, lineWidth: 1)
                            )
                            .padding(.horizontal)
                    }
                    
                    PaymentOptionRow(
                        title: "PayPal",
                        isSelected: selectedPaymentMethod == "PayPal"
                    ) {
                        selectedPaymentMethod = "PayPal"
                    }
                    
                    PaymentOptionRow(
                        title: "Apple Pay",
                        isSelected: selectedPaymentMethod == "Apple Pay"
                    ) {
                        selectedPaymentMethod = "Apple Pay"
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
                
               
                NavigationLink(destination: SuccessView(), isActive: $navigateToConfirmation) {
                    EmptyView()
                }
                
                
                Button(action: {
                    
                    navigateToConfirmation = true
                    bookingNotification()
                }) {
                    Text("Pay Now")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
            }
            .padding(.top)
        }
    }
    
    // Payment Option Row View
    struct PaymentOptionRow: View {
        var title: String
        var isSelected: Bool
        var action: () -> Void
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.body)
                Spacer()
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .blue : .gray)
                    .onTapGesture {
                        action()
                    }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

// Schedule a simple local notification
func bookingNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Booking Successful!"
    content.body = "You have successfully Booked in your Slot"
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


#Preview {
    PaymentMethod()
}
