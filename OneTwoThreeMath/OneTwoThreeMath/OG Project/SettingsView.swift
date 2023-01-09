//
//  SettingsView.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/1/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: UIViewController {
    let gameView = GameView()
    let mainView = MainMenuView()
    let userView = UserView()
    let countDownView = StartCountView()
    let gameOverView = GameOverView()
    var background = UIColor(patternImage: UIImage(named: "green")!)
    
    //TO DO
    //make the colors stay, it must init them as that color
    
    @IBAction func Green(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green")!)
        gameView.background = UIColor(patternImage: UIImage(named: "green")!)
        mainView.background = UIColor(patternImage: UIImage(named: "green")!)
        userView.background = UIColor(patternImage: UIImage(named: "green")!)
        countDownView.background = UIColor(patternImage: UIImage(named: "green")!)
        gameOverView.background = UIColor(patternImage: UIImage(named: "green")!)

    }
    
    @IBAction func Blue(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blue")!)
        gameView.background = UIColor(patternImage: UIImage(named: "blue")!)
        mainView.background = UIColor(patternImage: UIImage(named: "blue")!)
        userView.background = UIColor(patternImage: UIImage(named: "blue")!)
        countDownView.background = UIColor(patternImage: UIImage(named: "blue")!)
        gameOverView.background = UIColor(patternImage: UIImage(named: "blue")!)

    }
    
    @IBAction func Orange(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "orange")!)
        gameView.background = UIColor(patternImage: UIImage(named: "orange")!)
        mainView.background = UIColor(patternImage: UIImage(named: "orange")!)
        userView.background = UIColor(patternImage: UIImage(named: "orange")!)
        countDownView.background = UIColor(patternImage: UIImage(named: "orange")!)
        gameOverView.background = UIColor(patternImage: UIImage(named: "orange")!)
    }
    
    
    @IBAction func Black(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "black")!)
        gameView.background = UIColor(patternImage: UIImage(named: "black")!)
        mainView.background = UIColor(patternImage: UIImage(named: "black")!)
        userView.background = UIColor(patternImage: UIImage(named: "black")!)
        countDownView.background = UIColor(patternImage: UIImage(named: "black")!)
        gameOverView.background = UIColor(patternImage: UIImage(named: "black")!)
    }
    
    
    //make into unwind segue
    @IBAction func Home(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = background

        // Do any additional setup after loading the view.
    }
    
    
}
