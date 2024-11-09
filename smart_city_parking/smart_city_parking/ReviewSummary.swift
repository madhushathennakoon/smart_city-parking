//
//  ReviewSummary.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct ReviewSummary: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Review Summary")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal,20)
            
            
            
            
            VStack(spacing: 15) {
                NavigationLink(destination: ParkingDetails()){
                    ParkingInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                }
            }
            .padding(.horizontal,20)
            .padding([.top, .bottom],10)
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Booking")
                    .font(.headline)
                    .padding(.top)
                
                BookingDetailRow(icon: "clock", label: "Arriving Time", value: "08.00 AM")
                BookingDetailRow(icon: "clock", label: "Exit Time", value: "12.00 AM")
                BookingDetailRow(icon: "car.fill", label: "Vehicle", value: "Toyota Vits (CAR)")
                BookingDetailRow(icon: "ticket.fill", label: "Slot", value: "B2")
            }
            .padding(.horizontal,20)
            .padding(.bottom)
            
            Divider()
                .padding(.horizontal)
                .padding(.bottom)
            
            // Price Details Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Price details")
                    .font(.headline)
                
                PriceDetailRow(label: "Amount", value: "Rs.400")
                PriceDetailRow(label: "Total Hours", value: "02h")
                PriceDetailRow(label: "Fees", value: "Rs.150")
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
                .padding(.horizontal)
                .padding(.bottom)
            
            // Total Price
            HStack {
                Text("Total Price")
                    .font(.headline)
                Spacer()
                Text("Rs.550")
                    .font(.headline)
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
            Spacer()
            
            // Payment Button
            Button(action: {
                // Payment action
            }) {
                Text("Payment")
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

// Booking Detail Row
struct BookingDetailRow: View {
    var icon: String
    var label: String
    var value: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.bold)
        }
    }
}

// Price Detail Row
struct PriceDetailRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.bold)
        }
    }
}


struct ParkingInfoCard: View {
    var imgName: String
    var parkingCTGY: String
    var rating: String
    var parkingName: String
    var price: String
    var slot: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(imgName)
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(parkingCTGY)
                        .font(.footnote)
                        .bold()
                        .padding(5)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image("Star")
                        .resizable()
                        .frame(width: 17, height: 17)
                    Text(rating)
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.bottom,45)
                
                HStack{
                    Text(parkingName)
                        .font(.caption)
                        .bold()
                    Spacer()
                    
                    Text("Rs." + price)
                        .foregroundColor(.red)
                        .font(.caption)
                        .bold()
                        .padding(.trailing,-6)
                    Text("/hr")
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                }
                .padding(.top,-30)
                
                
                HStack{
                    Image("CarBlue")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(slot + " Spots")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                }
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}






#Preview {
    ReviewSummary()
}
