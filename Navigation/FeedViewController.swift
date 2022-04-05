//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        
        self.title = "Feed"                 // одно и то же?
        self.navigationItem.title = "Feed"  // одно и то же?
        
        let button = setupPostButton()
        self.view.addSubview(button)
        placePostButton(button: button)
        
    }
    
    
    private func setupPostButton() -> UIButton {
        
        let button = UIButton(configuration: .plain(), primaryAction: nil)
        
        button.setTitle("See post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(showedPost), for: .touchUpInside)

        return button
        
    }
    
    
    private func placePostButton(button: UIButton) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        //button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    
    @objc func showedPost() {
        
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backButtonTitle = "Back..."
        self.navigationItem.title = "Feed"
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationItem.title = ""
        
    }
    
    
}


struct Post {
    
    var title:String = "Post title"
    
}
