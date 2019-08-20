//
//  LogInViewController.swift
//  MiniChallenge3
//
//  Created by Dea Khaerunnisa on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    var emailDictionary : [String:String] = [
        "email":"dea.k@gmail.com",
        "pass":"12345"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logInBtn(_ sender: UIButton) {
        if emailTF.text != "" && passTF.text != ""{
            let statusLogin = checkLogin(emailUser: emailTF.text!, passUser: passTF.text!)
            if statusLogin != false{
                print("User Already Login")
                
                //if Segue to wherever
            }else{
                print("User Failed to Login")
            }
        }
    }
    
    func checkLogin(emailUser: String, passUser: String) -> Bool{
        if emailDictionary["email"] == emailUser && emailDictionary["pass"] == passUser{
            
            return true
        }else{
            
            print("The data is unavailable, Check again!")
            
            return false
        }
    }
}
