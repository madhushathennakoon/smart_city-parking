//
//  Profile.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-09.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Text("Profile")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                }
                .padding(.horizontal,20)
                
                
                VStack(alignment: .center, spacing: 5) {
                    Image("Profile")
                        .resizable()
                        .frame(width: 120, height: 115)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Text("Matt Henry")
                        .font(.title)
                        .bold()
                    
                    Text("matthenry@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    Text("+94 775815126")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        //action
                    }) {
                        Text("Edit")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.pink)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                
                VStack(spacing: 10) {
                    ProfileOptionRow(icon: "creditcard", title: "Payment Method")
                    ProfileOptionRow(icon: "car.fill", title: "My Vehicle")
                    NavigationLink(destination: Notifications()) {
                        ProfileOptionRow(icon: "bell.fill", title: "Notifications")
                    }
                    
                    ProfileOptionRow(icon: "globe", title: "Language")
                    ProfileOptionRow(icon: "doc.text.fill", title: "Terms and conditions")
                    ProfileOptionRow(icon: "questionmark.circle.fill", title: "Help & support")
                }
                .padding(.horizontal,20)
                .padding(.top,20)
                
                Spacer()
                
                
                Button(action: {
                    //action
                }) {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .foregroundColor(.pink)
                        Text("Logout")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom,30)
                
                
            }
            .padding(.top)
        }
    }
}

struct ProfileOptionRow: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text(title)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}



#Preview {
    Profile()
}
