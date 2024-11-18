import SwiftUI

struct VehicleDetailsView: View {
    // Access the global vehicle model
    @EnvironmentObject var vehicleModel: VehicleModel
    
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
        }
        .navigationBarTitle("Vehicle Details")
        .padding()
    }
}

struct VehicleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetailsView()
            .environmentObject(VehicleModel()) // Inject the same EnvironmentObject here
    }
}
