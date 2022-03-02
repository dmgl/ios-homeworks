//
//  ViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CustomView1: UIView!
    @IBOutlet weak var CustomView2: CustomView!
    
    @IBOutlet weak var CustomLabel: UILabel!
    @IBOutlet weak var CustomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.CustomLabel.text = "My Custom Label"
        self.CustomLabel.backgroundColor = .orange
        
        self.CustomButton.setTitle("My Custom Button", for: .normal)
        self.CustomButton.backgroundColor = .orange
        
        if let CustomView = Bundle.main.loadNibNamed("CustomView",
                                                     owner: nil,
                                                     options: nil)?.first
            as? UIView {
            
            print("CustomView loaded")
            CustomView2.addSubview(CustomView)
         
            
            let left = CustomView.leadingAnchor.constraint(equalTo: CustomView2.leadingAnchor, constant: 100)
            let right = CustomView.trailingAnchor.constraint(equalTo: CustomView2.trailingAnchor, constant: -100)
            let centerX = CustomView.centerXAnchor.constraint(equalTo: CustomView2.centerXAnchor, constant: 0)
            let centerY = CustomView.centerYAnchor.constraint(equalTo: CustomView2.centerYAnchor, constant: 0)
            NSLayoutConstraint.activate([left,right,centerX,centerY])
            
        }
        
        // UIStoryboard(name: "Main", bundle: "CustomStoryboard")
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        
        print(#function)
        
        let AnotherViewController = AnotherViewController()
        self.present(AnotherViewController, animated: true, completion: nil)
        
//        or these two lines above can be replaced by
//        created segue via xcode assistant
        
    }
    
}

