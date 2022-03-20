//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .yellow

        self.title = "Profile"                  // одно и то же?
        self.navigationItem.title = "Profile"   // одно и то же?
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
}
