//
//  CartVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/24/24.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [RecommendedItems] = [
        RecommendedItems.init(name: "Cheese burgers", price: "$8.09", rating: "4.2", itemImage: "burger_product"),
        RecommendedItems.init(name: "Margherita Pizza", price: "$8.50", rating: "4.8", itemImage: "pizza"),
        RecommendedItems.init(name: "Cheese burgers", price: "$8.09", rating: "4.2", itemImage: "burger_product"),
        RecommendedItems.init(name: "Margherita Pizza", price: "$8.50", rating: "4.8", itemImage: "pizza")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(
            UINib(nibName: "CartProductsCell",
                  bundle: Bundle.main),
            forCellReuseIdentifier: CartProductsCell.identifier
        )
        tableView.register(
            UINib(nibName: "CartTotalCell",
                  bundle: Bundle.main),
            forCellReuseIdentifier: CartTotalCell.identifier
        )
    }
    
}

extension CartVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductsCell.identifier) as? CartProductsCell else { return UITableViewCell() }
            cell.setup(items[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTotalCell.identifier) as? CartTotalCell else { return UITableViewCell() }
//            cell.setup(items[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
}
