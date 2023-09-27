//
//  LoginViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "loginToOrderConfirmedVC", sender: .none)
    }
    
    @IBAction func regestrationButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToRegisterVC", sender: .none)
    }
    
}
