//
//  CartProductsCell.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/24/24.
//

import UIKit

class CartProductsCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var itemQuantityLbl: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    static let identifier = String(describing: CartProductsCell.self)
    
    func setup(_ item: RecommendedItems) {
        itemNameLbl.text = item.name
        itemPriceLbl.text = item.price
        itemImageView.image = UIImage(named: item.itemImage)
    }
    
}
