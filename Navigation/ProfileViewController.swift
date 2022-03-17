//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var CorrectProfileViewXib: ProfileViewXib!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CorrectProfileViewXib.setupView()
    
        CorrectProfileViewXib.prfName.textAlignment = .right
        CorrectProfileViewXib.prfBirthday.textAlignment = .right
        CorrectProfileViewXib.prfCity.textAlignment = .right
        CorrectProfileViewXib.prfText.textAlignment = .justified
        
    }
}
