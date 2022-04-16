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

        self.navigationItem.title = "Profile"
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
                
        self.view.addSubview(self.profileHeaderView)
        setupView()
        
    }
    
    
    private func setupView() {
    
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomConstraint = self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
    
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
        
    }
        
    override func viewWillLayoutSubviews() {
        
        profileHeaderView.frame = super.view.frame

    }
    
}
