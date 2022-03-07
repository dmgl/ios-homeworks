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

        //self.view.backgroundColor = .purple

        //self.view.autoresizesSubviews = true

        if let profileViewFromXib = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first
            as? UIView {

            self.view.addSubview(profileViewFromXib)
            
            //profileViewFromXib.backgroundColor = .yellow
            //profileViewFromXib.profileName = "How to change this???"
            
            profileViewFromXib.frame = self.view.bounds

            //self.view.frame = self.view.frame.inset(by: UIEdgeInsets(top: -5, left: -50,
            //                                                         bottom: -1, right: -1)) // no matter because flexibleWidth, flexibleHeight

            profileViewFromXib.autoresizingMask = [.flexibleWidth,
                                                    .flexibleHeight]
//            profileViewFromXib.autoresizingMask = [.flexibleWidth,
//                                                    .flexibleHeight,
//                                                    .flexibleLeftMargin,
//                                                    .flexibleRightMargin,
//                                                    .flexibleTopMargin,
//                                                    .flexibleBottomMargin]
             
            
            }
        
        
    }
}
