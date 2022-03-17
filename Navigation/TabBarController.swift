//
//  TabBarController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 17.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private enum Index: Int {
        case none = 0
        case first
        case second
    
        var title: String? {
            switch self {
            case .none:
                return nil
            case .first:
                return "First"
            case .second:
                return "Second"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.viewControllers?.enumerated().forEach( { (index, viewController) in
            switch index {
            case 0:
                viewController.tabBarItem.title = Index.first.title
            case 1:
                viewController.tabBarItem.title = Index.second.title
            default:
                viewController.tabBarItem.title = Index.none.title
            }
        })
    
    }


}
