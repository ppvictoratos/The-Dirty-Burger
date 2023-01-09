//
//  StartCountView.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/16/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import UIKit

class StartCountView: UIViewController {

    @IBOutlet weak var countDown: UILabel!
    var operatorModeSelect: String = ""
    var operatorMode: String = ""
    var difficulty: String = ""
    var background = UIColor(patternImage: UIImage(named: "green")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = background
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.countDown.text = "Set"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.countDown.text = "Go!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    self.performSegue(withIdentifier: "Start Game", sender: nil)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Start Game"){
            let view: GameView = segue.destination as! GameView
            view.operatorMode = operatorModeSelect
            view.operatorLabel = operatorMode
            view.difficulty = difficulty
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
