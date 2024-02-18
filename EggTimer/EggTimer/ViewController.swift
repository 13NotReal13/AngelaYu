//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var doneLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    private let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]

    private var timer = Timer()
    private var totalTime = 0
    private var secondsPassed = 0
    
    private var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0
        doneLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.setProgress(Float(secondsPassed) / Float(totalTime), animated: true)
        } else {
            timer.invalidate()
            doneLabel.text = "DONE!"
            plausound()
        }
        
    }
    
    func plausound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }

}
