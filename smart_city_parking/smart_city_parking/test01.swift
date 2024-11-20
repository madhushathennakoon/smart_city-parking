import SwiftUI

struct VehicleDetailsView: View {
    // Access the global vehicle model
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var bookingData: BookingData
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var amPmTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
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
            
           
            Text(dateFormatter.string(from: bookingData.selectedDate))
            Text(amPmTimeFormatter.string(from: bookingData.selectedArriveTime))
            Text(amPmTimeFormatter.string(from: bookingData.selectedExitTime)) 
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
            .environmentObject(BookingData())
    }
}




