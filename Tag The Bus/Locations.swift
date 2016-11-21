//
//  Locations.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 21/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import MapKit
class Location: NSObject, MKAnnotation {
    let title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?,  coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}
