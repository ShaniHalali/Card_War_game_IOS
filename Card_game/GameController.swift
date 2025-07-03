//
//  GameController.swift
//  Card_game
//
//  Created by Shani Halali on 01/07/2025.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var background: UIImageView!
    var isStop = true
    @IBOutlet weak var timerLabel: UILabel!
    var countdownTimer: Timer?
    var pauseTimer: Timer?
    var currentCount = 5
    var repeatCount = 0
    let maxRepeats = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //background.image = UIImage(named: "background")
        
        changeIcon(stop: isStop)
        startCountdown()

    }
    func changeIcon(stop: Bool){
        var playIcon: UIImage?

        if(isStop){
            playIcon = UIImage(systemName: "pause.fill")

        }else{
            playIcon = UIImage(systemName: "play.fill")

        }
        pause.setImage(playIcon, for: .normal)
        pause.layer.cornerRadius = pause.frame.height / 2
        pause.clipsToBounds = true

    }

    @IBAction func puseTapped(_ sender: UIButton) {
        isStop.toggle()
        changeIcon(stop: isStop)
        
    }
    
    func startCountdown() {
            currentCount = 5
            timerLabel.text = "\(currentCount)"
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.currentCount -= 1
                self.timerLabel.text = "\(self.currentCount)"
                if self.currentCount == 0 {
                    timer.invalidate()
                    self.handlePause()
                }
            }
        }

        func handlePause() {
            repeatCount += 1
            if repeatCount >= maxRepeats {
                timerLabel.text = "Done!"
                return
            }

            pauseTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                self.startCountdown()
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
