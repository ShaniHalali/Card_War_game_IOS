//
//  ResultController.swift
//  Card_game
//
//  Created by Shani Halali on 03/07/2025.
//

import UIKit
import AVFoundation

class ResultController: UIViewController {
    var finalScore: Int = 0
    var winner: String?
    @IBOutlet weak var theWinner: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var loseSound: AVAudioPlayer?
    var winSound: AVAudioPlayer?
    var loseSoundName = "losing_sound"
    var winSoundName = "victory_sound"
    var soundName = ""


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.text = winner ?? "Unknown"
        if(winner == "PC"){
            SoundManager.play(soundName: loseSoundName)
        }
        if (winner != "PC"){
            SoundManager.play(soundName: winSoundName)
            showConfetti()

        }

        score.text = "Your Score: \(finalScore)"
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(startVC, animated: true, completion: nil)
    }
   
       
       func showConfetti() {
           // Create the emitter layer that will emit the particles (confetti)
           let emitter = CAEmitterLayer()
           
           // Set the position of the emitter to the top center of the screen
           emitter.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -10)
           
           // Shape and size of the emission line (a horizontal line across the top)
           emitter.emitterShape = .line
           emitter.emitterSize = CGSize(width: view.bounds.width, height: 1)
           
           // Array to hold multiple confetti emitter cells with different colors
           var cells: [CAEmitterCell] = []
           
           // Create a confetti cell for each color
           for color in [UIColor.systemRed, UIColor.systemBlue, UIColor.systemYellow, UIColor.systemGreen] {
               let cell = CAEmitterCell()
               cell.birthRate = 6                         // Number of particles per second
               cell.lifetime = 5.0                        // How long each particle lasts
               cell.velocity = CGFloat.random(in: 100...200) // Speed of the particle
               cell.velocityRange = 50                   // Range for variation in velocity
               cell.emissionLongitude = .pi              // Emit downwards (180 degrees)
               cell.emissionRange = .pi / 4              // Spread angle
               cell.spin = 3.5                            // Base rotation speed
               cell.spinRange = 1.0                       // Variation in spin
               cell.scale = 0.05                          // Size of the particle
               cell.scaleRange = 0.02                     // Size variation
               cell.color = color.cgColor                 // Color of the confetti
               cell.contents = UIImage(named: "fireworks")?.cgImage // Image for the confetti
               cells.append(cell)
           }
           
           // Assign the cells to the emitter
           emitter.emitterCells = cells
           
           // Add the emitter layer to the view’s layer so it appears on screen
           view.layer.addSublayer(emitter)
           
           // Stop emitting new particles after 6 seconds
           DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
               emitter.birthRate = 0
           }
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
