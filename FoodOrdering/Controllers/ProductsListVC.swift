//
//  ProductsListVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/25/24.
//

import UIKit

class ProductsListVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let screenSize: CGRect = UIScreen.main.bounds
    var productsList: ProductsList?
    var selectedCategory = String()
    var products = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: "RecommendedCell",
                  bundle: Bundle.main),
            forCellWithReuseIdentifier: RecommendedCell.identifier
        )
        title = selectedCategory
        productsList = JSONParsing.readJSONFromFile(fileName: "Products", type: ProductsList.self)!
        if let product = productsList?.products {
            if selectedCategory != "All" {
                products = product.filter({$0.categoryName == selectedCategory})
            } else { products = product }
        }
    }

}

//MARK: - UICollectionView DataSource
extension ProductsListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.identifier, for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            cell.setup(products[indexPath.item])
            return cell

    }
}

//MARK: - UICollectionView Delegate
extension ProductsListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
        controller.hidesBottomBarWhenPushed = true
        controller.selectedProduct = products[indexPath.item]
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - UICollectionViewDelegate FlowLayout
extension ProductsListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width - 40, height: 200)
    }
}
