//
//  ViewController.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 17/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIManager()
        api.loadData("http://barcelonaapi.marcpous.com/bus/nearstation/latlon/41.3985182/2.1917991/1.json",completion:didloadData)
    }
    func didloadData(stations:[Stations])
    {
        for item in stations
        {
            print ("le nom de la station est \(item.StreetName) ")
        }
    }

}

