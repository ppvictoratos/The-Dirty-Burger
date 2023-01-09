//
//  ViewController.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/1/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import UIKit
import CoreGraphics

class MainMenuView: UIViewController {

    @IBOutlet weak var titl: UILabel!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    var background = UIColor(patternImage: UIImage(named: "green")!)
    @IBOutlet weak var difficulty: UISegmentedControl!
    
    var difficultyLevel = "Easy"
    var operatorSelect = ""
    var operatorModeSelect = ""
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch difficulty.selectedSegmentIndex
        {
        case 0:
            difficultyLevel = "Easy"
        case 1:
            difficultyLevel = "Medium"
        case 2:
            difficultyLevel = "Hard"
        default:
            break
        }
    }
    
    @IBAction func divisionMode(_ sender: UIButton) {
        operatorSelect = "Divided by"
        operatorModeSelect = "Division"
    }
    @IBAction func multiplicationMode(_ sender: UIButton) {
        operatorSelect = "Times"
        operatorModeSelect = "Multiplication"

    }
    @IBAction func subtractionMode(_ sender: UIButton) {
        operatorSelect = "Minus"
        operatorModeSelect = "Subtraction"

    }
    @IBAction func additionMode(_ sender: UIButton) {
        operatorSelect = "Plus"
        operatorModeSelect = "Addition"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = background
        
        self.plus.showsTouchWhenHighlighted = true
        self.minus.showsTouchWhenHighlighted = true
        self.division.showsTouchWhenHighlighted = true
        self.multiplication.showsTouchWhenHighlighted = true

    }

 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startCounter"){
            let view: StartCountView = segue.destination as! StartCountView
            view.operatorModeSelect = operatorModeSelect
            view.operatorMode = operatorSelect
            view.difficulty = difficultyLevel
        }
    }
    
    @IBAction func Settings(_ sender: UIButton) {
    }
    
    @IBAction func UserProfile(_ sender: UIButton) {
    }
    
}


