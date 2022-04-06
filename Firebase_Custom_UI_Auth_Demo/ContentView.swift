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
    
    
    var body: some View {
        VStack (spacing: 20){
            Text("Welcome!")
            
            Button {
                try! Auth.auth().signOut()
                loggedIn = false
            } label: {
                Text("Sign Out")
                
            }
        }
    }
}
