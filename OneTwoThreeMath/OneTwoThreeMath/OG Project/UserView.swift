//
//  UserView.swift
//  OneTwoThreeProj
//
//  Created by Peter Victoratos on 5/1/19.
//  Copyright © 2019 Loveshack Enterprises. All rights reserved.
//

import Foundation
import UIKit

//Create a way to store user name and image, uploadable from your phone
//
//class UserView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    @IBOutlet weak var userImage: UIImageView!
//    @IBOutlet weak var uploadButton: UIButton!
//    @IBOutlet weak var userNameField: UITextField!
//    @IBOutlet weak var userScoreLabel: UILabel!
//    var userHighScore = Int()
//    
//    
//    let defaults = UserDefaults.standard
//    var background = UIColor(patternImage: UIImage(named: "green")!)
//    
//    struct Keys {
//        static let userName = "username"
//        static let userImage = "userImage"
//        static let userScore = "userScore"
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = background
//        //userNameField.delegate = self
//        editImageView()
//        checkForSavedInfo()
//        
//        var highScoreDefault = UserDefaults.standard
//        
//        if (highScoreDefault.value(forKey: "Highscore") != nil){
//            userHighScore = (highScoreDefault.value(forKey: "Highscore") as! Int?)!
//            userScoreLabel.text = String(format: "Highscore: %i", userHighScore)
//        }
//        else{
//            userScoreLabel.text = String(format: "Highscore: %i", 0)
//
//        }
//        
//    }
//    
//    //button that brings up keyboard so user can enter their name
//    
//    //once save preferences is tapped, it is saved (somewhere)
//    
//    @IBAction func uploadButtonTapped(_ sender: Any) {
//        let myPickerController = UIImagePickerController()
//        myPickerController.delegate = self;
//        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
//        
//        self.present(myPickerController, animated: true, completion: nil)
//    }
//    
//    //user defaults for image and int not working. maybe these can be handeled
//    //a different way?
//    
//    func setUserScore(userScore: Int){
//        userHighScore = userScore
//    }
//    
//    func editImageView(){
//        userImage.layer.cornerRadius = userImage.frame.size.height/2
//        userImage.clipsToBounds = true
//    }
//    
//    @IBAction func saveInfo(_ sender: UIButton) {
//        saveUserInfo(userScore: userHighScore)
//    }
//
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
//        
//        //the wrong thing might be passed right now, not sure
//        userImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//        userImage.backgroundColor = UIColor.clear
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    func saveUserInfo(userScore: Int){
//        defaults.set(userNameField.text!, forKey: Keys.userName)
//        
//        let image = userImage.image
//        let imageData:NSData = image!.pngData()! as NSData
//        UserDefaults.standard.set(imageData, forKey: "savedImage")
//        
//        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
//        userImage.image = UIImage(data: data as Data)
//    }
//    
//    func checkForSavedInfo(){
//        let name = defaults.value(forKey: Keys.userName) as? String ?? ""
//        let image = defaults.value(forKey: Keys.userImage) as? UIImage
//        userNameField.text = name
//        userImage.image = image
//    }
//    
//}
//
//
//extension UserView : UITextFieldDelegate {
//    
//    func textFieldShouldReturn(_ userNameField: UITextField) -> Bool {
//        userNameField.resignFirstResponder()
//        return true
//    }
//}
