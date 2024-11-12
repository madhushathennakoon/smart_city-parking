//
//  viewModel.swift
//  smart_city_parking
//
//  Created by COBSCCOMPY4231P-019 on 2024-11-12.
//

import Foundation
import Firebase

class viewModel: ObservableObject {
    
    @Published var list = [userModel]()
    
    func getData(){
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map {d in
                            
                            return userModel(id: d.documentID,
                                             email: d["email"] as?  String ?? "",
                                             name: d["name"] as? String ?? "")
                        }
                    }
                    
                    
                }
            }
            else {
                
                
            }
        }
    }
    
}
