//
//  ChangeWeatherVC.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 19/07/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit
//import CoreLocation //allows us to tap into core location on iphone

//this class is a subclass of UiViewController and conforms to rules of CLLocationManagerDelegate
class DisplayWeatherVC: UIViewController {

    
    
    @IBOutlet var farenheit: UISwitch!
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    
    @IBAction func `switch`(_ sender: Any) {
        if sender.isOn {
            
        }
    }
    
   
    //TODO: Declare instance variables here - Creating a new location object
    
    
    //IB outlets
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var iconShowWeather: UIImageView!
    @IBOutlet var showCityLabel: UILabel!
    
    @IBOutlet var exchangeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //TODO:Set up the location manager here.
        //TODO:Set up the location manager here by refering to locationmanager at the top.delegate  = self(is current class. Setting the weather view controller as the delgate so location manager knows who to report to once gets location data)
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
//        locationManager.requestWhenInUseAuthorization() //requesting users authorisation to use location
//        locationManager.startUpdatingLocation() //asynchronous method = working background to get gps location once becomes accurate sends
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    //Write the updateWeatherData method here:
    
    
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    // didUpdateLocations method here:
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //new value that's found is added to this array
//        //last value in the array will be the most accuarate
//        let location = locations[locations.count - 1]
//        if location.horizontalAccuracy > 0 { // we have to make sure the value is valid and positive
//            locationManager.stopUpdatingLocation()
//
//            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
//        }
//    }
    
    
    //Write the didFailWithError method here:
    //didFailWithError method here: tells the LM if the delegate failed finding location fails i.e due to no connection, phones on airplane mode
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//        cityLabel.text = "Location Unavailable"
   // }
    
    
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    
    
    
    //Write the PrepareForSegue Method here

    
}
