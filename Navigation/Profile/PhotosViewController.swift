//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 07.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photos: [Int] = Array(1...20)

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

     override func viewDidLoad() {
         super.viewDidLoad()
         
         self.navigationController?.navigationBar.isHidden = false
         self.navigationItem.title = "Photo Gallery"
         self.view.backgroundColor = .systemGray5
         self.view.addSubview(collectionView)
         self.setupConstraints()
     }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.navigationBar.isHidden = true
        }
    
 }


extension PhotosViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionCell", for: indexPath) as! PhotosCollectionViewCell
        let photoNumber = photos[indexPath.row]
        cell.setup(number: photoNumber)
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
