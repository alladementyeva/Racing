//
//  GameScreen.swift
//  Race
//
//  Created by user on 14.10.2022.
//

import UIKit

class GameScreen: UIViewController {

    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var finishLine: UIImageView!
    
    @IBOutlet weak var btDrive: GameButton!
    @IBOutlet weak var btStart: GameButton!
    @IBOutlet weak var btBack: GameButton!
    
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var semaforTimer = Timer()
    var pcCarTimer = Timer()
    var gameTimer = Timer()
    var gameTime: Int = 0

    
    var stateSemafor: Int = 1
    let stateGreen: Int = 1
    let stateRed: Int = 2
    
    let userCarStep: CGFloat = 100
    let pcCarStep: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // playerName is required for Result screen
        if let _ = playerName {
            // ok, playerName is not null
        } else {
            playerName = db.string(forKey: "playerName") ?? ""
        }
         */
    
        btStart.enable(true)
        btBack.enable(true)
        btDrive.enable(false)
        
        initCars()
    }
    
    func initCars()
    {
        userCar.image = UIImage(named: userCarImage )
        
        // put cars at start
        pcCar.center.x = pcCar.image!.size.width / 2 + 5
        userCar.center.x = userCar.image!.size.width / 2 + 5
    }
    // on START button click
    @IBAction func startGameAction(_ sender: Any) {
        
        // print( "startGameAction" )
        // output semafor label
        switchSemafor()         // semafor starts with RED
        // switchSemafor()      // now with GREEN
        
        btStart.enable(false)
        btBack.enable(false)
        btDrive.enable(true)
        
        // put cars at start
        initCars()
        
        // print("start game")
        semaforTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(switchSemafor), userInfo: nil, repeats: true)

        pcCarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
        
        timerLabel.text = "00:00"
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(gameTick), userInfo: nil, repeats: true)
    }
    
    @objc func gameTick() {
        gameTime += 1
        timerLabel.text = Secs2MinSec(gameTime)
    }
    
    @objc func switchSemafor() {
        ///if stateSemafor >= stateRed {stateSemafor = 0}
        // stateSemafor += 1
        if stateSemafor == stateGreen
        {
            stateSemafor = stateRed
         }
        else {
            stateSemafor = stateGreen
        }
  
        // print( stateSemafor )
        
        switch stateSemafor {
        case stateGreen:
            semaforLabel.text = "DRIVE"
            semaforLabel.textColor = UIColor(named: "Green")
            print("GREEN")
 //       case 2:
 //           semaforLabel.text = "!!!"
 //           semaforLabel.textColor = .yellow
 //           print("YELLOW")
        case stateRed:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = UIColor(named: "Red")
            print("RED")
        default:
            break
        }
    }
    
    @objc func pcDrive() {
        if stateSemafor != stateRed {
            pcCar.center.x = pcCar.center.x + pcCarStep
        }
        
        if pcCar.center.x >= finishLine.center.x {
            onGameIsOver(false)
        }
    }
    
    @IBAction func driveUserCarAction(_ sender: UIButton) {
        if stateSemafor == stateRed {
            // keep left side
            //if userCar.center.x >= 0 {
                userCar.center.x -= userCarStep
            //}
        }
        else
        {
            userCar.center.x += userCarStep
        }
        
        if userCar.center.x >= finishLine.center.x {
            onGameIsOver(true)
        }
    }
    
    
    // show dialog when the game is over
    func onGameIsOver(_ gameResult: Bool) {
        
        let message = gameResult ? "You win" : "You lose"
        
        // clear timers, reset buttons
        self.endGame()
        
        let ac = UIAlertController(title: "Game over", message: message, preferredStyle: .alert )
        
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
/*
            // go to MENU
            self.performSegue(withIdentifier: "segueToMenu", sender: nil)
            
            // remove the alert because it is not required any more.
            // runtime wrn: Race[92809:5681394] [Presentation] Attempt to present <UIAlertController: 0x7f8691015a00> on <Race.GameScreen: 0x7f868ff2d580> (from <Race.GameScreen: 0x7f868ff2d580>) which is already presenting <UIAlertController: 0x7f8692015800>.
            ac.dismiss(animated: false)
            
            results.append(resultData(playerName: "me", gameResult: "asdf", timeResult: "1234"))
  */

        results.append(resultData(playerName: playerName!, gameResult: message, timeResult: Secs2MinSec(gameTime)))
        
        ac.addAction(confirmAction)
        
        self.present(ac, animated: true)
    }
    
    // clear timers etc.
    func endGame()
    {
        // setup buttons
        btStart.enable(true)
        btBack.enable(true)
        btDrive.enable(false)
        
        // stop timers
        self.semaforTimer.invalidate()
        self.pcCarTimer.invalidate()
        self.gameTimer.invalidate()
    }
 
    func Secs2MinSec(_ counter: Int) -> String {
       let nMinutes = (Int)(counter / 60)
       var sMinutes: String = "\(nMinutes)"
       if nMinutes < 10 {
           sMinutes = "0" + sMinutes
       }
       
       let nSeconds = counter % 60
       var sSeconds: String = String(nSeconds)
       if nSeconds < 10 {
           sSeconds = "0" + sSeconds
       }
       
       return sMinutes + ":" + sSeconds
        
    }
    
    /*
    func enableButton(_ btn: UIButton, _ isEnabled: Bool) {
        let activeColor = btn.titleLabel?.text == "Drive" ? "Green" : "Red"
        btn.isEnabled = isEnabled
        btn.backgroundColor = isEnabled ? UIColor(named: activeColor) : UIColor(named:"Grey")        //var clr: CGColor!
    }
    */
}
