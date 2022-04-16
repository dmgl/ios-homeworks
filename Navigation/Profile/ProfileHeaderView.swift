//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private lazy var avatar = UIImageView()
    
    private lazy var name = UILabel()
    private lazy var status = UILabel()
    
    private lazy var statusText: String = ""
    
    private lazy var statusTextField = UITextField()
    private lazy var setStatusButton = UIButton()
    
    private lazy var infoStackView: UIStackView = UIStackView()
    private lazy var labelsStackView: UIStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
                
        setupViews()
        
        [avatar,
         name,
         status,
         statusTextField,
         setStatusButton].forEach { self.addSubview($0) }
        
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
        avatar.layer.cornerRadius = 60
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
        
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        
        setStatusButton.backgroundColor = .blue
        
        setStatusButton.layer.cornerRadius = 16
        setStatusButton.layer.masksToBounds = true
        
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        // action
        setStatusButton.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            
            [
                /// __avatar__

                avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                avatar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                avatar.widthAnchor.constraint(equalToConstant: 120),
                avatar.heightAnchor.constraint(equalToConstant: 120),

                /// __name__

                name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
                name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
                name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

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

                setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
                setStatusButton.leadingAnchor.constraint(equalTo: avatar.leadingAnchor),
                setStatusButton.trailingAnchor.constraint(equalTo: name.trailingAnchor),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50)
                
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
