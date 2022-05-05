//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 03.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    private lazy var postAuthorLabel: UILabel = UILabel()
    private lazy var postImageView: UIImageView = UIImageView()
    private lazy var postDescriptionLabel: UILabel = UILabel()
    private lazy var postCountLikesLabel: UILabel = UILabel()
    private lazy var postCountViewsLabel: UILabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
        
        self.contentView.addSubview(postAuthorLabel)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(postDescriptionLabel)
        self.contentView.addSubview(postCountLikesLabel)
        self.contentView.addSubview(postCountViewsLabel)
        
        self.setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        
        //contentView.translatesAutoresizingMaskIntoConstraints = false
        postAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        postCountLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        postCountViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        postAuthorLabel.font = .boldSystemFont(ofSize: 20)
        postAuthorLabel.textColor = .black
        postAuthorLabel.numberOfLines = 2
        
        postImageView.contentMode =  .scaleAspectFit
        postImageView.backgroundColor = .black
        
        postDescriptionLabel.font = .systemFont(ofSize: 14)
        postAuthorLabel.textColor = .systemGray
        postAuthorLabel.numberOfLines = 0
        
        postCountLikesLabel.font = .systemFont(ofSize: 16)
        postCountLikesLabel.textColor = .black
        
        postCountViewsLabel.font = .systemFont(ofSize: 16)
        postCountViewsLabel.textColor = .black
        
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            
            [
                
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
                
            ]
        )
        
    }
    
    
    func setup(author: String, image: String, description: String, likes: Int, views: Int) {
        
        postAuthorLabel.text = author
        postImageView.image = UIImage(named: image)
        postDescriptionLabel.text = description
        postCountLikesLabel.text = "Likes: " + String(likes)
        postCountViewsLabel.text = "Views: " + String(views)
    
    }
    
    
}
