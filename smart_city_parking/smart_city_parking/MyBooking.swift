//
//  MyBooking.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct MyBooking: View {
    @State private var selectedT = "Ongoing"
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("My Booking")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal,20)
            
            
            HStack {
                Button(action: {
                    selectedT = "Ongoing"
                }) {
                    Text("Ongoing")
                        .fontWeight(selectedT == "Ongoing" ? .bold : .regular)
                        .foregroundColor(selectedT == "Ongoing" ? .blue : .gray)
                }
                
                Spacer()
                
                Button(action: {
                    selectedT = "Completed"
                }) {
                    Text("Completed")
                        .fontWeight(selectedT == "Completed" ? .bold : .regular)
                        .foregroundColor(selectedT == "Completed" ? .blue : .gray)
                }
            }
            .padding(.horizontal,20)
            .padding(.top,25)
            
            Divider()
                .padding(.horizontal,20)
                .padding(.top,5)
            
            
            ScrollView {
                if selectedT == "Ongoing"{
                    VStack(spacing: 35) {
                        BookingCardOngoing(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "Ongoing", price: "100", slot: "28"  )
                        BookingCardOngoing(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "Ongoing", price: "100", slot: "28"  )
                        BookingCardOngoing(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "Ongoing", price: "100", slot: "28"  )
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)
                }else{
                    VStack(spacing: 35) {
                        BookingCardCompleted(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "Completed", price: "100", slot: "28"  )
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)
                }
                
            }
            
            Spacer()
            
            
        }
        .padding(.top)
        
    }
}



struct BookingCardOngoing: View {
    var imgName: String
    var parkingCTGY: String
    var rating: String
    var parkingName: String
    var price: String
    var slot: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
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
        
        
        HStack {
            
            Button(action: {
                //action
            }) {
                Text("Timer")
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.pink, lineWidth: 2)
                    )
            }
            Button(action: {
                //action
            }) {
                Text("E-Ticket")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding(.top, -15)
 
    }
}


struct BookingCardCompleted: View {
    var imgName: String
    var parkingCTGY: String
    var rating: String
    var parkingName: String
    var price: String
    var slot: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
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
    MyBooking()
}
