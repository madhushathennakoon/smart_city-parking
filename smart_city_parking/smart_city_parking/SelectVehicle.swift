//
//  SelectVehicle.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

// store the selected vehicle in global variable
class VehicleModel: ObservableObject {
    @Published var selectedVehicle: Vehicle? = nil
    
}

struct SelectVehicle: View {
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    
    @State private var vehicles = [
        Vehicle(name: "Toyota Fortuner", number: "CAK 9191"),
        Vehicle(name: "Honda CR-V", number: "ABC 1234"),
        Vehicle(name: "BMW X5", number: "XYZ 5678"),
        Vehicle(name: "Audi Q7", number: "PQR 3456"),
        Vehicle(name: "Ford Mustang", number: "LMN 7890")
    ]
    
   
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Text("Select Vehicle")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        // Add vehicle action
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                .padding(.horizontal, 20)
                
                
//                Text("hello")
//                Text("Selected Park: \(parkname.selectedPark.isEmpty ? "No Park Selected" : parkname.selectedPark)")
                
                
                // Vehicle List
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(vehicles, id: \.self) { vehicle in
                            VehicleRow(vehicle: vehicle, isSelected: vehicleModel.selectedVehicle == vehicle)
                                .onTapGesture {
                                    vehicleModel.selectedVehicle = vehicle
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                // Spacer
                Spacer()
                
                // Show selected vehicle information
                if let selectedVehicle = vehicleModel.selectedVehicle {
                    Text("Selected Vehicle:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text("\(selectedVehicle.name) - \(selectedVehicle.number)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                }
                
                
                NavigationLink(destination: SelectParkingSlot()){
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
}

struct VehicleRow: View {
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

// Vehicle struct to represent a vehicle
struct Vehicle: Identifiable, Hashable {
    var id: String { number } // Make vehicle unique using the vehicle number
    var name: String
    var number: String
}

struct SelectVehicle_Previews: PreviewProvider {
    static var previews: some View {
        SelectVehicle()
            .environmentObject(VehicleModel()) 
            .environmentObject(ParkName())
            .environmentObject(SlotName())
    }
}

