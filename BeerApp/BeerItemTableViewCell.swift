//
//  BeerItemTableViewCell.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 10/05/22.
//

import UIKit
import Kingfisher //?

class BeerItemTableViewCell: UITableViewCell {
    //@IBOutlet weak var beerItemTableViewCell: BeerItemTableViewCell!
    
    
    @IBOutlet weak var contentView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
