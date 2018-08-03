//
//  SearchWeatherVC.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 03/08/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit

//Protocol declaration:

class SearchWeatherVC: UIViewController {
    
    
    //Declaring delegate variable here:
    
    
    //The linked IBOutlets text field:
    @IBOutlet var newCityTextfield: UITextField!
    
    
    
    //The IBAction called when the user selects "Get the Weather" button:
    @IBAction func searchWeatherPresses(_ sender: Any) {
    
        
        //1 Get the city name the user entered in the text field
        
        
        //2 If we have a delegate set, call the method userEnteredANewCityName
        
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        
}
    //IBAction is called when the user selects the back button and dismisses the SearchWeatherViewController.
    @IBAction func pressBackButton(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }

    
}

