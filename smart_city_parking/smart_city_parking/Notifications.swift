//
//  Notifications.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct Notifications: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
              HStack {
                    
                    Text("Notification")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal,20)
                
                
                Text("Today")
                    .font(.headline)
                    .padding(.horizontal,20)
                    .padding(.top, 10)
                
                VStack(spacing: 10) {
                    NotificationCard(type: "Payment Successful", message: "Lorem Ipsum lorem ipsum", icon: "checkmark.circle.fill", iconColor: .green)
                    NotificationCard(type: "Booking Canceled", message: "Lorem Ipsum lorem ipsum", icon: "xmark.circle.fill", iconColor: .red)
                }
                .padding(.horizontal,20)
                
                
                
                Text("Yesterday")
                    .font(.headline)
                    .padding(.horizontal,20)
                    .padding(.top, 20)
                
                VStack(spacing: 10) {
                    NotificationCard(type: "Payment Successful", message: "Lorem Ipsum lorem ipsum", icon: "checkmark.circle.fill", iconColor: .green)
                    NotificationCard(type: "Booking Canceled", message: "Lorem Ipsum lorem ipsum", icon: "xmark.circle.fill", iconColor: .red)
                    NotificationCard(type: "Booking Canceled", message: "Lorem Ipsum lorem ipsum", icon: "xmark.circle.fill", iconColor: .red)
                }
                .padding(.horizontal,20)
                
                Spacer()
                
                
            }
            
        }        .padding(.top)
    }
}


struct NotificationCard: View {
    var type: String
    var message: String
    var icon: String
    var iconColor: Color
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(iconColor)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(type)
                    .font(.body)
                    .fontWeight(.bold)
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}




#Preview {
    Notifications()
}
