/*
 AppDelegate.swift
 Someone Like Me

 This AppDelegate class waits for and listens for any events from the SML system i.e. did the application terminate.
 
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {  this function method code is taken from as required for the set up of the firebase database.
 
  Created by Sharon Borges-Bango on 04/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/


import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //This swift file specifically this line of code (method) is the first file that gets called in the app, Firebase is intialised and configured here.
        FirebaseApp.configure()
        
        //saving some test data to the database and seeing if it works, here creating a constant miDatabase with reference to my database within Firebase
                let miDatabase = Database.database().reference()
                miDatabase.setValue("I have some data saved, woo!")
        
        return true
    }
}
