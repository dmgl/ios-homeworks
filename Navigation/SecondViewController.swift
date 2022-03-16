//
//  SecondViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 17.03.2022.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var customLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.prefersLargeTitles = false // переменная относится ко всем экранам с navigationBar (если где-то переопределить, то везде изменится)
        self.navigationItem.title = "Second"
        
        self.customLabel.text = "Everything is ok!"
        
        self.customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        customLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true

        //customLabel.frame.size.width = 100
        

    }


}

