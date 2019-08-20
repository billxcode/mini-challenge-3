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
    }
    
    @IBAction func daftarBtn(_ sender: UIButton) {
        if checkData() == true {
            if registerUser() == true{
                print("RegisterVC: daftarBtn -> Sukses Add Data")
            }else{
                print("RegisterVC: daftarBtn -> Gagal Add Data")
            }
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
        var isAvailable = false
        
        var dataUserModel = DataUserModel()
        dataUserModel.namaLengkap = namaLengkapTF.text
        dataUserModel.noHP = noHPTF.text
        dataUserModel.alamat = alamatTF.text
        dataUserModel.kecamatan = kecamatanTF.text
        dataUserModel.kota = kotaTF.text
        dataUserModel.provinsi = provinsiTF.text
        dataUserModel.username = usernameTF.text
        dataUserModel.password = passwordTF.text
        
        //perlu check apakah data yg di upload sudah ada di database
        for data in databaseDataUser {
            if data.noHP == dataUserModel.noHP{
                isAvailable = true
            }
        }
        
        //code untuk update DB
        if isAvailable == true{
            print("Nomor HP sudah terdaftar")
            return false
        }else{
            databaseDataUser.append(dataUserModel)
            return true
        }
    }
}
