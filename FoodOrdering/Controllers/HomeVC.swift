//
//  HomeVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import UIKit

class HomeVC: UIViewController {

    ///Design Outlets Declarations
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    
    ///Variable Declarations
    var navTitleView: NavigationTitleView = NavigationTitleView()
    var categories : Categories?
    var productsList: ProductsList?
    var recommendedList: [Product]?
    
    let recommendedItem: [RecommendedItems] = [
        RecommendedItems.init(name: "Cheese burgers", price: "$8.09", rating: "4.2", itemImage: "burger_product"),
        RecommendedItems.init(name: "Margherita Pizza", price: "$8.50", rating: "4.8", itemImage: "pizza")
    ]
    
    ///View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavUI()
        recommendedCollectionView.register(
            UINib(nibName: "RecommendedCell",
                  bundle: Bundle.main),
            forCellWithReuseIdentifier: RecommendedCell.identifier
        )
        
        categories = JSONParsing.readJSONFromFile(fileName: "Categories", type: Categories.self)!
        productsList = JSONParsing.readJSONFromFile(fileName: "Products", type: ProductsList.self)
        if let products = productsList?.products {
            recommendedList = products.filter({$0.isRecommended == true})
        }
    }

}

//MARK: - Custom navigation
extension HomeVC {
    func setupNavUI() {
        navTitleView.configure("Del. Address", "Ikeja, Lagos")
        navigationItem.titleView = navTitleView
    }
}

//MARK: - UICollectionView DataSource
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories?.category.count ?? 1
        case recommendedCollectionView:
            return recommendedList?.count ?? 1
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionCell.identifier, for: indexPath) as? CategoriesCollectionCell else { return UICollectionViewCell() }
            if let item = categories?.category {
                cell.setup(item[indexPath.item])
            }
            return cell
        case recommendedCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.identifier, for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            cell.favoritesBtn.isHidden = true
            if let item = recommendedList {
                cell.setup(item[indexPath.item])
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}

//MARK: - UICollectionView Delegate
extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == recommendedCollectionView {
            let controller = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
            controller.hidesBottomBarWhenPushed = true
            if let item = recommendedList {
                controller.selectedProduct = item[indexPath.item]
            }
            
            navigationController?.pushViewController(controller, animated: true)
        } else if collectionView == categoriesCollectionView {
            let controller = storyboard?.instantiateViewController(withIdentifier: "ProductsListVC") as! ProductsListVC
            controller.hidesBottomBarWhenPushed = true
            if let item = categories?.category {
                controller.selectedCategory = item[indexPath.item].name
            }
            navigationController?.pushViewController(controller, animated: true)
        }
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
    }
}

//MARK: - UICollectionViewDelegate FlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recommendedCollectionView {
            return CGSize(width: 318, height: 200)
        } else {
            return CGSize(width: 80, height: 110)
        }
    }
}
