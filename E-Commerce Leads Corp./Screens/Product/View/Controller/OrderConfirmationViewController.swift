//
//  OrderConfirmationViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "goToUserProfileVC", sender: .none)
    }
    
}
