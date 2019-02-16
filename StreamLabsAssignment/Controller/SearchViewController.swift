//
//  SearchViewController.swift
//  StreamLabsAssignment
//
//  Created by Junior on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    var images = ["thor","captain-america","deadpool","thanos","ironman","spiderman","blackwidow","loki","shuri","drax","war_machine"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.hideKeyboardWhenTappedAround()

    }
    
}



extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchItemCell", for: indexPath) as! ProfileItemCollectionViewCell
        cell.itemImageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    

}
