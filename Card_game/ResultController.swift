//
//  ResultController.swift
//  Card_game
//
//  Created by Shani Halali on 03/07/2025.
//

import UIKit

class ResultController: UIViewController {
    var finalScore: Int = 0
    var winner: String?
    @IBOutlet weak var theWinner: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.text = winner ?? "Unknown"
        score.text = "Your Score: \(finalScore)"
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(startVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
