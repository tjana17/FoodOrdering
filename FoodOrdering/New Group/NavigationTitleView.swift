//
//  NavigationTitleView.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/20/24.
//

import UIKit

class NavigationTitleView: UIButton {
    
    var locationImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "location-tick")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .gray
        return imageView
    }()
    
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.75
        lbl.textColor = .gray
        lbl.font = UIFont(name: "Nunito-Medium", size: 16.0)
        return lbl
    }()
    
    var titleStackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    
    var lblSubTitle: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.75
        lbl.textColor = .black
        lbl.font = UIFont(name: "Nunito-Medium", size: 16.0)
        return lbl
    }()
    
    var arrowImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "arrow-down")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .black
        return imageView
    }()
    
    var subTitleStackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    var verticalStackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUIView() {
        addSubViews()
        prepareConstraint()
    }
    
    func addSubViews() {
        titleStackView.addArrangedSubview(locationImageView)
        titleStackView.addArrangedSubview(lblTitle)
        subTitleStackView.addArrangedSubview(lblSubTitle)
        subTitleStackView.addArrangedSubview(arrowImage)
        verticalStackView.addArrangedSubview(titleStackView)
        verticalStackView.addArrangedSubview(subTitleStackView)
        self.addSubview(verticalStackView)
    }
    
    func prepareConstraint() {
        verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        verticalStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
    }
    
}

//MARK: -  Config Methods
extension NavigationTitleView {
    func configure(_ title: String, _ subTitle: String) {
        lblTitle.text = title
        lblSubTitle.text = subTitle
    }
}
