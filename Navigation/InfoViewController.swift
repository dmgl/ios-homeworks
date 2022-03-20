//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemGray4
        
        let button = setupDeleteButton()
        self.view.addSubview(button)
        placeDeleteButton(button: button)
        
        
    }
    
    
    private func setupDeleteButton() -> UIButton {
        
        let button = UIButton(configuration: .plain(), primaryAction: nil)
        
        button.setTitle("Delete post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(showedAlert), for: .touchUpInside)

        return button
   
    }
    
    
    private func placeDeleteButton(button: UIButton) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        //button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    
    }
    
    
    @objc func showedAlert () {
        
        let alert = AlertViewController()
        self.present(alert, animated: true, completion: hideBackgroundButton)
        
    }
    
    
    let hideBackgroundButton = {
        print("[Don't know how to hide this red delete button on background here! =(]")
    }
    
    
}
