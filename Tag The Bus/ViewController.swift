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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.ReachabiltyStatusChanged), name: "ReachStatusChanged", object: nil)
        ReachabiltyStatusChanged() 
    }
    func RunAPI()
    {
        let api = APIManager()
        api.loadData("http://barcelonaapi.marcpous.com/bus/nearstation/latlon/41.3985182/2.1917991/1.json",completion:didloadData)
    }
   
    func didloadData(stations:[Stations])
    {
    self.stations = stations
        TableView.reloadData()
    }
    func ReachabiltyStatusChanged()
    {
        switch reachabilityStatus {
        case NOACCESS : view.backgroundColor = UIColor.redColor()
        print(reachabilityStatus)
        let alert = UIAlertController(title:"Pas de connexion Internet", message: "Verifiez votre connexion ", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style:.Default){
            action -> () in print("Cancel")
        }
        let deleteAction = UIAlertAction(title: "Delete", style:.Destructive){
            action -> () in print("Delete")
        }
        let okAction = UIAlertAction(title: "OK", style:.Default){
            action -> () in print("OK")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        self.presentViewController(alert, animated: true, completion: nil)
        default:
            print(reachabilityStatus)
            RunAPI()
            
        }
    }
    // appel de destructeur et destruction de l'observer
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
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
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        cell.textLabel?.text = station.StreetName
        return cell
    }
    

}

