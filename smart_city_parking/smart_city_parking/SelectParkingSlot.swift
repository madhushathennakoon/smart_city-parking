//
//  SelectParkingSlot.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct SelectParkingSlot: View {
    
    @State private var slots = [
        Slot(number: "A0"),
        Slot(number: "A1"),
        Slot(number: "A2"),
        Slot(number: "A3"),
        Slot(number: "A4"),
        Slot(number: "A5")
        
    ]
    
    
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
            
            
            ScrollView {
                VStack(spacing: 15) {
//                    ForEach(slots, id: \.self) { Slot in
//                        SlotRow(slot: Slot)
//                            
//                            
//                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            
            
            Spacer()
            
            
        }
        .padding(.top)
    }
}


struct SlotRow: View {
    var vehicle: Vehicle
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image("CarBlue1") // Placeholder image, replace with your actual image
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(vehicle.name)
                    .font(.headline)
                Text(vehicle.number)
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



struct Slot: Identifiable, Hashable {
    var id: String { number } 
    var number: String
}






#Preview {
    SelectParkingSlot()
}
