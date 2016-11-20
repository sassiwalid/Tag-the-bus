//
//  DetailsStationsImages.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 20/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class DetailsStationsImages: UIViewController, UIImagePickerControllerDelegate {
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
