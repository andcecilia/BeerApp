//
//  BeerItemTableViewCell.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 10/05/22.
//

import UIKit
import Kingfisher

class BeerItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerAlcoholContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(url: URL?,
                          beerName: String?,
                          beerAlcoholContent: String?) {

        if let imageUrl = url {
            beerImageView.kf.setImage(
                with: imageUrl,
                placeholder: nil,
                options: [
                    .transition(.fade(0.35))
                ]
            )
        }
        
        if let beerName = beerName {
            beerNameLabel.text = beerName
        }
        
        if let beerAlcoholContent = beerAlcoholContent {
            beerAlcoholContentLabel.text = beerAlcoholContent
        }
    }
}
