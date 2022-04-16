//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

class PostViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.backgroundColor = .systemGray6

        var myPost = Post()
        myPost.title = "My post"

        self.navigationItem.title = myPost.title

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(showedPostInfo)
        )


    }


    @objc func showedPostInfo() {

        let infoViewController = InfoViewController()
        self.navigationController?.present(infoViewController, animated: true)

    }


    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.prefersLargeTitles = false

    }


}
