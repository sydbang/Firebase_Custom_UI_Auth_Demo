//
//  ContentView.swift
//  Firebase_Custom_UI_Auth_Demo
//
//  Created by Sunghee Bang on 2022-03-17.
//


import SwiftUI
import FirebaseAuth
import Firebase

struct ContentView: View {
    
    @Binding var loggedIn: Bool
    
    @State private var firstname: String = ""
    @State private var messageShowing: String?
    
    var body: some View {
        VStack (spacing: 20){
            Text("Welcome!")
            
            TextField("Name", text: $firstname)
            
            Button {
                saveFirstName()
            } label: {
                Text("Save data")
            }
            
            if messageShowing != nil {
                Text(messageShowing!)
            }
            
            Button {
                try! Auth.auth().signOut()
                loggedIn = false
            } label: {
                Text("Sign Out")
                
            }
        }
    }
    
    func saveFirstName() {
        
        if let currentUser = Auth.auth().currentUser {
            let cleansedFirstName = firstname.trimmingCharacters(in: .whitespacesAndNewlines)
            let db = Firestore.firestore()
            let path = db.collection("users").document(currentUser.uid)
            path.setData(["firstname" : cleansedFirstName]) { (error) in
                
                DispatchQueue.main.async {
                    if error == nil {
                        messageShowing = "Saved"
                    } else {
                        messageShowing = error!.localizedDescription
                    }
                }
                
            }
        }
    }
}
