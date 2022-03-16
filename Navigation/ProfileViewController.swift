//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let profileViewFromXib = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first
            as? UIView {

            self.view.addSubview(profileViewFromXib)

            profileViewFromXib.frame = self.view.bounds
            profileViewFromXib.autoresizingMask = [.flexibleWidth,
                                                    .flexibleHeight]
    
        }
        
    }
}
