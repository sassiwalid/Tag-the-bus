//
//  Photo.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 21/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import Foundation
import UIKit

class Photo
{
    private var _StreetName: String
    private  var _Name: String
    private var _myphoto:UIImage
    var StreetName:String{
        return _StreetName
    }
    var Name :String{
        return _Name
    }
    var myphoto:UIImage{
        return _myphoto
    }
    init(Street :String, Name:String, photo:UIImage)
    {
        _StreetName = Street
        _Name = Name
        _myphoto = photo
    }

    
    
}
