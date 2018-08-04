/*
  SearchWeatherVC.swift
  Someone Like Me

    Delegation allows the reuse of components, can pass data forwards by creating objects and to pass data back from b to a then b class has to now the properties and methods of a class therefore use delegates to do this.
 
  Created by Sharon Borges-Bango on 19/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit

//Protocol declaration:
protocol SearchCityWeatherDelegate { //created our own protocol to transfer data from thisVC which is a contract that will DisplayWeatherVC will conform to func userSearchedNewWeather(city: String) in order to get the data we're passing backwards
    func userSearchedNewWeather(city: String)
}

class SearchWeatherVC: UIViewController {
    
    
    //Declaring delegate variable property here:
    var delegate : SearchCityWeatherDelegate?
    
    //Linkedup IB Outlets text field:
    @IBOutlet var newCityTextfield: UITextField!
    
    
    
    //The IBAction called when the user selects "Get the Weather" button:
    @IBAction func searchWeatherPresses(_ sender: Any) {
    
        
        //1 Get the area or city text that the user entered in the text field
        let areaOrCity = newCityTextfield.text!
        
        //2 If we have a delegate set that isn't nil, call the method userSearchedNewWeather and pass the message of the city name
        delegate?.userSearchedNewWeather(city: areaOrCity) //questionmark is optional chaining to check if the questionmark has a value or is nil, if it does have a value execute the func otherwise no value then ignore
        
        //3 dismiss Search Weather VC to go back to the DisplayWeatherVC (VC is viewcontroller)
        self.dismiss(animated: true, completion: nil)
}
    //this IBAction is called when the user selects the back button & dismisses the SearchWeatherViewController.
    @IBAction func pressBackButton(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }

    
}

