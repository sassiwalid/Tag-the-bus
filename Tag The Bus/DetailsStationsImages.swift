//
//  DetailsStationsImages.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 20/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class DetailsStationsImages: UIViewController, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TablePhotos: UITableView!
    var stationName:String!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = stationName
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.Add, target: self, action: #selector(addPicture))
        // Do any additional setup after loading the view.
    }
    func addPicture()
    {
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
         picker.dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let p = Photo(Street: stationName,Name: "photo \(PhotosArray.count + 1)",photo:image)
            PhotosArray.append(p)
        } else{
            print("Something went wrong")
        }
        TablePhotos.reloadData()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return PhotosArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!StationsTableViewCell
        cell.photo = PhotosArray[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
