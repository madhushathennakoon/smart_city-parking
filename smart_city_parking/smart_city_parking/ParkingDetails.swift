//
//  ParkingDetails.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-08.
//

import SwiftUI

struct ParkingDetails: View {
    @State private var selectedTab = "About"
    
    var body: some View {
        VStack(alignment: .leading) {
                         
                          Image("ParkingImg3")
                              .resizable()
                              .frame(width: 350, height: 180)
                              .cornerRadius(10)
                  
                              .padding(.horizontal,20)
                              
                          
                          
                          VStack(alignment: .leading, spacing: 8) {
                              HStack {
                                  Text("Car Parking")
                                      .font(.caption)
                                      .padding(5)
                                      .background(Color.blue.opacity(0.2))
                                      .cornerRadius(5)
                                      .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                  Spacer()
                                  HStack(spacing: 4) {
                                      Image("Star")
                                          .resizable()
                                          .frame(width: 16, height: 16)
                                      Text("4.8")
                                          .font(.caption)
                                          .fontWeight(.bold)
                                      Text("(300 reviews)")
                                          .foregroundColor(.gray)
                                          .font(.caption)
                                  }
                                  
                              }
                              .padding(.top,15)
                              
                              
                             
                              
                              HStack{
                                  VStack(alignment: .leading){
                                      Text("ParkSecure")
                                          .font(.title3)
                                          .fontWeight(.bold)
                                      
                                      Text("137 Sir James Pieris Mawatha, Colombo 00200")
                                          .foregroundColor(.gray)
                                          .font(.caption)
                                  }
                                  Spacer()
                                  VStack{
                                      Image("LocationBlue")
                                          .resizable()
                                          .frame(width: 25, height: 25)
                                          .padding(.bottom,5)
                                  }
                                  
                                  }
                              .padding(.top,10)
                              
                          }
                          .padding(.horizontal,20)
                  
                
                          
                  VStack {
                              
                              HStack {
                                  Button(action: {
                                      selectedTab = "About"
                                  }) {
                                      Text("About")
                                          .fontWeight(.bold)
                                          .foregroundColor(selectedTab == "About" ? .blue : .gray)
                                  }
                                  Spacer()
                                  Button(action: {
                                      selectedTab = "Gallery"
                                  }) {
                                      Text("Gallery")
                                          .fontWeight(.bold)
                                          .foregroundColor(selectedTab == "Gallery" ? .blue : .gray)
                                  }
                                  Spacer()
                                  Button(action: {
                                      selectedTab = "Review"
                                  }) {
                                      Text("Review")
                                          .fontWeight(.bold)
                                          .foregroundColor(selectedTab == "Review" ? .blue : .gray)
                                  }
                              }
                              .padding(.horizontal, 20)
                              .padding(.top, 30)
                              
                              Divider()
                                  .padding(.horizontal)
                              
                              
                              if selectedTab == "About" {
                                  VStack(alignment: .leading){
                                      Text("About Content")
                                          .font(.headline)
                                          .padding(.top, 10)
                                          
                                      
                                      Text("This is the About section content.")
                                          .font(.subheadline)
                                          .foregroundColor(.gray)
                                          .padding(.top, 2)
                                  }
                                  .padding(.horizontal, -175)
                              } else if selectedTab == "Gallery" {
                                  VStack(alignment: .leading) {
                                      Text("Gallery Content")
                                          .font(.headline)
                                          .padding(.top, 10)
                                          
                                      
                                      Text("Here you can display your gallery images.")
                                          .font(.body)
                                          .foregroundColor(.gray)
                                          
                                          .padding(.top, 5)
                                  }
                                  .padding(.horizontal, -175)
                              } else if selectedTab == "Review" {
                                  VStack(alignment: .leading) {
                                      Text("Review Content")
                                          .font(.headline)
                                          .padding(.top, 10)
                                          
                                      
                                      Text("User reviews or other content can go here.")
                                          .font(.body)
                                          .foregroundColor(.gray)
                                          
                                          .padding(.top, 5)
                                  }
                                  .padding(.horizontal, -175)
                              }
                          
                              
                      Spacer()
                          }
                  
                          
                          
                          Button(action: {
                              // Action
                          }) {
                              Text("Book Slot")
                                  .fontWeight(.bold)
                                  .frame(maxWidth: .infinity)
                                  .padding()
                                  .background(Color.blue)
                                  .foregroundColor(.white)
                                  .cornerRadius(10)
                          }
                          .padding(.horizontal,20)
                          .padding(.bottom)
                          
                          
                          .padding()
                      }
                      .padding(.top)

    }
}

#Preview {
    ParkingDetails()
}
