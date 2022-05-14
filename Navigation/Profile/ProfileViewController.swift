//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 19.03.2022.
//

import UIKit

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
    
    private lazy var profileHeaderView =  ProfileHeaderView()
    
    private var avatarTopConstraint: NSLayoutConstraint?
    private var avatarLeadingConstraint: NSLayoutConstraint?
    private var avatarWidthConstraint: NSLayoutConstraint?
    private var avatarHeightConstraint: NSLayoutConstraint?
    private var additionalTopConstraint: NSLayoutConstraint?
    private var additionalLeadingConstraint: NSLayoutConstraint?
    private var additionalWidthConstraint: NSLayoutConstraint?
    private var additionalHeightConstraint: NSLayoutConstraint?
    private lazy var screenW = UIScreen.main.bounds.width
    private lazy var screenH = UIScreen.main.bounds.height
    private lazy var avatarTopOrCenter = screenW < screenH ? ((self.view.frame.height - self.view.frame.width) / 4) : 0
    private lazy var avatarLeadingOrCenter =  screenW < screenH ? 0 : ((self.view.frame.width - self.view.frame.height) / 2)
    private lazy var avatarWidthOrHeight = (screenW < screenH ? screenW : screenH - (self.tabBarController?.tabBar.frame.size.height)!)
    
    private lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.isUserInteractionEnabled = true                                      // attention
        avatar.layer.borderWidth = 3                                                //
        avatar.layer.cornerRadius = 60                                              //
        avatar.isHidden = true                                                      //
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "Image")
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.isUserInteractionEnabled = true                                 // attention
        closeButton.alpha = 0                                                       //
        closeButton.tintColor = .white                                              //
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    private lazy var additionalView: UIView = {
        let additionalView = UIView()
        additionalView.isUserInteractionEnabled = false                             // attention
        additionalView.alpha = 0                                                    //
        additionalView.backgroundColor = .black                                     //
        additionalView.translatesAutoresizingMaskIntoConstraints = false
        return additionalView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .systemPurple
        self.navigationItem.title = "Profile"
        self.view.addSubview(tableView)
        self.view.addSubview(additionalView)
        self.view.addSubview(closeButton)
        self.view.addSubview(avatar)
        self.setupConstraints()
        self.setupGestures()
    }
    
    
    private func setupConstraints() {
        
        avatarTopConstraint = avatar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarLeadingConstraint = avatar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        avatarWidthConstraint = avatar.widthAnchor.constraint(equalToConstant: profileHeaderView.avatar.frame.width)
        avatarHeightConstraint = avatar.heightAnchor.constraint(equalToConstant: profileHeaderView.avatar.frame.height)
        NSLayoutConstraint.activate([avatarTopConstraint,
                                     avatarLeadingConstraint,
                                     avatarWidthConstraint,
                                     avatarHeightConstraint].compactMap({ $0 }))
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            additionalView.topAnchor.constraint(equalTo: self.view.topAnchor),
            additionalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            additionalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            additionalView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    
    private func setupGestures() {
        let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar))
        self.profileHeaderView.avatar.addGestureRecognizer(tapAvatarGesture)
        let tapCloseButtonGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnCloseButton))
        self.closeButton.addGestureRecognizer(tapCloseButtonGesture)
        //let tapAdditionalViewGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAdditionalView))
        //self.additionalView.addGestureRecognizer(tapAdditionalViewGesture)
    }
    
    
    @objc private func tapOnAvatar(gesture: UITapGestureRecognizer) {
        self.avatar.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.avatarTopConstraint?.constant =  self.avatarTopOrCenter
            self.avatarLeadingConstraint?.constant =  self.avatarLeadingOrCenter
            self.avatarWidthConstraint?.constant = self.avatarWidthOrHeight
            self.avatarHeightConstraint?.constant = self.avatarWidthOrHeight
            self.additionalTopConstraint?.constant = 0
            self.additionalLeadingConstraint?.constant = 0
            self.additionalWidthConstraint?.constant = self.screenW
            self.additionalHeightConstraint?.constant = self.screenH
            self.avatar.layer.cornerRadius = 0                                              //
            self.additionalView.alpha = 0.5                                                 //
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    
    @objc private func tapOnCloseButton(gesture: UITapGestureRecognizer) {
        self.avatarTopConstraint?.constant =  16
        self.avatarLeadingConstraint?.constant = 16
        self.avatarWidthConstraint?.constant =  profileHeaderView.avatar.frame.width
        self.avatarHeightConstraint?.constant =  profileHeaderView.avatar.frame.height
        UIView.animate(withDuration: 0.5) {
            self.avatar.layer.cornerRadius =  self.profileHeaderView.avatar.frame.height / 2    //
            self.additionalView.alpha =  0                                                      //
            self.closeButton.alpha = 0                                                          //
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.avatarTopConstraint?.constant =  -self.screenH
                self.avatarLeadingConstraint?.constant = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 1.0, delay: 0.0) {
                    self.avatarTopConstraint?.constant =  16
                    self.avatarLeadingConstraint?.constant = 16
                    self.avatar.isHidden = true
                }
            }
        }
    }
    
    //    @objc private func tapOnAdditionalView(gesture: UITapGestureRecognizer) {
    //        self.additionalView.alpha =  0
    //        self.closeButton.alpha = 0
    //        self.avatar.isHidden = true
    //    }
    
    
    
}


extension ProfileViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? 1 : posts.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotosTableViewCell
            //let photo = photosProfile[indexPath.row]
            cell.setup()
            cell.backgroundColor = .white
            cell.selectionStyle = .none
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
            cell.backgroundColor = .white
            cell.selectionStyle = .none
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let photoGallery = PhotosViewController()
            self.navigationController?.pushViewController(photoGallery, animated: true)
        }
        
    }
    
}
