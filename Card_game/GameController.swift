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
    var isStop = false
    @IBOutlet weak var timerLabel: UILabel!
    var countdownTimer: Timer?
    var pauseTimer: Timer?
    var currentCount = 5
    var repeatCount = 1
    let maxRepeats = 11
    
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var eastCard: UIImageView!
    @IBOutlet weak var westCard: UIImageView!
    
    @IBOutlet weak var westScore: UILabel!
    @IBOutlet weak var eastScore: UILabel!
    var west = 0
    var east = 0
    var cards = [#imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "joker")]
    var name: String?
    var userSide: String?
    
   // @IBOutlet weak var eastPlayer: UILabel!
    @IBOutlet weak var eastPlayer: UILabel!
    
    @IBOutlet weak var westPlayer: UILabel!
    var playerOnEast: String?
    var playerOnWest: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //background.image = UIImage(named: "background")
        
        changeIcon(stop: isStop)
        userPlaySide()
        westScore.text = String(west)
        eastScore.text = String(east)
        startCountdown()

    }
    func userPlaySide(){
        if (userSide == nil){
            print("use side = \(userSide)")
        }
        print("use side = \(userSide)")

        if(userSide == "East"){
            playerOnEast = name
            eastPlayer.text = playerOnEast
            playerOnWest = "PC"
            westPlayer.text = playerOnWest

        }else if (userSide == "West"){
            playerOnWest = name
            westPlayer.text = playerOnWest
            playerOnEast = "PC"
            eastPlayer.text = playerOnEast


        }
        
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
        if(isStop){
            // Stop both timers if running
                   countdownTimer?.invalidate()
                   pauseTimer?.invalidate()
                   countdownTimer = nil
                   pauseTimer = nil
               } else {
                   startCountdown()
               }
        
    }
    
    func startCountdown() {
        if currentCount == 0 || currentCount == 5 {
            currentCount = 5
        }
            round.text = "Round: " + "\(repeatCount)"
            eastCard.image = #imageLiteral(resourceName: "backcard")
            westCard.image = #imageLiteral(resourceName: "backcard")

            timerLabel.text = "\(currentCount)"
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.isStop {
                timer.invalidate()
                return
            }
                self.currentCount -= 1
                self.timerLabel.text = "\(self.currentCount)"
                if self.currentCount == 0 {
                    timer.invalidate()
                    let eastIndex = Int.random(in: 0..<self.cards.count)
                    let westIndex = Int.random(in: 0..<self.cards.count)

                    // Reveal the actual cards
                    self.eastCard.image = self.cards[eastIndex]
                    self.westCard.image = self.cards[westIndex]

                    // Compare the card values and update score
                    if eastIndex > westIndex {
                        self.east += 1
                        self.eastScore.text = String(self.east)
                    } else if westIndex > eastIndex {
                        self.west += 1
                        self.westScore.text = String(self.west)
                    } // If equal, no score update

                    // Proceed to pause before next round
                    self.handlePause()


                }
            }
        }

        func handlePause() {
            repeatCount += 1
            if repeatCount >= maxRepeats {
                timerLabel.text = "Done!"
                goToResultScreen()
                return
            }
            
            pauseTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                self.startCountdown()
            }
        }
    
    func goToResultScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultController") as! ResultController
        
        // Pass the scores
        if(east > west){
            resultVC.finalScore = self.east
            resultVC.winner = self.playerOnEast

        }else if (west > east){
            resultVC.finalScore = self.west
            resultVC.winner = self.playerOnWest

        }else if (west == east){
            resultVC.finalScore = self.west
            resultVC.winner = self.name

        }

        self.present(resultVC, animated: true, completion: nil)
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
