//
//  RegestrationViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class RegestrationViewController: UIViewController {


    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var verifyPasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "regesterToOrderConfirmedVC", sender: .none)
//        
//        guard let userName = nameField.text, !userName.isEmpty,
//                 let email = emailField.text, !email.isEmpty,
//                 let password = passwordField.text, !password.isEmpty,
//                 let verifyPassword = verifyPasswordField.text, !verifyPassword.isEmpty
//            else {
//                return
//            }
//
//            if password == verifyPassword {
//                
//                performSegue(withIdentifier: "regesterToOrderConfirmedVC", sender: .none)
////                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
////                    if let error = error {
////                        print("Error registering user: \(error.localizedDescription)")
////                        return
////                    }
////                    print("User registered successfully.")
////                }
//            } else {
//                print("Password does not match")
//            }
    }
}
