//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 07.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        //layout.minimumInteritemSpacing = 8
        //layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Default")
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private lazy var additionalPhoto: UIImageView = {
        let additionalPhoto = UIImageView()
        additionalPhoto.isHidden = true
        additionalPhoto.alpha = 0.5
        additionalPhoto.clipsToBounds = true
        additionalPhoto.layer.borderWidth = 1
        additionalPhoto.layer.cornerRadius = 0
        additionalPhoto.layer.borderColor = UIColor.black.cgColor
        additionalPhoto.contentMode = .scaleAspectFill
        additionalPhoto.translatesAutoresizingMaskIntoConstraints = false
        return additionalPhoto
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.isHidden = true
        closeButton.alpha = 1
        closeButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .white
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    
    private lazy var additionalView: UIView = {
        let additionalView = UIView()
        additionalView.isHidden = true
        additionalView.alpha = 0
        additionalView.backgroundColor = .black
        additionalView.translatesAutoresizingMaskIntoConstraints = false
        return additionalView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Photo Gallery"
        self.view.backgroundColor = .systemGray5
        self.view.addSubview(collectionView)
        self.view.addSubview(additionalView)
        self.view.addSubview(closeButton)
        self.view.addSubview(additionalPhoto)
        self.setupConstraints()
        self.setupGestures()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.additionalView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.additionalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.additionalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.additionalView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupGestures() {
        let tapCloseButtonGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnCloseButton))
        self.closeButton.addGestureRecognizer(tapCloseButtonGesture)
        self.closeButton.isUserInteractionEnabled = true
        let tapAdditionalViewGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnCloseButton))
        self.additionalView.addGestureRecognizer(tapAdditionalViewGesture)
        self.additionalView.isUserInteractionEnabled = true
    }
    
    
    @objc func tapOnCloseButton() {
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.additionalPhoto.isHidden = true
            self.additionalPhoto.image = nil
            self.closeButton.isHidden = true
            self.closeButton.alpha = 0
            self.additionalView.isHidden = true
            self.additionalView.alpha = 0
            //self.view.layoutIfNeeded()
        }
    }
    
    
    
}


extension PhotosViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosGallery.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionCell", for: indexPath) as! PhotosCollectionViewCell
        let photoNumber = photosGallery[indexPath.row]
        cell.setup(number: photoNumber)
        self.additionalPhoto = cell.photo
        
        cell.tapOnPhotoClosure = {
            self.view.addSubview(self.additionalPhoto)
            UIView.animate(withDuration: 0.2, delay: 0) {
                self.additionalPhoto.isUserInteractionEnabled = false
                self.additionalPhoto.isHidden = false
                self.additionalPhoto.image = UIImage(named: "number_" + String(photoNumber))
                NSLayoutConstraint.activate([
                    self.additionalPhoto.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    self.additionalPhoto.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    self.additionalPhoto.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                    self.additionalPhoto.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                    self.additionalPhoto.heightAnchor.constraint(equalTo: self.view.widthAnchor)
                ])
                self.closeButton.isHidden = false
                self.closeButton.alpha = 1
                self.additionalView.isHidden = false
                self.additionalView.alpha = 0.5
            }
        }
        
        return cell
    }
    
    

    
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout { 
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width - 2*8) / 3 - 8 // view.frame.size.width / 3 - 12
        return CGSize(width: size, height: size)
    }
    
    
}
