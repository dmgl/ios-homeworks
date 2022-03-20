//
//  TabBarController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    private enum TabBarItem {
        
        case feed
        case profile
        
        var title: String {
            switch self {
            case .feed:
                return "Feed"
            case .profile:
                return "Profile"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .feed:
                return UIImage(systemName: "house.circle")
            case .profile:
                return UIImage(systemName: "person.circle")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTabBarByMe()
        //setupTabBarByTutor()
        
        
    }
    
    
    private func setupTabBarByMe() {
        
        let FeedViewController = FeedViewController()
        let ProfileViewController = ProfileViewController()
        
        FeedViewController.tabBarItem = UITabBarItem(title: TabBarItem.feed.title, image: TabBarItem.feed.image, selectedImage: TabBarItem.feed.image)
        ProfileViewController.tabBarItem = UITabBarItem(title: TabBarItem.profile.title, image: TabBarItem.profile.image, selectedImage: TabBarItem.profile.image)
        
        let feed = UINavigationController(rootViewController: FeedViewController)
        let profile = UINavigationController(rootViewController: ProfileViewController)
        
        self.viewControllers = [feed,profile]                   // не смог уловить разницу
        self.setViewControllers([feed,profile], animated: true) // не смог уловить разницу
        
        //        self.viewControllers = [UINavigationController(rootViewController:FeedViewController),
        //                                UINavigationController(rootViewController: ProfileViewController)]
        //        self.setViewControllers([UINavigationController(rootViewController:FeedViewController),
        //                                 UINavigationController(rootViewController: ProfileViewController)],
        //                                animated: true)
        
        
        self.viewControllers?.forEach( {
            print($0.tabBarItem.title ?? "No title", $0.tabBarItem.tag)
        } )
        
    }
    
    
    //    private func setupTabBarByTutor() {
    //
    //        let items: [TabBarItem] = [.feed, .profile]
    //
    //        self.viewControllers = items.map( { tabBarItem in
    //            switch tabBarItem {
    //            case .feed:
    //                return UINavigationController(rootViewController: FeedViewController())
    //            case .profile:
    //                return UINavigationController(rootViewController: ProfileViewController())
    //            }
    //        } )
    //
    //        self.viewControllers?.enumerated().forEach({ (index, vc) in
    //            vc.tabBarItem.title = items[index].title
    //            vc.tabBarItem.image = items[index].image
    //        })
    //
    //    }
    
    
}
