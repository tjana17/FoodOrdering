//
//  ProductDetailsVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet weak var deliveryTimeLbl: UILabel! {
        didSet {
            deliveryTimeLbl.addImage(UIImage(named: "clock") ?? UIImage(), toStartWith: 20)
        }
    }
    @IBOutlet weak var reviewsLbl: UILabel! {
        didSet {
            reviewsLbl.addImage(UIImage(named: "message") ?? UIImage(), toStartWith: 20)
        }
    }
    @IBOutlet weak var ratingsLbl: UILabel! {
        didSet {
            ratingsLbl.addImage(UIImage(named: "star") ?? UIImage(), toStartWith: 20)
        }
    }
    
    @IBOutlet weak var quantitySectionView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var minusBtn: UIButton! {
        didSet {
            minusBtn.tintColor = selectedQuantity == 1 ? .gray : .black
            minusBtn.isEnabled = selectedQuantity == 1 ? false : true
        }
    }
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var smallView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            smallView.tag = 0
            smallView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var mediumView: UIView!{
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            mediumView.tag = 1
            mediumView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var largeView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            largeView.tag = 2
            largeView.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var largeCupImage: UIImageView!
    @IBOutlet weak var largeLbl: UILabel!
    @IBOutlet weak var mediumLbl: UILabel!
    @IBOutlet weak var mediumCupImage: UIImageView!
    @IBOutlet weak var smallLbl: UILabel!
    @IBOutlet weak var smallCupImage: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    var selectedProduct : Product?
    var selectedQuantitySize: Int = 0
    var selectedQuantity: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        setupQuantity(sender?.view?.tag ?? 0)
    }
    
    func setupQuantity(_ index: Int) {
        smallView.backgroundColor   = index == 0 ? UIColor(hexString: "#403F3E") : .white
        mediumView.backgroundColor  = index == 1 ? UIColor(hexString: "#403F3E") : .white
        largeView.backgroundColor   = index == 2 ? UIColor(hexString: "#403F3E") : .white
        
        smallLbl.textColor  = index == 0 ?  .white : UIColor(hexString: "#403F3E")
        mediumLbl.textColor = index == 1 ?  .white : UIColor(hexString: "#403F3E")
        largeLbl.textColor  = index == 2 ?  .white : UIColor(hexString: "#403F3E")
        
        smallCupImage.image = UIImage(named:  index == 0 ? "paper-cup-filled" : "paper-cup")
        mediumCupImage.image = UIImage(named: index == 1 ? "paper-cup-filled" : "paper-cup")
        largeCupImage.image = UIImage(named: index == 2 ? "paper-cup-filled" : "paper-cup")
        selectedQuantitySize = index
        print("Selected Quantity = \(selectedQuantitySize)")
    }
    
    @IBAction func stepperTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            selectedQuantity -= 1
        } else if sender.tag == 2 {
            selectedQuantity += 1
        }
        minusBtn.tintColor = selectedQuantity == 1 ? .gray : .black
        minusBtn.isEnabled = selectedQuantity == 1 ? false : true
        quantityLbl.text = "\(selectedQuantity)"
    }
    
    func setupUI() {
        if let item = selectedProduct {
            reviewsLbl.text = " \(item.reviews)"
            ratingsLbl.text = " \(item.rating)"
            nameLbl.text = item.name
            priceLbl.text = item.price
            descriptionLbl.text = item.description
            productImageView.downloaded(from: item.image)
            reviewsLbl.addImage(UIImage(named: "message") ?? UIImage(), toStartWith: 20)
            ratingsLbl.addImage(UIImage(named: "star") ?? UIImage(), toStartWith: 20)
        }
    }
    

}
