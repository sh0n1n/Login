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
    
    // MARK: - Properties
    
    private let activeColor = UIColor(named: "newColor") ?? UIColor.white
    private var email: String = ""
    private var password: String = ""
    
    private let mockEmail = "example01@gmail.com"
    private let mockPassword = "123345"
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        emailText.delegate = self
        passwordText.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction private func loginAction(_ sender: Any) {
        if email == mockEmail,
           password == mockPassword {
               performSegue(withIdentifier: "goToHomePage", sender: sender)
           } else {
               // TODO: Show Error
           }
    }
    
    @IBAction private func signupAction(_ sender: Any) {
        print("Sign Up")
    }
    
    // MARK: - Methods
    
    private func setupLoginButton() {
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 8
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        
        switch textField {
        case emailText:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopeImage.tintColor = .systemGray5
                emailLineView.backgroundColor = .systemGray5
            } else {
                envelopeImage.tintColor = activeColor
                emailLineView.backgroundColor = activeColor
            }
        case passwordText:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImage.tintColor = .systemGray5
                passwordLineView.backgroundColor = .systemGray5
            } else {
                lockImage.tintColor = activeColor
                passwordLineView.backgroundColor = activeColor
            }
        default:
            print("Unknown textfield")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password:String) -> Bool {
        let containsUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let containsNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        
        return password.count >= 4 && containsUppercase && containsNumber
    }
}
