//
//  Home.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-07.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                            Image("LocationBlack")
                            .resizable()
                            .frame(width: 25, height: 25)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Location")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                Text("Ward Place, Colombo 7")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                }
                                Spacer()
                            }
                            .padding(.horizontal,20)
                            .padding(.top,15)
                            
                           
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
                            .padding(.top, 20)
                            
                            
                            HStack {
                                Text("Category")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("See All")
                                    .foregroundColor(.pink)
                                    .font(.footnote)
                            }
                            .padding(.horizontal,20)
                            .padding(.top,20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    CategoryIcon(name: "Car", icon: "Car")
                                    CategoryIcon(name: "Bike", icon: "Bike")
                                    CategoryIcon(name: "Truck", icon: "Truck")
                                    CategoryIcon(name: "Bus", icon: "Bus")
                                    CategoryIcon(name: "Truck", icon: "Car")
                                    CategoryIcon(name: "Truck", icon: "Bike")
                                    CategoryIcon(name: "Truck", icon: "Truck")
                                }
                                .padding(.horizontal,20)
                                .padding(.top,10)
                            }
                    
                            
                    
                          HStack{
                            Text("Popular Parking")
                              .font(.title3)
                              .fontWeight(.bold)
                            Spacer()
                            Text("See All")
                              .foregroundColor(.pink)
                              .font(.footnote)
                          }
                          .padding(.horizontal,20)
                          .padding(.top,20)
                            
                           ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ParkingCard(imgName: "ParkingImg", parkingCTGY: "Car Parking", parkingName: "Parking Name", price: "100", rating: "4.8", slot: "28 Spots")
                                    ParkingCard(imgName: "ParkingImg", parkingCTGY: "Car Parking", parkingName: "Abcd", price: "100", rating: "4.8", slot: "28 Spots")
                                    ParkingCard(imgName: "ParkingImg", parkingCTGY: "Car Parking", parkingName: "Abcd", price: "100", rating: "4.8", slot: "28 Spots")
                                    
                                    
                                }
                                .padding(.horizontal,20)
                                .padding([.top, .bottom],10)

                            }
                    
                            
                    HStack{
                        Text("Nearby Parking")
                        .font(.title3)
                        .fontWeight(.bold)
                      Spacer()
                      Text("See All")
                        .foregroundColor(.pink)
                        .font(.footnote)
                    }
                    .padding(.horizontal,20)
                    .padding(.top,20)
                            
                    VStack(spacing: 15) {
                        ParkingListRow()
                        ParkingListRow()
                    }
                    .padding(.horizontal,20)
                    .padding([.top, .bottom],10)
                    
                    
                    
         }
     }

    
            // Bottom Navigation - stick it to the bottom
                      Divider()
                      HStack {
                          BottomNavItem(icon: "house.fill", title: "Home")
                          Spacer()
                          BottomNavItem(icon: "magnifyingglass", title: "Explore")
                          Spacer()
                          BottomNavItem(icon: "calendar", title: "Booking")
                          Spacer()
                          BottomNavItem(icon: "heart", title: "Favourite")
                          Spacer()
                          BottomNavItem(icon: "person", title: "Profile")
                      }
                      .padding()
                      .background(Color.white) // Ensure the navigation bar has a background color
                  }
                  .ignoresSafeArea(edges: .bottom) // Allow the VStack to extend to the bottom edge
              }
          }

          // Subviews for Home Page Components
          struct CategoryIcon: View {
              var name: String
              var icon: String
              var body: some View {
                  VStack {
                      Image(icon)
                          .resizable()
                          .frame(width: 40, height: 40)
                          .padding()
                          .background(Color.blue)
                          .cornerRadius(10)
                      Text(name)
                          .font(.subheadline)
                          .foregroundColor(.black)
                  }
              }
          }

          struct SectionView: View {
              var title: String
              var body: some View {
                  HStack {
                      Text(title)
                          .font(.headline)
                          .fontWeight(.bold)
                      Spacer()
                      Text("See All")
                          .foregroundColor(.pink)
                          .fontWeight(.bold)
                  }
                  .padding(.horizontal,20)
                  .padding(.top,30)
              }
          }

          struct ParkingCard: View {
              var imgName: String
              var parkingCTGY: String
              var parkingName: String
              var price: String
              var rating: String
              var slot: String
              
              
              var body: some View {
                  VStack(alignment: .leading, spacing: 10) {
                      Image(imgName)
                          .resizable()
                          .frame(width: 190, height: 150)
                          .cornerRadius(10)
                      Text(parkingCTGY)
                          .font(.caption)
                          .padding(5)
                          .background(Color.blue.opacity(0.2))
                          .cornerRadius(5)
                          .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                      
                      HStack {
                          Text(parkingName)
                              .font(.system(size: 13))
                              .bold()
                          Spacer()
                          Text("Rs." + price)
                              .foregroundColor(.red)
                              .font(.system(size: 13))
                              .bold()
                              .padding(.trailing,-6)
                          Text("/ hr")
                              .foregroundColor(.gray)
                              .font(.system(size: 13))
                          }
                      .padding(.top,9)
                      
                      Divider()
                          .background(Color(.black))
                          
                          
                      
                      HStack{
                          Image("Star")
                              .resizable()
                              .frame(width: 15, height: 15)
                          Text(rating)
                              .font(.caption)
                              .foregroundColor(.black)
                          Spacer()
                          
                          Image("CarBlue")
                              .resizable()
                              .frame(width: 25, height: 25)
                          Text(slot)
                              .font(.caption)
                              .foregroundColor(.black)
                      }
                      
                  }
                  .frame(width: 180)
                  .padding()
                  .background(Color.white)
                  .cornerRadius(10)
                  .shadow(radius: 5)
              }
          }

          struct ParkingListRow: View {
              var body: some View {
                  HStack(spacing: 15) {
                      Image("ParkingImg2")
                          .resizable()
                          .frame(width: 125, height: 125)
                          .cornerRadius(10)
                      VStack(alignment: .leading, spacing: 10) {
                          HStack {
                              Text("Car Parking")
                                  .font(.caption)
                                  .padding(5)
                                  .background(Color.blue.opacity(0.2))
                                  .cornerRadius(5)
                                  .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                              Spacer()
                              Image("Star")
                                  .resizable()
                                  .frame(width: 15, height: 15)
                              Text("4.8")
                                  .font(.caption)
                                  .foregroundColor(.black)
                              }
                          
                          
                          HStack {
                              Text("Rs.100/hr")
                                  .foregroundColor(.pink)
                              Spacer()
                              Image(systemName: "star.fill")
                                  .foregroundColor(.yellow)
                              Text("4.8")
                                  .font(.caption)
                              Image(systemName: "car.fill")
                              Text("28 Spots")
                                  .font(.caption)
                                  .foregroundColor(.gray)
                          }
                      }
                      Spacer()
                  }
                  .padding()
                  .background(Color.white)
                  .cornerRadius(10)
                  .shadow(radius: 5)
              }
          }

          struct BottomNavItem: View {
              var icon: String
              var title: String
              
              var body: some View {
                  VStack {
                      Image(systemName: icon)
                          .font(.title3)
                      Text(title)
                          .font(.caption)
                  }
                  .foregroundColor(.black)
              }
          }



#Preview {
    Home()
}
