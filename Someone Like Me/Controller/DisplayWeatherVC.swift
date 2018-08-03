//
//  ChangeWeatherVC.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 19/07/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit
import CoreLocation //allows us to tap into core location GPS function iphone

//this class is a subclass of UiViewController and conforms to rules of CLLocationManagerDelegate
class DisplayWeatherVC: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var farenheit: UISwitch!
    
    // My Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather" // weather url, website we get current weather data from
    let APP_ID = "c79318556e2672741f3bdff20507f957" //set up my own free account on https://home.openweathermap.org/api_keys to get my own appid
    
    @IBAction func `switch`(_ sender: Any) {
    //    if sender.isOn {
            
     //   }
    }
    
   
    //TODO: Declare instance variables here - Creating a new location object
    let thisLocationManager = CLLocationManager()
    
    
    //IB outlets
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var iconShowWeather: UIImageView!
    @IBOutlet var showCityLabel: UILabel!
    
    @IBOutlet var exchangeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setting up the location manager here by refering to locationmanager at the top.delegate  = self(is current class. Setting the weather view controller as the delgate so location manager knows who to report to once gets location data)
        thisLocationManager.delegate = self
        thisLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer //accuracy of location 
        thisLocationManager.requestWhenInUseAuthorization() //requesting users authorisation to use location
        thisLocationManager.startUpdatingLocation() //asynchronous method (means working background) to get gps location once becomes accurate sends
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods Networking: makes http requests for weather data from the website

    // getWeatherData method
    
    
    
    
    
    
    
    //MARK: - Methods JSON Parsing: that passes data from open weather map to what we want to display
    
    //updateWeatherData method
    
    
    
    
    
    //MARK: - Methods UI Updates: to update the weather conditions: what will be displayed in label, weather images
   
    // updateUIWithWeatherData method
    
    
    
    
    //MARK: - Methods Location Manager Delegate: grabs our current location and what the latitude and longitude of iphone is
   
    // didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //new values of lang and long that are found are added to this array. The last value in the array will be the most accuarate.
        let locationFound = locations[locations.count - 1] //last location
        if locationFound.horizontalAccuracy > 0 { // we have to make sure the value is valid and positive
            thisLocationManager.stopUpdatingLocation() //energy intensive, stop updating location once valid result found

            print("longitude = \(locationFound.coordinate.longitude), latitude = \(locationFound.coordinate.latitude)")
            
            //turning coordinates into parameters that will be sent to openweathermap api
            let foundLatitude = String(locationFound.coordinate.latitude) //converting doubles into type strings
            let foundLongitude = String(locationFound.coordinate.longitude)
            //combining both parameters into a dictionary where key is string and value is string, array of dictionary obj lat is key and foundLatitude constant =value, lon is also key and foundLongitude constant= the value
            let parameters : [String : String] = ["lat" : foundLatitude, "lon" : foundLongitude, "appid" : APP_ID]
            //lat, lon and appid are all required as part of API calls to the openweather map
        }
    }
    
    
    //did Fail to get location Error method here: if there's an error tells the LM if the delegate failed finding location value fails i.e due to no connection i.e phones on airplane mode or the user may have no internet
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        showCityLabel.text = "Location is Unavailable"
    }
    
    
    
    //MARK: - Methods Searching a Different City/Area Delegate: changing from one VC(viewcontroller) to the other and how pass data between two VC's
    
    //method userEnteredANewCityName Delegate
    
    
    //method to PrepareForSegue

    
}
