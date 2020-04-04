//
//  MenueTableViewCell.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 03/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class MenueTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var menuItemImageView: UIImageView!
    
    @IBOutlet weak var menuItemNamelabe: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        menuItemNamelabe.textColor = selected ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
