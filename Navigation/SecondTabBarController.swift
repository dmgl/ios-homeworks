//
//  SecondTabBarController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 17.03.2022.
//

import UIKit

class SecondTabBarController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Second"
        //self.tabBarItem.title = "2"

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
