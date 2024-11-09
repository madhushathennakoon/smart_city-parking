//
//  SelectVehicle.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct SelectVehicle: View {
    @State private var selectedVehicle = 0
    var body: some View {
        VStack(alignment: .leading) {
                           HStack {
                               Text("Select Vehicle")
                                   .font(.title2)
                                   .fontWeight(.bold)
                               
                               Spacer()
                               
                               Button(action: {
                                   // Add
                               }) {
                                   Image("AddIcon")
                                       .resizable()
                                       .frame(width: 25, height: 25)
                               }
                           }
                           .padding(.horizontal,20)
                    
                    
                           
                           // Vehicle List
                           ScrollView {
                               VStack(spacing: 15) {
                                   ForEach(0..<5) { index in
                                       VehicleRow(isSelected: selectedVehicle == index)
                                           .onTapGesture {
                                               selectedVehicle = index
                                           }
                                   }
                               }
                               .padding(.horizontal)
                           }
                           .padding(.top)
                           
                           Spacer()
                           
                           // Continue Button
                           Button(action: {
                               // Continue action
                           }) {
                               Text("Continue")
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



               // Vehicle Row View
               struct VehicleRow: View {
                   var isSelected: Bool
                   
                   var body: some View {
                       HStack {
                           Image("CarBlue1")
                               .resizable()
                               .frame(width: 50, height: 50)
                               .padding(.trailing, 10)
                           
                           VStack(alignment: .leading) {
                               Text("Toyota Fortuner")
                                   .font(.headline)
                               Text("SUV - CAK 9191")
                                   .font(.subheadline)
                                   .foregroundColor(.gray)
                           }
                           
                           Spacer()
                           
                           Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                               .foregroundColor(isSelected ? .blue : .gray)
                       }
                       .padding()
                       .background(Color.gray.opacity(0.1))
                       .cornerRadius(10)
    }
}

#Preview {
    SelectVehicle()
}
