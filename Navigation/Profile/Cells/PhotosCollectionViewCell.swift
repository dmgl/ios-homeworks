//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 07.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.clipsToBounds = true
        photo.layer.borderWidth = 1
        photo.layer.cornerRadius = 0
        photo.layer.borderColor = UIColor.black.cgColor
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(photo)
        self.setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.photo.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            self.photo.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            self.photo.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor),
            self.photo.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    
    func setup(number: Int) {
        self.photo.image = UIImage(named: "number_"+String(number))
    }
    
    
}
