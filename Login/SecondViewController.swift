//
//  SecondViewController.swift
//  Login
//
//  Created by Melkor on 12/7/23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    // MARK: - IBActions
    
    
    @IBAction func logOutButton(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "userToken")
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
        
        // MARK: - Life Cycle
        func viewDidLoad() {
            super.viewDidLoad()
        }
        
        // MARK: - Methods
    }
}
