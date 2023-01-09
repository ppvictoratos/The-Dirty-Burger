//
//  GameOverView.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/16/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import Foundation
import UIKit

class GameOverView: UIViewController{
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var congratsLabel: UILabel!
    var background = UIColor(patternImage: UIImage(named: "green")!)
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(finalScore)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.performSegue(withIdentifier: "Return Home", sender: nil)
        }
    }
}
