//
//  PaymentMethod.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct PaymentMethod: View {
    @State private var selectedPaymentMethod = "Credit/Debit Card"
    var body: some View {
        VStack(alignment: .leading) {
                   
                   HStack {
                       Text("Payment Method")
                           .font(.title2)
                           .fontWeight(.bold)
                       
                       Spacer()
                   }
                   .padding(.horizontal,20)
                   
                   
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
                               
                               .frame(width:320,height: 180)
                               .cornerRadius(10)
                               .padding(.horizontal)
                           
                           // Add New Card Button
                           Button(action: {
                               // Add new card action
                           }) {
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
                           }
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
                   
                   // Pay Now Button
                   Button(action: {
                       // Pay Now action
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



#Preview {
    PaymentMethod()
}
