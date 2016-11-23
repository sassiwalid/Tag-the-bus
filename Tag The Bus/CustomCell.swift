//
//  CustomCell.swift
//  Tag The Bus
//
//  Created by Walid Sassi on 21/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var stationImage: UIImageView!
    var photo : Photo?
        {
        didSet{
            updatecell()
        }
    }
    func updatecell(){
        nom.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        stationImage.image = photo?.myphoto
        nom.text = photo?.Name
    }
}
