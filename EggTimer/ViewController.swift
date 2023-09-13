//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    let eggTimes = ["Soft":3 ,"Medium":4,"Hard":7]
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0
        secondPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter(){
        if secondPassed < totalTime {
            secondPassed += 1
            let  percentageProgess = Float(secondPassed)/Float(totalTime)
             progressBar.progress = percentageProgess
          
                }
        else{
            timer.invalidate();
            titleLabel.text = "Done!"
            
        }
            }
    

}
