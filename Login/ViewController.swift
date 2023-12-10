//
//  ViewController.swift
//  Login
//
//  Created by Melkor on 12/7/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailLineView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var envelopeImage: UIImageView!
    @IBOutlet weak var passwordLineView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dontHaveAccoutLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
    }
    
    // MARK: - IBActions
    
    @IBAction private func loginAction(_ sender: Any) {
        performSegue(withIdentifier: "goToHomePage", sender: sender)
    }
    
    @IBAction private func signupAction(_ sender: Any) {
        print("Sign Up")
    }
    
    // MARK: - Methods
    
    private func setupLoginButton() {
        loginButton.layer.shadowColor = (UIColor(named: "newColor") ?? UIColor.white).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 8
    }
}
