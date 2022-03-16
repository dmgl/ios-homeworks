//
//  SecondViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 17.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    // передача из FirstViewController в SecondViewController
    // передача от первого ко второму
    var customText: String?
    

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
        
        // передача из FirstViewController в SecondViewController
        // передача от первого ко второму
        self.customLabel.text = self.customText
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(#function, "SecondViewController viewWillAppear")
        print("будет отображен SecondViewController")
        
        self.navigationController?.navigationBar.prefersLargeTitles = false // костыль, который все используют (если нужны разного размера заголовки navigation)
        self.navigationItem.title = "Second" // костыль, который все используют (если нужны разного размера заголовки navigation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(#function, "SecondViewController viewDidAppear")
        print("уже отобразился SecondViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print(#function, "SecondViewController viewWillDisappear")
        print("сейчас исчезнет SecondViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print(#function, "SecondViewController viewDidDisappear")
        print("сейчас исчезнет SecondViewController")
    }
    

}

