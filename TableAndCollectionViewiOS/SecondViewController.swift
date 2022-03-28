//
//  SecondViewController.swift
//  TableAndCollectionViewiOS
//
//  Created by Leo Lopez on 27/3/22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var pokemons: [Pokemon] = [
        Pokemon(name: "Pikachu", image: "", isCf: true),
        Pokemon(name: "Bulbasor", image: "", isCf: false),
        Pokemon(name: "Voltor", image: "", isCf: true),
        Pokemon(name: "Mew", image: "", isCf: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "MySecondCell", bundle: nil), forCellWithReuseIdentifier: "mySecondCell")
        collectionView.register(UINib(nibName: "MyThirdCell", bundle: nil), forCellWithReuseIdentifier: "myThirdCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - ICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout - iOS 12<
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mySecondCell", for: indexPath) as? MySecondCell
        cell?.titleLabel.text = "a \(indexPath)"
        
        if pokemons[indexPath.row].isCf == true {
            cell?.colorView.backgroundColor = UIColor.green
        } else {
            cell?.colorView.backgroundColor = UIColor.gray
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return CGSize(width: collectionView.frame.width/2.0, height: 256)
        } else {
            return CGSize(width: collectionView.frame.width/5.0, height: 256)
        }
    }
}
