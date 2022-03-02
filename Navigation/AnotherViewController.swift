//
//  AnotherViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 16.02.2022.
//

import UIKit

class AnotherViewController: UIViewController {

    private lazy var anotherCustomLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red text"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
//        view background color is also defined via xcode assistant,
//        but defined in the code has priority
        
        self.view.addSubview(anotherCustomLabel)
        
        let left = self.anotherCustomLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        let right = self.anotherCustomLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        let centerX = self.anotherCustomLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        let centerY = self.anotherCustomLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        
        NSLayoutConstraint.activate([left,right,centerX,centerY])
        
    }

}
