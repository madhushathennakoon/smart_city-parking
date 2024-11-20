import SwiftUI

struct VehicleDetailsView: View {
    // Access the global vehicle model
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    
    var body: some View {
        VStack {
            if let selectedVehicle = vehicleModel.selectedVehicle {
                Text("Selected Vehicle:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("\(selectedVehicle.name) - \(selectedVehicle.number)")
                    .font(.headline)
                    .padding()
            } else {
                Text("No vehicle selected.")
                    .font(.subheadline)
                    .padding()
            }
            
            Text("Selected Park: \(parkname.selectedPark.isEmpty ? "No Park Selected" : parkname.selectedPark)")
            
            if let selectedSlot = slotName.selectedSlot {
                Text("Selected Slot:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("\(selectedSlot.name)")
                    .font(.headline)
                    .padding()
            } else {
                Text("No slot selected.")
                    .font(.subheadline)
                    .padding()
            }
           
        }
        
        
        
        
        .padding()
    }
}

struct VehicleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetailsView()
            .environmentObject(VehicleModel()) // Inject the same EnvironmentObject here
            .environmentObject(ParkName())
            .environmentObject(SlotName())
    }
}




