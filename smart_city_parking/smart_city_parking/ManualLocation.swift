//
//  ManualLocation.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-07.
//

import SwiftUI

struct ManualLocation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                   
                    HStack(spacing: 20) {
                        Button(action: {
                            // Add
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                        }
                        Text("Enter Your Location")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    
                    
                    HStack(spacing: 20) {
                        Image("Search")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("Search")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal,20)
                    .padding(.top,30)
            
            
                    
                   
                    HStack(spacing: 20) {
                        Image("LocationBlue")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Set location on map")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal,22)
                    .padding(.top,12)
                    
                    Divider()
                .padding(.horizontal,20)
                        
                    
                    
                    Text("Favourites")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,22)
                        .padding(.top,10)
                    
                   
                    VStack(alignment: .leading, spacing: 30) {
                        LocationRow(name: "One Gall Face", address: "1A Centre Road, Colombo 00200")
                        LocationRow(name: "Havelock City Mall", address: "324-10 Havelock Rd, Colombo 00500")
                        LocationRow(name: "Colombo City Centre", address: "137 Sir James Pieris Mawatha, Colombo 00200")
                    }
                    .padding(.horizontal,22)
                    .padding(.top,15)
                    
                    Spacer()
                }
                .padding(.top)
            }
        }

        struct LocationRow: View {
            var name: String
            var address: String
            
            var body: some View {
                HStack(spacing: 20) {
                    Image("LocationBlue")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.bottom,5)
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(address)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }
    }
}

#Preview {
    ManualLocation()
}
