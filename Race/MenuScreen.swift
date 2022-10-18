//
//  ViewController.swift
//  Race
//
//  Created by user on 11.10.2022.
//

import UIKit

var playerName: String? = ""

class MenuScreen: UIViewController {
    
    @IBOutlet weak var btStartNewGame: GameButton!
    @IBOutlet weak var btResult: GameButton!
    @IBOutlet weak var btSettings: GameButton!
    @IBOutlet weak var btExit: GameButton!
   
    
    // ways to store: Core Data, realm, UserDefaults (simle, dictionary)
    var db = UserDefaults.standard
 //   var playerName: String?
 //   var userCar: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        //
        // May set buttons corner radius here instead of GameButton class
        //
        btStartNewGame.layer.cornerRadius = 10
        btResult.layer.cornerRadius = 10
        btSettings.layer.cornerRadius = 10
        btExit.layer.cornerRadius = 10
         */
        
        playerName = db.string(forKey: "playerName")
        // print(db.string(forKey: "playerName") as Any)
    }

    @IBAction func settingsAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Player settings", message: "Enter player nickname.\n Nickname is now \(String(describing: db.string(forKey: "playerName")))", preferredStyle: .alert)
        
        // add NICKNAME text field
        alert.addTextField{ (textField) in textField.placeholder = "Player name"
        }
        
        // add NICKNAME text field
        //alert.addTextField{ (textField) in textField.placeholder = "Select car"
        //}
        
        
        // add Confirm button
        let saveAction = UIAlertAction(title: "Confirm", style: .default) { [self] (action) in
            self.db.set(playerName, forKey: "playerName")
            playerName = alert.textFields![0].text
        }
  
        alert.addAction( saveAction )
  
        // add Next button
        let nextAction = UIAlertAction(title: "Next", style: .default) { [self] (action) in
            
            // go to MENU
            self.performSegue(withIdentifier: "segueSettingsToChangeCar", sender: nil)
        }
        alert.addAction( nextAction )
        
        // add Cancel button
        let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction( cancelAction )
            
        // show the form
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func closeApp(_ sender: Any) {
        exit(0)
    }
    
}

