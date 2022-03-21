//
//  Firebase_Custom_UI_Auth_DemoApp.swift
//  Firebase_Custom_UI_Auth_Demo
//
//  Created by Sunghee Bang on 2022-03-17.
//

import SwiftUI
import Firebase

@main
struct Firebase_Custom_UI_Auth_DemoApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
        }
    }
}
