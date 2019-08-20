//
//  AmbilSampahVC.swift
//  MiniChallenge3
//
//  Created by Nanda Mochammad on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class AmbilSampahVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension AmbilSampahVC{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBar(withTitle: "Ambil Sampah", destination: self)
    }
}
