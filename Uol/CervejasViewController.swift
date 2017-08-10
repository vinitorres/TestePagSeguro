//
//  ViewController.swift
//  Uol
//
//  Created by Vinicius Torres on 09/08/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class CervejasViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate var listBeers = [Beer]()
    fileprivate var selectedBeer: Beer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Beers"
        
        self.collectionView.register(UINib(nibName: "BeerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
        loadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        
        
        APIUtils.getAllBeers(callback: { result in
            
            if result.response!.statusCode != 200 {
                
                print("Erro httpRequest: " + (result.response?.statusCode.description)!)
            } else {
                
                let jsonObject = JSON(data: result.data!)
                
                if let arrayBeers = jsonObject.arrayObject {
                    for beerObject in arrayBeers {
                        
                        let beer = Beer(json: JSON(beerObject))
                        self.listBeers.append(beer)
                        
                        self.collectionView.reloadData()
                        
                    }
                    
                }
                
            }
            
        })
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "detalhesSegue" {
            if let destination = segue.destination as? DetalhesCervejaViewController {
                
                destination.beer = selectedBeer
            
            }
        }
        
    }

}

extension CervejasViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var viewSize = CGSize()
        
        if let width = collectionViewLayout.collectionView?.bounds.size.width {
            if let height = collectionViewLayout.collectionView?.bounds.size.height {
                viewSize.width = width/2 - 6
                
                //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! BeerCollectionViewCell
                
                viewSize.height = height/3
            }
            
        }else {
            viewSize.width = 128; viewSize.height = 128
            
        }
        
        return viewSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listBeers.count
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! BeerCollectionViewCell
        
        cell.layer.borderColor = Color.darkGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 2
        
        let resource = ImageResource(downloadURL: URL(string: listBeers[indexPath.row].image_url!)!, cacheKey: listBeers[indexPath.row].name)
        cell.beerImageIV.kf.setImage(with: resource)
        
        cell.beerNameLbl.text = listBeers[indexPath.row].name
        let abv = (listBeers[indexPath.row].abv! as NSString).floatValue
        cell.beerABVLbl.text = "Teor alcoólico: \(String(format: "%.2f", abv))" + "%"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBeer = listBeers[indexPath.row]
        performSegue(withIdentifier: "detalhesSegue", sender: self)
    }
    
    
}

