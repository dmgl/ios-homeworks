//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class FeedViewController: UIViewController {


    private lazy var button1 = setupPostButton()
    private lazy var button2 = setupPostButton()
    
    private lazy var buttonsStack: UIStackView = {
        
        let view = UIStackView()
        
        view.spacing = 10
        view.axis = .vertical
        view.distribution = .equalCentering
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = .white

        self.navigationItem.title = "Feed"


        buttonsStack.addArrangedSubview(button1)
        buttonsStack.addArrangedSubview(button2)
        
        self.view.addSubview(buttonsStack)
        placeButtonsStack(buttonsStack)

    }


    private func setupPostButton() -> UIButton {

        let button = UIButton(configuration: .plain(), primaryAction: nil)

        button.setTitle("See post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 16
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        button.addTarget(self, action: #selector(showedPost), for: .touchUpInside)

        return button

    }


    private func placeButtonsStack(_ stack: UIStackView) {

        stack.translatesAutoresizingMaskIntoConstraints = false
        
        //stack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        //stack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true

    }
    
    
    @objc func showedPost() {

        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)

    }


    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backButtonTitle = "Back..."
        self.navigationItem.title = "Feed"

    }


    override func viewWillDisappear(_ animated: Bool) {

        self.navigationItem.title = ""

    }


}


struct Post {

    var title:String = "Post title"

}
