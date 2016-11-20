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
    private var _latitude : String
    private var _longitude : String
    
    // getters
    
    var Id:String{
        return _id
    }
    var StreetName:String{
        return _StreetName
    }
    var lat:String{
        return _latitude
    }
    var lon:String{
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
        if let  latitude = data["lat"] as? String {
            self._latitude = latitude
        }
        else
        {
            _latitude=""
        }
        // récupération de la position latitude et longitude
        if let  longitude = data["lon"] as? String {
            self._longitude = longitude
        }
        else
        {
            _longitude=""
        }
        
    }
    
    
    
}
