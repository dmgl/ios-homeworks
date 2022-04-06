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
        
        alert.completionHideButton = {
            let button = self.view.subviews[0]
            button.isHidden = true
        }
        alert.completionShowButton = {
            let button = self.view.subviews[0]
            button.isHidden = false
        }
        
        self.present(alert, animated: true, completion: completionAfterPresent)
        
        // self.present(alert, animated: false, completion: alert.completionHideButton)
        // можно красную кнопку на фоне и так убрать, но тогда без анимации, а то
        // она не сразу исчезнет и будет так себе эффект см. viewWillAppear
        // у AlertViewController

    }
    
    
    let completionAfterPresent = {
        print("[This is completion after present]")
    }
    
    
}
