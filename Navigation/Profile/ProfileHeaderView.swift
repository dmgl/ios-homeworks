//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private let avatar = UIImageView()

    private let name = UILabel()
    private let status = UILabel()
    
    private var statusText: String = ""
    
    private let statusTextField = UITextField()
    private let showStatusButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        setupViews()
        
        [avatar,
         name,
         status,
         statusTextField,
         showStatusButton].forEach { self.addSubview($0) }
        
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupViews() {
        
        /// __avatar__
        
        avatar.image = UIImage(named: "Image")
        
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 50
        avatar.layer.borderColor = UIColor.white.cgColor
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        /// __ name__
        
        name.text = "Lea Seydoux"
        
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        
        /// __status__
        
        status.text = "Waiting for something"
        
        status.textColor = .gray
        status.textAlignment = .justified
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        status.translatesAutoresizingMaskIntoConstraints = false
        
        /// __statusTextField__
        
        statusTextField.text = ""
        statusTextField.placeholder = "..."
        
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)

        statusTextField.layer.borderWidth = 1
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        
        statusTextField.autocorrectionType = .yes
        statusTextField.clearButtonMode = .whileEditing
        
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: statusTextField.frame.height))       // https://stackoverflow.com/a/33207638/3123886
        statusTextField.leftViewMode = .always                                                                              // https://stackoverflow.com/a/33207638/3123886
        //statusTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: statusTextField.frame.height))    // https://stackoverflow.com/a/33207638/3123886
        //statusTextField.rightViewMode = .always                                                                           // https://stackoverflow.com/a/33207638/3123886
        
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // action
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        
        /// __showStatusButton__
        
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        
        showStatusButton.backgroundColor = .blue
        
        showStatusButton.layer.cornerRadius = 16
        showStatusButton.layer.masksToBounds = true
        
        showStatusButton.layer.shadowOffset.width = 4
        showStatusButton.layer.shadowOffset.height = 4
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        // action
        showStatusButton.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            
            [
                /// __avatar__
                
                avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16), // this
                avatar.widthAnchor.constraint(equalToConstant: 100),
                avatar.heightAnchor.constraint(equalToConstant: 100),
                
                /// __name__
                
                name.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
                name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
                name.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
                
                /// __status__
                
                status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 34),
                status.leadingAnchor.constraint(equalTo: name.leadingAnchor),
                status.trailingAnchor.constraint(equalTo: name.trailingAnchor),
                status.heightAnchor.constraint(equalToConstant: 16),
                
                /// __statusTextField__
                
                statusTextField.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 12),
                statusTextField.leadingAnchor.constraint(equalTo: name.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: name.trailingAnchor),
                statusTextField.heightAnchor.constraint(equalToConstant: 40),
                
                /// __showStatusButton__
                
                showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
                showStatusButton.leadingAnchor.constraint(equalTo: avatar.leadingAnchor),
                showStatusButton.trailingAnchor.constraint(equalTo: name.trailingAnchor), // this
                showStatusButton.heightAnchor.constraint(equalToConstant: 50)
                
            ]
        )
        
    }
    
    
    @objc private func showStatusButtonTapped() {
                
        status.text = statusText
        print("Print to console:", status.text ?? "check this #1")
        
    }
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        self.statusText = statusTextField.text ?? "check this #2"
        
    }
    
    
    
}
