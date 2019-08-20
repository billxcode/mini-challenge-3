//
//  RegisterViewController.swift
//  MiniChallenge3
//
//  Created by Dea Khaerunnisa on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var namaLengkapTF: UITextField!
    @IBOutlet var noHPTF: UITextField!
    @IBOutlet var alamatTF: UITextField!
    @IBOutlet var kecamatanTF: UITextField!
    @IBOutlet var kotaTF: UITextField!
    @IBOutlet var provinsiTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var databaseDataUser = [DataUserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func daftarBtn(_ sender: UIButton) {
        if checkData() == true {
            registerUser()
        }
    }
    @IBAction func currentLocationBtn(_ sender: UIButton) {
    }
    
    func checkData() -> Bool {
        if namaLengkapTF.text != "" && noHPTF.text != "" && alamatTF.text != "" && kecamatanTF.text != "" && kotaTF.text != "" && provinsiTF.text != "" && usernameTF.text != "" && passwordTF.text != "" {
            
            return true
        } else {
            print ("please in fill the field")
            return false
        }
    }
    
    func registerUser() -> Bool {
        var statusRegister = false
        
        var dataUserModel = DataUserModel()
        dataUserModel.namaLengkap = namaLengkapTF.text
        dataUserModel.noHP = noHPTF.text
        dataUserModel.alamat = alamatTF.text
        dataUserModel.kecamatan = kecamatanTF.text
        dataUserModel.kota = kotaTF.text
        dataUserModel.provinsi = provinsiTF.text
        dataUserModel.username = usernameTF.text
        dataUserModel.password = passwordTF.text
        
//        for _ in databaseDataUser
        databaseDataUser.append(dataUserModel)
        //insert code for add to database
        
        return true
        
//        print("RegisterVC: registerUser -> check data user",dataUserModel)
    }
}
