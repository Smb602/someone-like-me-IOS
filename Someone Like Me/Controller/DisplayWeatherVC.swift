/*
  ChangeWeatherVC.swift
  Someone Like Me

  Created by Sharon Borges-Bango on 19/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import CoreLocation //allows us to tap into core location GPS function iphone
import Alamofire
import SwiftyJSON

//this class is a subclass of UiViewController and conforms to rules of CLLocationManagerDelegate
class DisplayWeatherVC: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var farenheit: UISwitch!
    
    // My Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather" // weather url, is a website to get current weather data from
    let APP_ID = "c79318556e2672741f3bdff20507f957" //set up my own free account on https://home.openweathermap.org/api_keys to get my own appid
    
    @IBAction func `switch`(_ sender: Any) {
    //    if sender.isOn {
            
     //   }
    }
    
   
    //Declaring instance variables here - Creating a new location object
    let thisLocationManager = CLLocationManager()
    let dataModelWeather = DataModelWeather() //creating weather data model
    
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

    // getTheWeatherInfo method takes to params url,string and allParameter structured dictionary
    func getTheWeatherInfo(url: String, parameters: [String: String]) {
        
        //using Alamofire to make the http request and handle response from open weather map servers
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { //.get method recieves data and nothing else and is asynchronus and then>response
            response in
            if response.result.isSuccess {
                print("Successful, we have weather data!") //testing in console
                
                //new constant v datatype of type JSON(JavaScript Object Notation) formatting large
                let theWeatherJSON : JSON = JSON(response.result.value!) //force unwrapping as already checked if result was successful and deffo isn't nil
                //print(theWeatherJSON) //for testing
                
                self.updateTheWeatherInfo(json: theWeatherJSON) //pull out relevant values and update labels and imageviews
                
            }else{
                print("ERROR \(response.result.error))")
                self.showCityLabel.text = "You Have Connection Problems"
            }
        }
    }
    
    
    //MARK: - Methods JSON Parsing: that passes data from open weather map to what we want to display, aids in pulling out relevant values and update labels and imageviews
    
    //updateTheWeatherInfo method
    func updateTheWeatherInfo(json : JSON) {
        
        //json array values are the ones printed in the console pulled from the open weather site
        if let tempValue = json["main"]["temp"].double { //all main values and key temp and get it's value using SwiftyJSON; converted into double
        
        //updating datamodelweatherobject
        dataModelWeather.theTempertaure = Int(tempValue - 273.15) // temp property convert from kelvin into degrees, converted into Int
        dataModelWeather.theCity = json["name"].stringValue
        dataModelWeather.weatherConditon =  json["weather"][0]["id"].intValue //getting weather, object at index 0 and the id, convert to int
        dataModelWeather.theWeatherIcon = dataModelWeather.updateIcons(condition: dataModelWeather.weatherConditon)
        }else{
        //if there's no temp or json
            showCityLabel.text = "Retrieving Weather is Unavailable"
        }
        
    }
    
    
    
    //MARK: - Methods UI Updates: to update the weather conditions: what will be displayed in label, weather images
   
    // updateUIWithWeatherData method
    
    
    
    
    //MARK: - Methods Location Manager Delegate: grabs our current location and what the latitude and longitude of iphone is
   
    // didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //new values of lang and long that are found are added to this array. The last value in the array will be the most accuarate.
        let locationFound = locations[locations.count - 1] //last location
        if locationFound.horizontalAccuracy > 0 { // we have to make sure the value is valid and positive
            thisLocationManager.stopUpdatingLocation() //energy intensive, stop updating location once valid result found
            thisLocationManager.delegate = nil //removes recieving locations while stopping so no repeated data during
            
            print("longitude = \(locationFound.coordinate.longitude), latitude = \(locationFound.coordinate.latitude)")
            
            //turning coordinates into parameters that will be sent to openweathermap api
            let foundLatitude = String(locationFound.coordinate.latitude) //converting doubles into type strings
            let foundLongitude = String(locationFound.coordinate.longitude)
            //combining both parameters into a dictionary where key is string and value is string, array of dictionary obj lat is key and foundLatitude constant =value, lon is also key and foundLongitude constant= the value, appid key is associated with the APP_ID value
            let theParameters : [String : String] = ["lat" : foundLatitude, "lon" : foundLongitude, "appid" : APP_ID]
            //lat, lon and appid are all required as part of API calls to the openweather map
            
            getTheWeatherInfo(url: WEATHER_URL, parameters: theParameters)
            
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
