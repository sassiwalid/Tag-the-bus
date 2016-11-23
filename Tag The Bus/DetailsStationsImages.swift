//
//  DetailsStationsImages.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 20/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class DetailsStationsImages: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    var PhotosArray: [Photo] = []
    @IBOutlet weak var TablePhotos: UITableView!
    var stationName:String!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = stationName
        TablePhotos.delegate = self
        TablePhotos.dataSource = self
        let p = Photo(Street: stationName,Name: "photo \(PhotosArray.count + 1)",photo:(UIImage(named: "photo_not_available_large"))!)
        PhotosArray.append(p)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.Add, target: self, action: #selector(addPicture))
        // Do any additional setup after loading the view.
    }
    func addPicture()
    {
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        else
        {
            print("Something went wrong")
            return
        }
        let p = Photo(Street: stationName,Name: "photo \(PhotosArray.count + 1)",photo:image)
        PhotosArray.append(p)
        TablePhotos.reloadData()
       picker.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Manipulation des tables implémentation du protocol uitableviewdatasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return PhotosArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        cell.photo = PhotosArray[indexPath.row]
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "OpenImage" {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let selectedTopic = PhotosArray[(TablePhotos.indexPathForSelectedRow?.row)!]
            let des = segue.destinationViewController as! ImageViewController
            des.Myimage.image = selectedTopic.myphoto
        }
    }

}
