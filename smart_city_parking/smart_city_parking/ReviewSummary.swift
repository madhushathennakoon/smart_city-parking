//
//  ReviewSummary.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI
import FirebaseFirestore
import CoreData

struct ReviewSummary: View {
    
    @EnvironmentObject var vehicleModel: VehicleModel
    @EnvironmentObject var parkname: ParkName
    @EnvironmentObject var slotName: SlotName
    @EnvironmentObject var bookingData: BookingData
    @EnvironmentObject var authViewModel: AuthViewModel
    
//    @Environment(\.managedObjectContext) var moc
    
    @State private var navigateToConfirmation = false
    
//    @State private var amount = ""
//    @State private var arrivingTime = ""
//    //    @State private var date = ""
//    @State private var exitTime = ""
//    @State private var parkingName = ""
//    @State private var slot = ""
//    @State private var totalHours = ""
//    @State private var vehicle = ""
//    @State private var userID = ""
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var amPmTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
    func calculateTotalTime(arriveTime: Date, exitTime: Date) -> (String, Double) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: arriveTime, to: exitTime)
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let totalHours = Double(hours) + (Double(minutes) / 60.0)
        let formattedTime = "\(hours) hours \(minutes) minutes"
        return (formattedTime, totalHours)
    }
    
    var totalTime: String {
        let (formattedTime, _) = calculateTotalTime(arriveTime: bookingData.selectedArriveTime, exitTime: bookingData.selectedExitTime)
        return formattedTime
    }
    
    var totalAmount: String {
        let (_, totalHours) = calculateTotalTime(arriveTime: bookingData.selectedArriveTime, exitTime: bookingData.selectedExitTime)
        let amount = totalHours * 100
        return "Rs. \(Int(amount))"
    }
    
    
//    // Function to save booking to Core Data
//    func saveBookingToCoreData() {
//        guard let userID = authViewModel.userID else {
//            print("User ID is nil. Cannot save data.")
//            return
//        }
//        
//        
//        let newBooking = Details(context: moc)
//        
//        
//        newBooking.vehicle = vehicleModel.selectedVehicle != nil
//        ? "\(vehicleModel.selectedVehicle!.name) (\(vehicleModel.selectedVehicle!.number))"
//        : "No vehicle selected"
//        newBooking.parkingName = parkname.selectedPark
//        newBooking.arrivingTime = amPmTimeFormatter.string(from: bookingData.selectedArriveTime)
//        newBooking.exitTime = amPmTimeFormatter.string(from: bookingData.selectedExitTime)
//        newBooking.slot = slotName.selectedSlot?.name ?? "No slot selected"
//        newBooking.totalHours = totalTime
//        newBooking.amount = totalAmount
//        newBooking.userID = userID
//        //            newBooking.date = bookingData.selectedDate
//        
//        do {
//            try moc.save()
//            print("Booking data saved locally!")
//        } catch {
//            print("Error saving booking data to Core Data: \(error.localizedDescription)")
//        }
//        
//    }
    
    
    
    
    // Function to save booking to firebase
    func saveBookingToFirestore() {
        guard let userID = authViewModel.userID else {
            print("User ID is nil. Cannot save data.")
            return
        }
        
        let db = Firestore.firestore()
        let userBookingsRef = db.collection("Users").document(userID).collection("Bookings")
        
        let bookingData: [String: Any] = [
            "parkingName": parkname.selectedPark,
            "date": dateFormatter.string(from: bookingData.selectedDate),
            "arrivingTime": amPmTimeFormatter.string(from: bookingData.selectedArriveTime),
            "exitTime": amPmTimeFormatter.string(from: bookingData.selectedExitTime),
            "vehicle": vehicleModel.selectedVehicle != nil
            ? "\(vehicleModel.selectedVehicle!.name) (\(vehicleModel.selectedVehicle!.number))"
            : "No vehicle selected",
            "slot": slotName.selectedSlot?.name ?? "No slot selected",
            "totalTime": totalTime,
            "amount": totalAmount,
            "timestamp": Timestamp()
        ]
        
        userBookingsRef.addDocument(data: bookingData) { error in
            if let error = error {
                print("Error saving booking data: \(error.localizedDescription)")
            } else {
                print("Booking data successfully saved!")
                navigateToConfirmation = true 
            }
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Review Summary")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top,-70)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: ParkingDetails()) {
                        ParkingInfoCard(imgName: "ParkingImg2", parkingCTGY: "Car Parking", rating: "4.8", parkingName: parkname.selectedPark, price: "100", slot: "28")
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top,-30)
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Your Booking")
                        .font(.headline)
                        .padding(.top)
                    
                    BookingDetailRow(icon: "clock", label: "Date", value: dateFormatter.string(from: bookingData.selectedDate))
                    BookingDetailRow(icon: "clock", label: "Arriving Time", value: amPmTimeFormatter.string(from: bookingData.selectedArriveTime))
                    BookingDetailRow(icon: "clock", label: "Exit Time", value: amPmTimeFormatter.string(from: bookingData.selectedExitTime))
                    
                    BookingDetailRow(
                        icon: "car.fill",
                        label: "Vehicle",
                        value: vehicleModel.selectedVehicle != nil
                        ? "\(vehicleModel.selectedVehicle!.name) (\(vehicleModel.selectedVehicle!.number))"
                        : "No vehicle selected"
                    )
                    
                    BookingDetailRow(
                        icon: "car.fill",
                        label: "Slot",
                        value: slotName.selectedSlot != nil
                        ? "\(slotName.selectedSlot!.name)"
                        : "No slot selected"
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom)
                
                Divider()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Price details")
                        .font(.headline)
                    
                    PriceDetailRow(label: "Total Time", value: totalTime)
                    PriceDetailRow(label: "Amount", value: totalAmount)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Divider()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                HStack {
                    Text("Total Price")
                        .font(.headline)
                    Spacer()
                    Text(totalAmount)
                        .font(.headline)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
                
                
                NavigationLink(destination: PaymentMethod(), isActive: $navigateToConfirmation) {
                    EmptyView()
                }
                
                Button(action: {
                    saveBookingToFirestore()
//                    saveBookingToCoreData()
                }) {
                    Text("Payment")
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



// Booking Detail Row
struct BookingDetailRow: View {
    var icon: String
    var label: String
    var value: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.bold)
        }
    }
}

// Price Detail Row
struct PriceDetailRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.bold)
        }
    }
}


struct ParkingInfoCard: View {
    var imgName: String
    var parkingCTGY: String
    var rating: String
    var parkingName: String
    var price: String
    var slot: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(imgName)
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(parkingCTGY)
                        .font(.footnote)
                        .bold()
                        .padding(5)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                        .foregroundColor(.blue)
                    Spacer()
                    Image("Star")
                        .resizable()
                        .frame(width: 17, height: 17)
                    Text(rating)
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.bottom,45)
                
                HStack{
                    Text(parkingName)
                        .font(.caption)
                        .bold()
                    Spacer()
                    
                    Text("Rs." + price)
                        .foregroundColor(.red)
                        .font(.caption)
                        .bold()
                        .padding(.trailing,-6)
                    Text("/hr")
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                }
                .padding(.top,-30)
                
                
                HStack{
                    Image("CarBlue")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(slot + " Spots")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                }
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



#Preview {
    ReviewSummary()
        .environmentObject(VehicleModel())
        .environmentObject(ParkName())
        .environmentObject(SlotName())
        .environmentObject(BookingData())
        .environmentObject(AuthViewModel())
    
}
