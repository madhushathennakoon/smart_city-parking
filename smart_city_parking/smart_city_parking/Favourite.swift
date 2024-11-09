//
//  Favourite.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct Favourite: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Favourite ")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal,20)
            
            
            
            ScrollView{
                VStack(spacing: 15) {
                    NavigationLink(destination: ParkingDetails()){
                        FavouriteInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                    }
                    NavigationLink(destination: ParkingDetails()){
                        FavouriteInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                    }
                    NavigationLink(destination: ParkingDetails()){
                        FavouriteInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                    }
                    NavigationLink(destination: ParkingDetails()){
                        FavouriteInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                    }
                    NavigationLink(destination: ParkingDetails()){
                        FavouriteInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: "ABCDEFG", price: "100", slot: "28"  )
                    }
                }
                .padding(.horizontal,20)
                .padding(.top,40)
            }

            
        }
        Spacer()
        
    }
}


struct FavouriteInfoCard: View {
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
    Favourite()
}
