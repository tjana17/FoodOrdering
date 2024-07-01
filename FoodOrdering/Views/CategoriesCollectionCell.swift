//
//  CategoriesCollectionCell.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {
    
    static let identifier = String(String(describing: CategoriesCollectionCell.self))
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    
    func setup(_ category: CategoryItem) {
        categoryTitleLbl.text = category.name
        categoryImageView.image = UIImage(named: category.image)
    
    }
    
}
