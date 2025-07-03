//
//  ViewController.swift
//  Card_game
//
//  Created by Shani Halali on 18/05/2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var east: UIImageView!
    @IBOutlet weak var west: UIImageView!
    var hasName = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Check if a username is stored in UserDefaults
        let defaults = UserDefaults.standard
        if let storedName = defaults.string(forKey: "username") {
            hasName = true
            username.text = "Hii \(storedName)"
        } else {
            startGameButton.setTitle("Enter your name", for: .normal)
        }
        
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        if(hasName){
            goToSecondScreen()
            
        }else{
            // Create an alert with a text field
            let alert = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
            
            alert.addTextField { textField in
                textField.placeholder = "Your name"
            }
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                if let nameInput = alert.textFields?.first?.text, !nameInput.isEmpty {
                    // Save the name to UserDefaults
                    let defaults = UserDefaults.standard
                    defaults.set(nameInput, forKey: "username")
                    
                    // Update UI
                    self.username.text = "Hii \(nameInput)"
                    self.startGameButton.setTitle("Start Game", for: .normal)
                    self.hasName = true
                }
            }
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func  goToSecondScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = storyboard.instantiateViewController(withIdentifier: "GameController") as! GameController
        self.present(gameVC, animated: true, completion: nil)
    }
}



