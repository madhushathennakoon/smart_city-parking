import SwiftUI

// Store the selected vehicle in a global variable
class VehicleSelectionModel: ObservableObject {
    @Published var selectedPark: spot? = nil
}

struct SelectVehicleView: View {
    @EnvironmentObject var parkModel: VehicleSelectionModel
    @EnvironmentObject var parkname: ParkName

    @State private var spots = [
        spot(name: "Toyota Fortuner", number: "CAK 9191"),
        spot(name: "Honda CR-V", number: "ABC 1234"),
        spot(name: "BMW X5", number: "XYZ 5678")
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
               

                // Vehicle List
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(spots, id: \.self) { slot in
                            Row(Spot: slot, isSelected: parkModel.selectedPark == slot)
                                .onTapGesture {
                                    parkModel.selectedPark = slot
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

                Spacer()

                // Selected Vehicle Info
                if let selectedVehicle = parkModel.selectedPark {
                    Text("Selected Vehicle:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("\(selectedVehicle.name) - \(selectedVehicle.number)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }

                // Continue Button
                NavigationLink(destination: SelectedVehicleDetailsView()) {
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

// Vehicle Row View
struct Row: View {
    var Spot: spot
    var isSelected: Bool

    var body: some View {
        HStack {
            Image(systemName: "car.fill") // Placeholder image
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(Spot.name)
                    .font(.headline)
                Text(Spot.number)
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
struct spot: Identifiable, Hashable {
    var id: String { number } // Make vehicle unique using the vehicle number
    var name: String
    var number: String
}

// Placeholder for Vehicle Details View
struct SelectedVehicleDetailsView: View {
    var body: some View {
        Text("Vehicle Details View")
            .font(.title)
            .foregroundColor(.blue)
    }
}

struct SelectVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectVehicleView()
            .environmentObject(VehicleSelectionModel()) // Inject the VehicleModel as an EnvironmentObject
            .environmentObject(ParkName())
    }
}
