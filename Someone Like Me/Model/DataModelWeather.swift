/*
  DataModelWeather.swift
  Someone Like Me

  This class represents the weather data, containing weather properties i.e temp, condition

  Created by Sharon Borges-Bango on 20/08/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit

class DataModelWeather{

    //Declaration of variables here
    
    var theTempertaure : Int = 0
    var weatherConditon : Int = 0
    var theCity : String = ""
    var theWeatherIcon : String = ""
    
    // From open weater app the method below turns the condition code --> the weather condition image name, switch sees which bucket falls into and is true
    
        func updateIcons(condition: Int) -> String {
    
        switch (condition) {
    
            case 0...300 :
                return "storm-1"
    
            case 301...500 :
                return "lightRain"
    
            case 501...600 :
                return "shower"
    
            case 601...700 :
                return "snow-1"
    
            case 701...771 :
                return "fog"
    
            case 772...799 :
                return "storm-3"
    
            case 800 :
                return "sunny"
    
            case 801...804 :
                return "cloudy"
    
            case 900...903, 905...1000  :
                return "storm-3"
    
            case 903 :
                return "snow-2"
    
            case 904 :
                return "sunny"
    
            default :
                return "questionmark"
            }
    
        }
}



