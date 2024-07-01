//
//  FavoritesVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/24/24.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    let screenSize: CGRect = UIScreen.main.bounds
    var productsList: ProductsList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritesCollectionView.register(
            UINib(nibName: "RecommendedCell",
                  bundle: Bundle.main),
            forCellWithReuseIdentifier: RecommendedCell.identifier
        )
        productsList = JSONParsing.readJSONFromFile(fileName: "Products", type: ProductsList.self)!
       
    }

}

//MARK: - UICollectionView DataSource
extension FavoritesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList?.products.count ?? 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.identifier, for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
        if let item = productsList?.products {
            cell.setup(item[indexPath.item])
        }
            return cell
        
    }
    
    
}

//MARK: - UICollectionViewDelegate FlowLayout
extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width - 40, height: 200)
    }
}


