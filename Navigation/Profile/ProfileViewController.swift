//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit


struct PostModel {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}


let postA = PostModel(author: "Author1", description: "Description 1", image: "image_literal_a", likes: 1000, views: 4000)
let postB = PostModel(author: "Author2", description: "Description 2", image: "image_literal_b", likes: 2000, views: 3000)
let postC = PostModel(author: "Author3", description: "Description 3", image: "image_literal_c", likes: 3000, views: 2000)
let postD = PostModel(author: "Author4", description: "Description 4", image: "image_literal_d", likes: 4000, views: 1000)
var posts: [PostModel] = [postA, postB, postC, postD]


class ProfileViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private lazy var profileHeaderView: UIView = ProfileHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .yellow
        
        self.navigationItem.title = "Profile"
                
        setupViews()
        
        self.view.addSubview(tableView)
        // tableView.tableHeaderView = profileHeaderView                                      //which does not scroll, but hangs
        
        setupConstraints()
        
//        tableView.setNeedsLayout()
//        tableView.layoutIfNeeded()
        
        
    }
    
    
    private func setupViews() {
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableHeaderView.translatesAutoresizingMaskIntoConstraints = false                   //which does not scroll, but hangs
        
        tableView.backgroundColor = .systemGray5
        
        //tableView.separatorInset = .zero
        tableView.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
    }
    
    private func setupConstraints() {
    
        NSLayoutConstraint.activate(
            
            [
                
//            self.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            self.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            self.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            ]
        )
        
    }
}
  

extension ProfileViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
//            return cell
//        }
        
        let post = posts[indexPath.row]
        
        cell.setup(author: post.author,
                   image: post.image,
                   description: post.description,
                   likes: post.likes,
                   views: post.views)
        
        cell.clipsToBounds = true
        
        return cell
        
    }
    
    
}
    

extension ProfileViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //return profileHeaderView // 182
        
        let headerInSection = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        
        headerInSection.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate(
            [
                self.profileHeaderView.topAnchor.constraint(equalTo: headerInSection.topAnchor),
                self.profileHeaderView.leadingAnchor.constraint(equalTo: headerInSection.leadingAnchor),
                self.profileHeaderView.trailingAnchor.constraint(equalTo: headerInSection.trailingAnchor),
                self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ]
        )
       
        return headerInSection
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 220
    
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        return false
    
    }
    
    
}

