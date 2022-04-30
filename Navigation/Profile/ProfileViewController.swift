//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private lazy var profileHeaderView: ProfileHeaderView = {

        let view = ProfileHeaderView()
        view.frame = view.safeAreaLayoutGuide.layoutFrame
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()
    
    
    private lazy var newButton: UIButton = {
        
        let button = UIButton(configuration: .plain(), primaryAction: nil)
        button.setTitle("New title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 16
        
        button.addTarget(self, action: #selector(toggleTitleButtonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemGray4

        self.navigationItem.title = "Profile"
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true
                
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
        
        setupConstraints()

    }
    
    
    func setupConstraints() {
    
        let topConstraintProfileHeaderView = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let heightConstraintProfileHeaderView = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        let leadingConstraintProfileHeaderView = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraintProfileHeaderView = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
    
        let heightConstraintNewButton = newButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraintNewButton = newButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingConstraintNewButton = newButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let bottomConstraintNewButton = newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            topConstraintProfileHeaderView, heightConstraintProfileHeaderView, leadingConstraintProfileHeaderView, trailingConstraintProfileHeaderView,
            heightConstraintNewButton, leadingConstraintNewButton, trailingConstraintNewButton, bottomConstraintNewButton
        ])
        
        
        
    }
    
    
    @objc private func toggleTitleButtonTapped() {
                
        let stateTitle = self.navigationItem.title == "Profile" ? "New title" : "Profile"
        let stateButton = self.newButton.title(for: .normal) == "New title" ? "Restore title" : "New title"

        self.navigationItem.title = stateTitle
        self.newButton.setTitle(stateButton, for: .normal)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.isHidden = false

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {

        self.navigationController?.navigationBar.isHidden = true

    }
    
    
}
