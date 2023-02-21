#  Challenge!

1. Try showing the player's score in the navigation bar, alongside the flag to guess.
        title = countries[correctAnswer].uppercased() + "  Score: " + String(score)
        
2. Keep track of how many questions have been asked, and show one final alert after they have answered 10.
    Adding additional functions. scoreMinus, scorePlus, endGame
    
3. When someone chooses the wrong flag, tell them their mistake in your alert message.
    let ac = UIAlertController(title: title, message: "You chose: \(countries[sender.tag].uppercased()) " + "Your score is \(score)", preferredStyle: .alert)
