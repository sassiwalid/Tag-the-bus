//
//  ViewController.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 17/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource,MKMapViewDelegate  {
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var TableView: UITableView!
    var stations = [Stations]()
    var locations = [Location]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(
            latitude: 41.390205,
            longitude: 2.154007
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.ReachabiltyStatusChanged), name: "ReachStatusChanged", object: nil)
        ReachabiltyStatusChanged() 
    }
    @IBAction func segmentSelectedAction(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 1 :
            Map.hidden = false
            TableView.hidden = true
        case 0:
            Map.hidden = true
            TableView.hidden = false
        default: break;
        }
    }

    func RunAPI()
    {
        let api = APIManager()
        api.loadData("http://barcelonaapi.marcpous.com/bus/nearstation/latlon/41.3985182/2.1917991/1.json",completion:didloadData)
    }
   
    func didloadData(stations:[Stations])
    {
    self.stations = stations
        print(stations.count)
        for i in 0 ..< stations.count  {
            let location = Location(title: stations[i].StreetName,coordinate: CLLocationCoordinate2D(latitude: Double(self.stations[i].lat)!, longitude:Double(self.stations[i].lon)!))
            locations.append(location)
        }
    Map.addAnnotations(locations)
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
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        cell.textLabel?.text = station.StreetName
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    if segue.identifier == "gotodetails" {
    let backItem = UIBarButtonItem()
    backItem.title = "Retour"
    navigationItem.backBarButtonItem = backItem
    let selectedTopic = stations[(TableView.indexPathForSelectedRow?.row)!]
    let des = segue.destinationViewController as! DetailsStationsImages
    des.stationName = selectedTopic.StreetName
    }
    }

}

