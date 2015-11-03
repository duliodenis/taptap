//
//  ViewController.swift
//  taptap
//
//  Created by Dulio Denis on 11/1/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    // MARK: Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    
    // MARK: Action Methods
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps++
        updateTapsLabel()
        if isGaveOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayButtonTapped(sender: UIButton!) {
        if howManyTapsText.text != nil && howManyTapsText.text != "" {
            formatLabels(firstLaunch: true)
            
            maxTaps = Int(howManyTapsText.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }

    
    // MARK: Helper Functions
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    
    func isGaveOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        
        formatLabels(firstLaunch: false)
    }
    
    // Swift 2.0 has removed the '#' - doubled up first parameter
    func formatLabels(firstLaunch firstLaunch: Bool) {
        if firstLaunch {
            logoImage.hidden = true
            playButton.hidden = true
            howManyTapsText.hidden = true
            
            tapButton.hidden = false
            tapsLabel.hidden = false

        } else {
            logoImage.hidden = false
            playButton.hidden = false
            howManyTapsText.hidden = false
            
            tapButton.hidden = true
            tapsLabel.hidden = true
        }
    }
    
}

