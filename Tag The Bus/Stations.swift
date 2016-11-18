//
//  Stations.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 18/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import Foundation

class Stations
{
    private var _id : String
    private var _StreetName:String
    private var _latitude : Double
    private var _longitude : Double
    
    // getters
    
    var Id:String{
        return _id
    }
    var StreetName:String{
        return _StreetName
    }
    var lat:Double{
        return _latitude
    }
    var lon:Double{
        return _longitude
    }
    
    // constructeur 
    init(data:JSONDictionnary)
    {
       // récupération du ID de la station
       if let  id = data["id"] as? String {
            self._id = id
        }
        else
        {
            _id=""
        }
        // récupération du nom  de la station
        if let  name = data["street_name"] as? String {
            self._StreetName = name
        }
        else
        {
            _StreetName=""
        }
        // récupération de la position latitude et longitude
        if let  latitude = data["lat"] as? Double {
            self._latitude = latitude
        }
        else
        {
            _latitude=0.0
        }
        // récupération de la position latitude et longitude
        if let  longitude = data["lon"] as? Double {
            self._longitude = longitude
        }
        else
        {
            _longitude=0.0
        }
        
    }
    
    
    
}
