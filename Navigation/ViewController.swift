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

        self.CustomLabel.text = "MyCustomLabel"
        self.CustomButton.setTitle("MyCustomButton", for: .normal)
        
        if let CustomView = Bundle.main.loadNibNamed("CustomView",
                                                     owner: nil,
                                                     options: nil)?.first as? UIView {
            print("CustomView loaded")
            print("CustomView loaded")
            print("CustomView loaded")

            CustomView2.addSubview(CustomView)

        }
        
        
        // UIStoryboard(name: "Main", bundle: "MyStoryBoard")
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        print(#function)
    }
    
    
    
}

