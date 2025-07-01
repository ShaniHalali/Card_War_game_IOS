//
//  ViewController.swift
//  Card_game
//
//  Created by Shani Halali on 18/05/2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var east: UIImageView!
    @IBOutlet weak var west: UIImageView!
    var name = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // background.image = UIImage(named: "background")
        //east.image = UIImage(named: "east")
       // west.image = UIImage(named: "west")
        
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        if(name){
           goToSecondScreen()

        }else{
           print("You must select a card before continuing.")

        }
        
    }
    func  goToSecondScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = storyboard.instantiateViewController(withIdentifier: "GameController") as! GameController
        self.present(gameVC, animated: true, completion: nil)
    }
    

}

