//
//  ViewController.swift
//  Race
//
//  Created by user on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func settingsAction(_ sender: Any) {
        let alert = UIAlertController(title: "Settings name", message: "Enter player nickname", preferredStyle: .alert)
        
        // add NICKNAME text field
        alert.addTextField{ (textField) in textField.placeholder = "Player name"
        }
    
        // add Cancel button
        let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        // show the form
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func closeApp(_ sender: Any) {
        exit(0)
    }
    
}

