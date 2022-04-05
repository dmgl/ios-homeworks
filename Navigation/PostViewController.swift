//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .systemGray6

        var myPost = Post()
        myPost.title = "My post"
        
        self.title = myPost.title                   // одно и то же?
        self.navigationItem.title = myPost.title    // одно и то же?
        
        let infoButton = setupInfoButton()
        self.navigationItem.rightBarButtonItem = infoButton
        
    }
    
    
    private func setupInfoButton() -> UIBarButtonItem {
        
        let customButtonView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        
        let button = UIButton.init(configuration: .plain(), primaryAction: nil)
        
        button.autoresizesSubviews = true
        button.frame = customButtonView.frame
        button.autoresizingMask = [.flexibleWidth , .flexibleHeight]

        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        button.setTitle("Info", for: .normal)
        
        button.configuration?.imagePadding = 10
        
        button.backgroundColor = .blue
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .white
                
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(showedPostInfo), for: .touchUpInside)

        customButtonView.addSubview(button)

        let infoButton = UIBarButtonItem.init(customView: customButtonView)
        
        return infoButton
        
    }
    
    
    @objc func showedPostInfo() {
        
        let infoViewController = InfoViewController()
        self.navigationController?.present(infoViewController, animated: true)
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    
}
