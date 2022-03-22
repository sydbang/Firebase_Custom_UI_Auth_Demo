//
//  CreateAccountForm.swift
//  Firebase_Custom_UI_Auth_Demo
//
//  Created by Sunghee Bang on 2022-03-22.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountForm: View {
    
    @Binding var formShowing: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    // Create Account
                    createAccount()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Create Account")
                        Spacer()
                    }
                })
            }
            navigationBarTitle("Create an Account")
        }
    }
    
    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            DispatchQueue.main.async {
                if error == nil {
                    // Dissmiss form
                    formShowing = false
                } else {
                    errorMessage = error!.localizedDescription
                }
            }
        }
    }
}

struct CreateAccountForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountForm(formShowing: Binding.constant(true))
    }
}
