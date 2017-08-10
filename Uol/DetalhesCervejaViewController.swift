//
//  DetalhesCervejaViewController.swift
//  Uol
//
//  Created by Vinicius Torres on 09/08/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import Kingfisher

class DetalhesCervejaViewController: UIViewController {
    
    @IBOutlet weak var imageIv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var taglineLbl: UILabel!
    @IBOutlet weak var abvLbl: UILabel!
    @IBOutlet weak var ibuLbl: UILabel!
    @IBOutlet weak var descriptionTv: UITextView!

    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadValues() {
        
        if beer != nil {
            
            let resource = ImageResource(downloadURL: URL(string: (beer?.image_url)!)!, cacheKey: beer?.name)
            let name = beer?.name
            let tagline = beer?.tagline
            let abv = beer?.abv
            let ibu = beer?.ibu
            let descriptionBeer = beer?.descriptionBeer
            
            imageIv.kf.setImage(with: resource)
            nameLbl.text = name
            taglineLbl.text = "Tagline: " + tagline!
            abvLbl.text = "Teor alcoólico: " + abv! + "%"
            ibuLbl.text = "Escala de amargor: " + ibu! + "%"
            descriptionTv.text = descriptionBeer
            
        }
        
    }
    
    func resizeTextView() {
        let fixedWidth = descriptionTv.frame.size.width
        descriptionTv.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = descriptionTv.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = descriptionTv.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        descriptionTv.frame = newFrame
    }
 

}
