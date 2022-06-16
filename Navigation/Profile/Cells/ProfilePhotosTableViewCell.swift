//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 07.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var photosButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.addTarget(self, action: #selector(viewPhotoGallery), for: .touchUpInside)                     // action
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var photosStack: UIStackView = {
        let stack = UIStackView()
        stack.clipsToBounds = true
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private lazy var photo1: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.borderWidth = 1
        photo.layer.cornerRadius = 6
        photo.layer.borderColor = UIColor.black.cgColor
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    private lazy var photo2: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.borderWidth = 1
        photo.layer.cornerRadius = 6
        photo.layer.borderColor = UIColor.black.cgColor
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    private lazy var photo3: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.borderWidth = 1
        photo.layer.cornerRadius = 6
        photo.layer.borderColor = UIColor.black.cgColor
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    private lazy var photo4: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.borderWidth = 1
        photo.layer.cornerRadius = 6
        photo.layer.borderColor = UIColor.black.cgColor
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(photosLabel)
        self.contentView.addSubview(photosButton)
        self.contentView.addSubview(photosStack)
        self.photosStack.addArrangedSubview(photo1)
        self.photosStack.addArrangedSubview(photo2)
        self.photosStack.addArrangedSubview(photo3)
        self.photosStack.addArrangedSubview(photo4)
        self.setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.photosLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.photosLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            
            self.photosButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photosButton.centerYAnchor.constraint(equalTo: self.photosLabel.centerYAnchor),
            
            self.photosStack.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            self.photosStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.photosStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photosStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.photosStack.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-48)/4),
            //self.photosStack.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width))
        ])
    }
    
    @objc private func viewPhotoGallery(_ textField: UITextField) {
        let photoGallery = PhotosViewController()
        self.parentViewController?.navigationController?.pushViewController(photoGallery, animated: true)
    }
    
    
    func setup() {
        photo1.image = UIImage(named: "number_"+String(photosProfile[0]))
        photo2.image = UIImage(named: "number_"+String(photosProfile[1]))
        photo3.image = UIImage(named: "number_"+String(photosProfile[2]))
        photo4.image = UIImage(named: "number_"+String(photosProfile[3]))
    }
    
    
}
