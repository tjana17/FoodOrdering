//
//  OnboardingVC.swift
//  FoodOrdering
//
//  Created by Jana's MacBook Pro on 6/19/24.
//

import UIKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startOrderingClicked(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UITabBarController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
}
