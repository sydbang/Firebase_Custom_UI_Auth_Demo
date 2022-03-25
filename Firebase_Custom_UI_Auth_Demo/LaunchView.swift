//
//  LaunchView.swift
//  Firebase_Custom_UI_Auth_Demo
//
//  Created by Sunghee Bang on 2022-03-21.
//

import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    @State var loggedIn = false // this should technically be in a viewmodel
    @State var loginFormShowing = false
    @State var createAccountFormShowing = false
    
    var body: some View {
        
        // Check the logged in property and show the appropriate view
        if !loggedIn {
            
            VStack (spacing: 20){
                // Show logged out view
                
                // Sign in button
                Button {
                    // Show the login form
                    loginFormShowing = true
                } label: {
                    Text("Sign In")
                }
                .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin) {
                    LoginForm(formShowing: $loginFormShowing)
                }
                
                // Create account button
                Button {
                    // Show the login form
                    createAccountFormShowing = true
                } label: {
                    Text("Create Account")
                }
                .sheet(isPresented: $createAccountFormShowing, onDismiss: checkLogin) {
                    CreateAccountForm(formShowing: $createAccountFormShowing)
                }
                
            }
            .onAppear{
                checkLogin()
            }
            
            
        } else {
            // Show logged in view
            ContentView(loggedIn: $loggedIn)
        }
    }
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser == nil ? false:true
        // Auth.auth().currentUser?.uid
    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
