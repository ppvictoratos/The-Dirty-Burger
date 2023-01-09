//
//  GameModel.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/1/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import Foundation

//this is where we deal with all game logic

//we should store the hard coded examples in here

class GameModel {
    
    let initialValue = 0
    var total = 0
    var initialMode = "Addition"
    var mode = "Addition"
    var userAnswer = 0
    var userScore = 0
    var secondNum = 0
    var difficulty = "Easy"
    var tempNum = 0
    
    init() {
    }
    
    func reset(){
        total = initialValue
        mode = initialMode
    }
    
    func addBy() {
        total = total + secondNum
    }
    func subtractBy() {
        total = total - secondNum
    }
    func multiplyBy() {
        total = total * secondNum
    }
    func divideBy() {
        total = total / secondNum
    }
    
    func setValue(number: Int){
        total = number
    }
    
    func setMode(gameOperator: String){
        mode = gameOperator
    }
    func setDifficulty(diff: String){
        difficulty = diff
    }

    func getValue() -> Int {
        return total
    }
    
    func createProblem(){
        if(difficulty == "Easy"){
            if(mode == "Addition"){
                total = Int.random(in: 1 ... 99)
                secondNum = Int.random(in: 1 ... 99)
            }
            if(mode == "Subtraction"){
                total = Int.random(in: 1 ... 99)
                secondNum = Int.random(in: 1 ... 99)
                if(secondNum > total){
                    tempNum = total
                    total = secondNum
                    secondNum = tempNum
                }
            }
            if(mode == "Multiplication"){
                total = Int.random(in: 1 ... 12)
                secondNum = Int.random(in: 1 ... 12)
            }
            if(mode == "Division"){
                total = Int.random(in: 1 ... 12)
                secondNum = Int.random(in: 1 ... 12)
                total = total * secondNum
            }
        }
        if(difficulty == "Medium"){
            if(mode == "Addition"){
                total = Int.random(in: 100 ... 500)
                secondNum = Int.random(in: 100 ... 500)
            }
            if(mode == "Subtraction"){
                total = Int.random(in: 100 ... 500)
                secondNum = Int.random(in: 100 ... 500)
                if(secondNum > total){
                    tempNum = total
                    total = secondNum
                    secondNum = tempNum
                }
            }
            if(mode == "Multiplication"){
                total = Int.random(in: 10 ... 20)
                secondNum = Int.random(in: 1 ... 12)
            }
            if(mode == "Division"){
                total = Int.random(in: 10 ... 20)
                secondNum = Int.random(in: 1 ... 12)
                total = total * secondNum
            }
        }
        if(difficulty == "Hard"){
            if(mode == "Addition"){
                total = Int.random(in: 100 ... 999)
                secondNum = Int.random(in: 100 ... 999)
            }
            if(mode == "Subtraction"){
                total = Int.random(in: 100 ... 999)
                secondNum = Int.random(in: 100 ... 999)
                if(secondNum > total){
                    tempNum = total
                    total = secondNum
                    secondNum = tempNum
                }
            }
            if(mode == "Multiplication"){
                total = Int.random(in: 10 ... 50)
                secondNum = Int.random(in: 10 ... 19)
            }
            if(mode == "Division"){
                total = Int.random(in: 10 ... 50)
                secondNum = Int.random(in: 10 ... 19)
                total = total * secondNum
            }
        }
    }
    
    func setUserAnswer(number: Int){
        userAnswer = number
    }
    func answerCorrect() -> Bool {
        return (userAnswer == total)
    }
    func sendScore() -> Int{
        return userScore
    }
    
    func digitCount(i: Int) -> Int{
        
        var n = 1
        if (i >= 10000) {
            n += 4
            return n
        }
        
        if (i >= 1000) {
            n += 3
            return n
        }
        
        if (i >= 100) {
            n += 2
            return n
        }
        
        if (i >= 10) {
            n += 1
            return n
        }
        return n
    }
    
    func getWordValue(number: Int) -> String {
        
        var digits = digitCount(i: number)
        var num = number
        var word = ""
        var temp = 0
        
        if (digits == 0){
            word = "No Number"
            return word
        }
        
        if (digits > 3){
            word = "Length more than 4"
            return word
        }
        
        let singleDigits: [String] = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven",  "Eight", "Nine"]
        
        let twoDigits: [String] = ["Ten", "Eleven", "Twelve",  "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen",  "Nineteen"]
        
        let tensMultiple: [String] = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty",  "Ninety"]
        
        let tensPower: [String] = ["Hundred"]
        
        while (digits > 0){
            
            if(digits == 3){
                temp = num/100
                word += singleDigits[temp] + " "
                word += tensPower[0] + " "
                num = num%100
            }
            
            if(digits == 2){
                if ((number >= 10) && (number < 20)){
                    temp = num%10
                    word += twoDigits[temp] + " "
                    digits = digits-2
                }
                else{
                    temp = num/10
                    word += tensMultiple[temp] + " "
                    num = num%10
                }
            }
            
            if(digits == 1){
                word += singleDigits[num]
                num = 0
            }
            
            if (num == 0){
                digits = digits - digits
            }
                
            else if (digits != 0){
                digits = digits - 1
            }
        }
        return word
    }
}
