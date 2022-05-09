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

var photos: [Int] = [1,2,3,4]


class ProfileViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemGray5
        tableView.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)                                                           // or = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self                                                                                                        // attention
        tableView.delegate = self                                                                                                          // attention
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var profileHeaderView: UIView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .yellow
        self.navigationItem.title = "Profile"
        //self.setupViews()                                                                                                                // new-style code structure, so function not needed
        self.view.addSubview(tableView)
        self.setupConstraints()
    }
    
    
    //private func setupViews() {                                                                                                          // new-style code structure, so function not needed
    //}                                                                                                                                    // new-style code structure, so function not needed
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
    }
}
  

extension ProfileViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? 1 : posts.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotosTableViewCell
            let photo = photos[indexPath.row]
            cell.setup(number: photo)
            cell.clipsToBounds = true
            return cell
        
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
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
    
    
}
    

extension ProfileViewController: UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerInSection = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        headerInSection.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: headerInSection.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: headerInSection.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: headerInSection.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ])
        return headerInSection
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0 ? 220 : 0)
    }
    
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return (indexPath.section == 1 ? false : true)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let photoGallery = PhotosViewController()
            self.navigationController?.pushViewController(photoGallery, animated: true)
        }
    
    }

}
