//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 03.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // variant 1
    var increaseLikesClosure: (()->())?
    var increaseViewsClosure: (()->())?
    
    // variant 2
    var delegate: PostDelegate?
    
    lazy var postAuthorLabel: UILabel = {
        let postAuthorLabel = UILabel()
        postAuthorLabel.font = .boldSystemFont(ofSize: 20)
        postAuthorLabel.textColor = .black
        postAuthorLabel.numberOfLines = 2
        postAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        return postAuthorLabel
    }()
    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode =  .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    lazy var postDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.font = .systemFont(ofSize: 14)
        postDescriptionLabel.textColor = .systemGray
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.textAlignment = NSTextAlignment.justified
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postDescriptionLabel
    }()
    lazy var postCountLikesLabel: UILabel = {
        let postCountLikesLabel = UILabel()
        postCountLikesLabel.font = .systemFont(ofSize: 16)
        postCountLikesLabel.textColor = .black
        postCountLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        return postCountLikesLabel
    }()
    lazy var postCountViewsLabel: UILabel = {
        let postCountViewsLabel = UILabel()
        postCountViewsLabel.font = .systemFont(ofSize: 16)
        postCountViewsLabel.textColor = .black
        postCountViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return postCountViewsLabel
    }()
    lazy var alreadyLiked: Bool = false
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(postAuthorLabel)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(postDescriptionLabel)
        self.contentView.addSubview(postCountLikesLabel)
        self.contentView.addSubview(postCountViewsLabel)
        self.setupConstraints()
        self.setupGestures()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            postAuthorLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            postAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: postAuthorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postAuthorLabel.leadingAnchor),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postAuthorLabel.trailingAnchor),
            
            postCountLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postCountLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postCountLikesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postCountViewsLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postCountViewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postCountViewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    
    private func setupGestures() {
        let tabCountLikesLabelGesture = UITapGestureRecognizer(target: self, action: #selector(increaseLikes))
        self.postCountLikesLabel.addGestureRecognizer(tabCountLikesLabelGesture)
        self.postCountLikesLabel.isUserInteractionEnabled = true
        let tapCountViewsLabelGesture = UITapGestureRecognizer(target: self, action: #selector(increaseViews))
        self.postImageView.addGestureRecognizer(tapCountViewsLabelGesture)
        self.postImageView.isUserInteractionEnabled = true
    }
    
    
    @objc private func increaseLikes(gesture: UITapGestureRecognizer) {
        
        if !alreadyLiked {
            self.increaseLikesClosure?() //variant 1
            //delegate?.increaseLikes(cell: self) // variant 2
        }
    }
        
        
    @objc private func increaseViews(gesture: UITapGestureRecognizer) {
        self.increaseViewsClosure?() //variant 1
        //delegate?.increaseViews(cell: self) // variant 2
    }
    
    
    
    
    func setup(author: String, image: String, description: String, likes: Int, views: Int, liked: Bool) {
        postAuthorLabel.text = author
        postImageView.image = UIImage(named: image)
        postDescriptionLabel.text = description
        postCountLikesLabel.text = "Likes: " + String(likes)
        postCountViewsLabel.text = "Views: " + String(views)
        alreadyLiked = liked
    }
    
    
}
