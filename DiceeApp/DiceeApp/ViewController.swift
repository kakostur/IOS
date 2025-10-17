//
//  ViewController.swift
//  DiceeApp
//
//  Created by Karakat Tursynbaeva on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftDiceImage: UIImageView!
    
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiceStyle()
        rollDice(animated: false)
    }
    
    @IBAction func rollButtonAction(_ sender: UIButton) {
        rollDice(animated: true)
    }
    
    func setupDiceStyle() {
            leftDiceImage.layer.cornerRadius = 20
            rightDiceImage.layer.cornerRadius = 20
            
            leftDiceImage.clipsToBounds = true
            rightDiceImage.clipsToBounds = true
            
            leftDiceImage.layer.shadowColor = UIColor.black.cgColor
            leftDiceImage.layer.shadowOpacity = 0.2
            leftDiceImage.layer.shadowRadius = 5
            rightDiceImage.layer.shadowColor = UIColor.black.cgColor
            rightDiceImage.layer.shadowOpacity = 0.2
            rightDiceImage.layer.shadowRadius = 5
    }
    
    func rollDice(animated: Bool) {
            let leftRandomIndex = Int.random(in: 0..<diceImages.count)
            let rightRandomIndex = Int.random(in: 0..<diceImages.count)
            
            if animated {
                //animations
                UIView.animate(withDuration: 0.3, animations: {
                    self.leftDiceImage.transform = CGAffineTransform(rotationAngle: .pi)
                    self.rightDiceImage.transform = CGAffineTransform(rotationAngle: -.pi)
                }) { _ in
                    // changing animation
                    self.leftDiceImage.image = UIImage(named: self.diceImages[leftRandomIndex])
                    self.rightDiceImage.image = UIImage(named: self.diceImages[rightRandomIndex])
                    
                    UIView.animate(withDuration: 0.3) {
                        self.leftDiceImage.transform = .identity
                        self.rightDiceImage.transform = .identity
                    }
                }
            } else {
                leftDiceImage.image = UIImage(named: diceImages[leftRandomIndex])
                rightDiceImage.image = UIImage(named: diceImages[rightRandomIndex])
            }
        }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice(animated: true)
        }
    }


}

