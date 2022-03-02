//
//  CustomView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 14.02.2022.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var CustomSwitch: UISwitch!
    @IBAction func didSwitch(_ sender: Any) {
        if let switcher = sender as?
            UISwitch {
            print(switcher.isOn)
        }
    }
    
}

