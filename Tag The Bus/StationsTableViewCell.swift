//
//  StationsTableViewCell.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 20/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class StationsTableViewCell: UITableViewCell {

    @IBOutlet weak var stationImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    var photo : Photo?
        {
        didSet{
           updatecell()
        }
    }
    func updatecell(){
        stationImage.image = photo?.myphoto
        Name.text = photo?.Name
    }
}
