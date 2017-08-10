//
//  BeerCollectionViewCell.swift
//  Uol
//
//  Created by Vinicius Torres on 09/08/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var beerImageIV: UIImageView!
    @IBOutlet weak var beerNameLbl: UILabel!
    @IBOutlet weak var beerABVLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
