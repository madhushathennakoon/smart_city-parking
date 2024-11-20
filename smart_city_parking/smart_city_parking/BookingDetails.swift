import SwiftUI

struct BookingDetails: View {
    @State var selectDate: Date = Date() // For selecting the date
    @State var selectArriveTime: Date = Date() // For selecting the arrival time
    @State var selectExitTime: Date = Date() // For selecting the exit time
    
    // Date formatter for the date display
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    // Time formatter for AM/PM format
    var amPmTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Explicitly include AM/PM
        return formatter
    }
    
    var body: some View {
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
            
            .padding(.top, 10)
            .padding(.horizontal, 20)
         
            Spacer().frame(height: 20) // Spacing
            
       
            
            
            
            // Date Picker
            DatePicker("Select Date", selection: $selectDate, displayedComponents: [.date])
                .accentColor(Color.red)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal,20)
            
            
            VStack{
                // Arrival Time Picker
                DatePicker("Arriving Time", selection: $selectArriveTime, displayedComponents: [.hourAndMinute])
                    .font(.title3)
                    .fontWeight(.bold)
                    .accentColor(Color.red)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding(.horizontal,20)
                
                // Exit Time Picker
                DatePicker("Exit Time", selection: $selectExitTime, displayedComponents: [.hourAndMinute])
                    .font(.title3)
                    .fontWeight(.bold)
                    .accentColor(Color.red)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding(.horizontal,20)
            }
           
            
//            // Display Selected Date, Arrival Time, and Exit Time
//            VStack(alignment: .leading, spacing: 10) {
//                Text("Selected Date:")
//                    .font(.headline)
//                Text(dateFormatter.string(from: selectDate))
//                    .foregroundColor(.gray)
//                
//                Text("Arriving Time:")
//                    .font(.headline)
//                Text(amPmTimeFormatter.string(from: selectArriveTime)) // Use custom AM/PM formatter
//                    .foregroundColor(.gray)
//                
//                Text("Exit Time:")
//                    .font(.headline)
//                Text(amPmTimeFormatter.string(from: selectExitTime)) // Use custom AM/PM formatter
//                    .foregroundColor(.gray)
//            }
//            .padding(.horizontal)
//            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    BookingDetails()
}
