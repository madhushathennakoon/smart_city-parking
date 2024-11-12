//
//  BookingDetails.swift
//  smart_city_parking
//
//  Created by Madhusha on 2024-11-09.
//

import SwiftUI

struct BookingDetails: View {
    @ObservedObject var model = viewModel()
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("ParkSecure")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("137 Sir James Pieris Mawatha, Colombo 00200")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                 
                    
                }
                Spacer()
                VStack{
                    Image("LocationBlue")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.bottom,5)
                }
                
                }
            .padding(.top,10)
        }
        .padding(.horizontal,20)
        Spacer()
        
        Text("hello")
        
        List(model.list) {item in
            Text(item.name)
        }
       
        
        
        Spacer()
        
        
        
    }
    
    init() {
        model.getData()
    }
    
}

#Preview {
    BookingDetails()
}
