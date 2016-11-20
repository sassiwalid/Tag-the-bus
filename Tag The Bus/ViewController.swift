//
//  ViewController.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 17/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
 @IBOutlet weak var TableView: UITableView!
    var stations = [Stations]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIManager()
        api.loadData("http://barcelonaapi.marcpous.com/bus/nearstation/latlon/41.3985182/2.1917991/1.json",completion:didloadData)
    }
   
    func didloadData(stations:[Stations])
    {
    self.stations = stations
        TableView.reloadData()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return stations.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let station = stations[indexPath.row]
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = station.StreetName
        return cell
    }
    

}

