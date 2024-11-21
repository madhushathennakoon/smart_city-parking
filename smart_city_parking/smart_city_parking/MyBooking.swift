//
//  MyBooking.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI
import FirebaseFirestore

struct MyBooking: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var bookings: [Booking] = []
    
    var body: some View {
        VStack {
            Text("Booking History")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(bookings) { booking in
                        BookingCard(booking: booking)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: fetchBookings)
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Bookings")
    }
    
    
    func fetchBookings() {
        
        guard let userID = authViewModel.userID else {
            print("User is not logged in")
            return
        }
        
        let db = Firestore.firestore()
        
        
        db.collection("Users").document(userID).collection("Bookings")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching bookings: \(error.localizedDescription)")
                } else {
                    
                    bookings = snapshot?.documents.compactMap { doc in
                        let data = doc.data()
                        return Booking(
                            id: doc.documentID,
                            parkingName: data["parkingName"] as? String ?? "N/A",
                            arrivingTime: data["arrivingTime"] as? String ?? "N/A",
                            exitTime: data["exitTime"] as? String ?? "N/A",
                            vehicle: data["vehicle"] as? String ?? "N/A",
                            slot: data["slot"] as? String ?? "N/A",
                            amount: data["amount"] as? String ?? "N/A"
                        )
                    } ?? []
                }
            }
    }
}


struct BookingCard: View {
    var booking: Booking
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(booking.parkingName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text(booking.amount)
                    .font(.headline)
                    .foregroundColor(.green)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text("Arriving: \(booking.arrivingTime)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "clock.arrow.circlepath")
                        .foregroundColor(.blue)
                    Text("Exit: \(booking.exitTime)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "car.fill")
                        .foregroundColor(.blue)
                    Text("Vehicle: \(booking.vehicle)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "parkingsign.circle.fill")
                        .foregroundColor(.blue)
                    Text("Slot: \(booking.slot)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct Booking: Identifiable {
    var id: String
    var parkingName: String
    var arrivingTime: String
    var exitTime: String
    var vehicle: String
    var slot: String
    var amount: String
}

#Preview {
    MyBooking()
        .environmentObject(AuthViewModel())
}
