//
//  ViewController.swift
//  GuessTheFlagProject
//
//  Created by Damian Mickiewicz on 20/02/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var quantityTapped = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "  Score: " + String(score)
    }

    func scorePlus(title: String = "Correct", quantityEnd: Int) {
        score += 1
        quantityTapped += 1
        if quantityTapped <= quantityEnd - 1 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else if quantityTapped >= quantityEnd {
            endGame()
        }
    }
    
    func scoreMinus(title: String = "Wrong", index: Int, quantityEnd: Int) {
        score -= 1
        quantityTapped += 1
        if quantityTapped <= quantityEnd - 1 {
            let ac = UIAlertController(title: title, message: "You chose: \(countries[index].uppercased()) " + "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else if quantityTapped >= quantityEnd {
            endGame()
        }
    }
    
    func endGame(title: String = "End Game") {
        let qt = UIAlertController(title: title, message: "Your score: \(score)", preferredStyle: .alert)
        qt.addAction(UIAlertAction(title: "Repeat", style: .default, handler: askQuestion))
        present(qt, animated: true)
        score = 0
        quantityTapped = 0
    }
    
    func isCorrectAnswer(buttonId: Int) -> Bool {
        return buttonId == correctAnswer
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if isCorrectAnswer(buttonId: sender.tag) {
            scorePlus(quantityEnd: 5)
        } else {
            scoreMinus(index: sender.tag, quantityEnd: 5)
        }
    }
}
