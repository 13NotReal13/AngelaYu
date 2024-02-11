//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceOneImageView: UIImageView!
    @IBOutlet var diceTwoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        diceOneImageView.image = UIImage(imageLiteralResourceName: diceImages[Int.random(in: 0...5)])
        
        diceTwoImageView.image = UIImage(imageLiteralResourceName: diceImages[Int.random(in: 0...5)])
    }
    
}

