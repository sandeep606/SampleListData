//
//  ListCarsTableViewCell.swift
//  ListDataSample
//
//  Created by ashish nakoti on 8/28/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit


class ListCarsTableViewCell: UITableViewCell {

    @IBOutlet weak var listCar_ImageV: UIImageView!
    @IBOutlet weak var listCar_description: UILabel!
    @IBOutlet weak var listCar_Title: UILabel!
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // will be called when a cell is selected/unselected.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
