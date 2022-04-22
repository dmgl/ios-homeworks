//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    let profileHeaderView = ProfileHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemGray4

        self.title = "Profile"                  // одно и то же?
        self.navigationItem.title = "Profile"   // одно и то же?
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(profileHeaderView)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        
        //profileHeaderView.frame = view.frame
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        
    }
    
}
