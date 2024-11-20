//
//  SelectParkingSlot.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

class SlotName: ObservableObject {
    @Published var selectedSlot: spot? = nil
}

struct SelectParkingSlot: View {
    
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var bookingData: BookingData
    
    @State private var spots1 = [
        spot(name: "A0 "),
        spot(name: "A1 "),
        spot(name: "A2 "),
        spot(name: "A3 "),
        spot(name: "A4 "),
        spot(name: "A5 "),
        spot(name: "A6 "),
        spot(name: "A7 "),
        
    ]
    
    @State private var spots2 = [
        spot(name: "B0 "),
        spot(name: "B1 "),
        spot(name: "B2 "),
        spot(name: "B3 "),
        spot(name: "B4 "),
        spot(name: "B5 "),
        spot(name: "B6 "),
        spot(name: "B7 "),
        
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
                    
                    
                    Text("B")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.pink.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal,20)
            .padding(.top,20)
            .padding(.bottom,20)
            
            
            HStack {
                VStack {
                    ScrollView {
                        VStack(spacing: 10) { // Reduced vertical spacing between rows
                            ForEach(spots1, id: \.self) { slot in
                                Row(Spot: slot, isSelected: slotName.selectedSlot == slot)
                                    .onTapGesture {
                                        slotName.selectedSlot = slot
                                    }
                            }
                        }
                        .padding(.horizontal, 25) // Reduced horizontal padding
                    }
                }
                
                VStack {
                    ScrollView {
                        VStack(spacing: 10) { // Reduced vertical spacing between rows
                            ForEach(spots2, id: \.self) { slot in
                                Row(Spot: slot, isSelected: slotName.selectedSlot == slot)
                                    .onTapGesture {
                                        slotName.selectedSlot = slot
                                    }
                            }
                        }
                        .padding(.horizontal, 25) // Reduced horizontal padding
                    }
                }
            }
            .padding(.horizontal, 0) // Reduced horizontal padding
            
            
            if let selectedVehicle = slotName.selectedSlot {
                Text("Selected Vehicle:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("\(selectedVehicle.name)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            
            // Continue Button
            NavigationLink(destination: VehicleDetailsView()) {
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
            
            Spacer()
            
        }
        .padding(.top)
    }
}



// Vehicle Row View
struct Row: View {
    var Spot: spot
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image("CarLightBlue") // Placeholder image
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(Spot.name)
                    .font(.headline)
                
            }
            
            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSelected ? .blue : .gray)
        }
        .padding(.vertical, 5)
        .overlay(Divider(), alignment: .bottom)
    }
}

// Vehicle struct to represent a vehicle
struct spot: Identifiable, Hashable {
    var id: String { name }
    var name: String
}



//#Preview {
//    SelectParkingSlot()
//}

struct SelectVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectParkingSlot()
            .environmentObject(SlotName())
            .environmentObject(VehicleModel())
            .environmentObject(ParkName())
            .environmentObject(BookingData())
    }
}

