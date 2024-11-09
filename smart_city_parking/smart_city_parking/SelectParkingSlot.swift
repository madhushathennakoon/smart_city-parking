//
//  SelectParkingSlot.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct SelectParkingSlot: View {
    @State private var selectedVehicle = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select Parking Slot")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal,20)
            
            
            Text("Available slots 10")
                .font(.subheadline)
                .padding(5)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .cornerRadius(5)
                .padding(.horizontal,20)
            
            VStack {
                HStack(spacing: 118) {
                    Text("A")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(5)
                    
                    Text("Entry")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom,90)
                    
                    Text("B")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal,20)
            .padding(.top,30)
            
            
            Spacer()
            
            
        }
        .padding(.top)
    }
}










#Preview {
    SelectParkingSlot()
}
