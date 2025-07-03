//
//  ViewController.swift
//  Card_game
//
//  Created by Shani Halali on 18/05/2025.
//

import UIKit

class ViewController: UIViewController, LocationManagerDelegate {
    
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var east: UIImageView!
    @IBOutlet weak var west: UIImageView!
    var hasName = false
    
    let locationManager = LocationManager()
    var userSide: String? // East or West
    var name: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Check if a username is stored in UserDefaults
        locationManager.delegate = self
        locationManager.requestLocation()

       
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            locationManager.requestLocation()
            
        let defaults = UserDefaults.standard
        if let storedName = defaults.string(forKey: "username") {
            hasName = true
            name = storedName
            username.text = "Hii \(storedName)"
        } else {
            startGameButton.setTitle("Enter your name", for: .normal)
        }

        }
    
    @IBAction func startGame(_ sender: Any) {
        if(hasName && userSide != nil){
            goToSecondScreen()
            
        }else if !hasName{
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
                    self.name = nameInput
                    // Update UI
                    self.username.text = "Hii \(nameInput)"
                    self.startGameButton.setTitle("Start Game", for: .normal)
                    self.hasName = true
                }
            }
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else if userSide == nil {
            showMissingLocationAlert()

        }
    }
    
    
    func  goToSecondScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = storyboard.instantiateViewController(withIdentifier: "GameController") as! GameController
        //pass name
        gameVC.name = self.name
        print("name = \(name)")
        //pass side
        gameVC.userSide = self.userSide
        print("user side = \(userSide)")
        
        
        self.present(gameVC, animated: true, completion: nil)
    }
    
    func didUpdateLocation(location: Location) {
            print("didUpdateLocation called with longitude: \(location.longitude)")
            let userLongitude = location.longitude
            let referenceLongitude = 34.8175491683243340
            let defaults = UserDefaults.standard

            if userLongitude > referenceLongitude {
                DispatchQueue.main.async {
                    self.userSide = "East"
                    let storedSide = defaults.string(forKey: "userSide")
                    self.showEastSide()
                }
            }
            
            else {
                DispatchQueue.main.async {
                    self.userSide = "West"
                    let storedSide = defaults.string(forKey: "userSide")
                    self.showWestSide()
                }
                
            }
            
        }
        
        func didFailWithError(err: any Error) {
            print("Location Error: \(err.localizedDescription)")
        }
        
        func showEastSide() {
            print("EAST SELECTED")
            east.alpha = 1.0
            west.alpha = 0.1
        }
        
        func showWestSide() {
            print("WEST SELECTED")
            west.alpha = 1.0
            east.alpha = 0.1
        }
    func showMissingLocationAlert() {
            let alert = UIAlertController(title: "Location Not Ready", message: "We couldn't determine your side because location access is not enabled. Please allow location access in Settings and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
}



