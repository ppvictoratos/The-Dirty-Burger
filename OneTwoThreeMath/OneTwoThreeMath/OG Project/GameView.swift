//
//  GameView.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/1/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var TopNum: UILabel!
    @IBOutlet weak var BotNum: UILabel!
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    var timerValue = 120
    var background = UIColor(patternImage: UIImage(named: "green")!)
    
    @IBAction func backButton(_ sender: Any) {
        gameModel.reset()
    }
    
    @IBAction func difficultySegments(_ sender: UISegmentedControl) {

    }
    
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var progressView: UIProgressView?
    
    var gameModel = GameModel()
    var userView = UserView()
    var operatorLabel = ""
    var operatorMode = ""
    var topNumber = 0
    var bottomNumber = 0
    var scoreCount = 0
    var timer = Timer()
    var difficulty = ""
    
    @IBAction func onePress(_ sender: Any) {
        answer.text = answer.text! + "1"
    }
    @IBAction func twoPress(_ sender: Any) {
        answer.text = answer.text! + "2"
    }
    @IBAction func threePress(_ sender: Any) {
        answer.text = answer.text! + "3"
    }
    @IBAction func fourPress(_ sender: Any) {
        answer.text = answer.text! + "4"
    }
    @IBAction func fivePress(_ sender: Any) {
        answer.text = answer.text! + "5"
    }
    @IBAction func sixPress(_ sender: Any) {
        answer.text = answer.text! + "6"
    }
    @IBAction func sevenPress(_ sender: Any) {
        answer.text = answer.text! + "7"
    }
    @IBAction func eightPress(_ sender: Any) {
        answer.text = answer.text! + "8"
    }
    @IBAction func ninePress(_ sender: Any) {
        answer.text = answer.text! + "9"
    }
    @IBAction func clearPress(_ sender: Any) {
        answer.text = ""
    }
    @IBAction func zeroPress(_ sender: Any) {
        answer.text = answer.text! + "0"
    }
    @IBAction func enterPress(_ sender: Any) {
        gameModel.setUserAnswer(number: Int(answer.text!)!)
        
        if (gameModel.mode == "Addition"){
            gameModel.addBy()
        }
        if (gameModel.mode == "Subtraction"){
            gameModel.subtractBy()
        }
        if (gameModel.mode == "Multiplication"){
            print(gameModel.total)
            gameModel.multiplyBy()
            print(gameModel.total)
            print(gameModel.secondNum)
        }
        if (gameModel.mode == "Division"){
            gameModel.divideBy()
        }
        if (gameModel.answerCorrect()){
            answer.text = "Correct!"
            scoreCount += 1
            self.score.text = String(scoreCount)
        }
        else {
            answer.text = "Wrong! Answer is " + String(gameModel.getValue())
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.gameModel.createProblem()
            self.topNumber = self.gameModel.total
            self.bottomNumber = self.gameModel.secondNum
            self.TopNum.text = self.gameModel.getWordValue(number: self.topNumber)
            self.BotNum.text = self.gameModel.getWordValue(number: self.bottomNumber)
            self.answer.text = ""
        }

    }
    //updates timer as timer goes
    
    @objc func update(){
        timerValue -= 1
        let minutes = String(timerValue/60%60)
        var seconds = String(timerValue%60)
        if (Int(seconds)! < 10){
            seconds = "0" + seconds
        }
        TimeLabel.text = minutes + ":" + seconds
        if (timerValue == 0){
            //gameModel.sendScore()
            if scoreCount > UserDefaults().integer(forKey: "Highscore") {
                saveHighScore()
            }
            performSegue(withIdentifier: "End Game", sender: Any?.self)
        }
    }
    func saveHighScore() {
        UserDefaults.standard.set(scoreCount, forKey: "Highscore")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "End Game"){
            let view: GameOverView = segue.destination as! GameOverView
            view.finalScore = scoreCount
            userView.setUserScore(userScore: scoreCount)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = background
        self.gameModel.setMode(gameOperator: operatorMode)
        self.gameModel.setDifficulty(diff: difficulty)
        self.gameModel.createProblem()
        self.topNumber = self.gameModel.total
        self.bottomNumber = self.gameModel.secondNum
        self.TopNum.text = gameModel.getWordValue(number: self.topNumber)
        self.BotNum.text = gameModel.getWordValue(number: self.bottomNumber)
        self.OperatorLabel.text = operatorLabel
        self.score.text = String(scoreCount)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
}
