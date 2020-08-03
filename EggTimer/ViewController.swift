//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var textLabel: UILabel!
    //dictionary
    let eggTimes = ["Soft":10,"Medium":6,"Hard":8]
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        eggProgress.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0,target:self, selector: #selector(updateTimer), userInfo:nil, repeats:true )
        
        /*let result = eggTimes[hardness]!
        print(result)*/
        
        //using if statement
        /*if hardness=="Soft"{
            print(softTime)
        }else if hardness=="Medium"{
            print(mediumTime)
        }else{
            print(hardTime)
        }*/
        
        /* using switch statement
        switch hardness{
        case "Soft":
            print(eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"]!)
        default:
            print("Error")
        }*/
    }
    
    @objc func updateTimer(){
        if  secondsPassed < totalTime{
            secondsPassed += 1
            eggProgress.progress = Float(secondsPassed)/Float(totalTime)
            print(Float(secondsPassed)/Float(totalTime))
        }else{
            timer.invalidate()
            textLabel.text = "Done!"
        }
    }
}
