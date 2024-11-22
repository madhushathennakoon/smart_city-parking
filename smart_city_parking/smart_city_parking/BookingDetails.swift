import SwiftUI

// Store the selected booking details in a global observable object
class BookingData: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var selectedArriveTime: Date = Date()
    @Published var selectedExitTime: Date = Date()
}

struct BookingDetails: View {
    @EnvironmentObject var bookingData: BookingData
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    
    
    @State var selectDate: Date = Date()
    @State var selectArriveTime: Date = Date()
    @State var selectExitTime: Date = Date()
    
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
        NavigationView{
            VStack {
                // Header Section
                HStack {
                    VStack(alignment: .leading) {
                        Text("ParkSecure")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("137 Sir James Pieris Mawatha, Colombo 00200")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    VStack {
                        Image("LocationBlue")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.bottom, 5)
                    }
                }
                .padding(.top, -50)
                .padding(.horizontal, 20)
                
                Spacer().frame(height: 30) // Spacing
                Divider()
                
                VStack {
                    // Date Picker
                    DatePicker("Select Date", selection: $selectDate, displayedComponents: [.date])
                        .onChange(of: selectDate) { newValue in
                            bookingData.selectedDate = newValue
                        }
                        .accentColor(Color.red)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding(.horizontal, 20)
                }
                Spacer().frame(height: 30) // Spacing
                Divider()
                
                VStack(spacing: 25) {
                    // Arrival Time Picker
                    DatePicker("Select Arriving Time", selection: $selectArriveTime, displayedComponents: [.hourAndMinute])
                        .onChange(of: selectArriveTime) { newValue in
                            bookingData.selectedArriveTime = newValue
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .accentColor(Color.red)
                        .datePickerStyle(CompactDatePickerStyle())
                    
                    // Exit Time Picker
                    DatePicker("Select Exit Time", selection: $selectExitTime, displayedComponents: [.hourAndMinute])
                        .onChange(of: selectExitTime) { newValue in
                            bookingData.selectedExitTime = newValue
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .accentColor(Color.red)
                        .datePickerStyle(CompactDatePickerStyle())
           
                }
                
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                VStack{
                    NavigationLink(destination: SelectVehicle()) {
                        Text("Continue")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                }
                
                Spacer()
            }
        }
        .onAppear {
            
            bookingData.selectedDate = selectDate
            bookingData.selectedArriveTime = selectArriveTime
            bookingData.selectedExitTime = selectExitTime
        }
        
        
    }
}

struct BookingDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetails()
            .environmentObject(BookingData())
            .environmentObject(SlotName())
            .environmentObject(VehicleModel())
            .environmentObject(ParkName())
    }
}
