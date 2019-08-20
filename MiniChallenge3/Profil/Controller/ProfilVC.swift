//
//  ProfilVC.swift
//  MiniChallenge3
//
//  Created by Nanda Mochammad on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ProfilVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ProfilVC{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBar(withTitle: "Profil", destination: self)
    }
}

