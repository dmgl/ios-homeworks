//
//  DetailedPostView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 14.05.2022.
//

import UIKit

class DetailedPostView: UIViewController {
    
    var delegateDetailed: DetailedPostDelegate?
    
    var postNumber: Int = -1
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private lazy var detailedPostAuthorLabel: UILabel = {
        let detailedPostAuthorLabel = UILabel()
        detailedPostAuthorLabel.font = .boldSystemFont(ofSize: 20)
        detailedPostAuthorLabel.textColor = .black
        detailedPostAuthorLabel.numberOfLines = 2
        detailedPostAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailedPostAuthorLabel
    }()
    private lazy var detailedPostImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode =  .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    private lazy var detailedPostDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.font = .systemFont(ofSize: 14)
        postDescriptionLabel.textColor = .systemGray
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.textAlignment = NSTextAlignment.justified
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postDescriptionLabel
    }()
    private lazy var detailedPostCountLikesLabel: UILabel = {
        let postCountLikesLabel = UILabel()
        postCountLikesLabel.font = .systemFont(ofSize: 16)
        postCountLikesLabel.textColor = .black
        postCountLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        return postCountLikesLabel
    }()
    private lazy var detailedPostCountViewsLabel: UILabel = {
        let postCountViewsLabel = UILabel()
        postCountViewsLabel.font = .systemFont(ofSize: 16)
        postCountViewsLabel.textColor = .black
        postCountViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return postCountViewsLabel
    }()
    lazy var detailedAlreadyLiked: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Post № " + String(postNumber)
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.detailedPostAuthorLabel)
        self.contentView.addSubview(self.detailedPostAuthorLabel)
        self.contentView.addSubview(self.detailedPostImageView)
        self.contentView.addSubview(self.detailedPostDescriptionLabel)
        self.contentView.addSubview(self.detailedPostCountLikesLabel)
        self.contentView.addSubview(self.detailedPostCountViewsLabel)
        self.setupConstraints()
        self.setupGestures()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            self.scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            self.detailedPostAuthorLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 16),
            self.detailedPostAuthorLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.detailedPostAuthorLabel.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            
            self.detailedPostImageView.topAnchor.constraint(equalTo: self.detailedPostAuthorLabel.bottomAnchor, constant: 12),
            self.detailedPostImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.detailedPostImageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.detailedPostImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.detailedPostImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            self.detailedPostDescriptionLabel.topAnchor.constraint(equalTo: self.detailedPostImageView.bottomAnchor, constant: 16),
            self.detailedPostDescriptionLabel.leadingAnchor.constraint(equalTo: self.detailedPostAuthorLabel.leadingAnchor),
            self.detailedPostDescriptionLabel.trailingAnchor.constraint(equalTo: self.detailedPostAuthorLabel.trailingAnchor),
            
            self.detailedPostCountLikesLabel.topAnchor.constraint(equalTo: self.detailedPostDescriptionLabel.bottomAnchor, constant: 16),
            self.detailedPostCountLikesLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.detailedPostCountLikesLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            
            self.detailedPostCountViewsLabel.topAnchor.constraint(equalTo: self.detailedPostDescriptionLabel.bottomAnchor, constant: 16),
            self.detailedPostCountViewsLabel.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            self.detailedPostCountViewsLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            
        ])
    }
    
    
    private func setupGestures() {
        let tabCountLikesLabelGesture = UITapGestureRecognizer(target: self, action: #selector(increaseLikess))
        self.detailedPostCountLikesLabel.addGestureRecognizer(tabCountLikesLabelGesture)
        self.detailedPostCountLikesLabel.isUserInteractionEnabled = true
    }
    
    
    @objc private func increaseLikess(gesture: UITapGestureRecognizer) {
        
        if !detailedAlreadyLiked {
            
            delegateDetailed?.increaseLikes(index: postNumber)
            
            guard let currentLikes = self.detailedPostCountLikesLabel.text else { return }
            var currentLikesInt = Int(currentLikes.split(separator: " ")[1])!
            currentLikesInt += 1
            
            self.detailedPostCountLikesLabel.text = "Likes: " + String(currentLikesInt)
            posts[postNumber].liked = true
            self.detailedAlreadyLiked = true
        
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func setup(author: String, image: String, description: String, likes: Int, views: Int, liked: Bool) {
        detailedPostAuthorLabel.text = author
        detailedPostImageView.image = UIImage(named: image)
        detailedPostDescriptionLabel.text = description
        detailedPostCountLikesLabel.text = "Likes: " + String(likes)
        detailedPostCountViewsLabel.text = "Views: " + String(views)
        detailedAlreadyLiked = liked
    }
    
    
}
