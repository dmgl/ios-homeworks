//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    private lazy var statusText: String = ""
    
    lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.isUserInteractionEnabled = true
        avatar.image = UIImage(named: "Image")
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 60
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "Lea Seydoux"
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something"
        status.textColor = .gray
        status.textAlignment = .justified
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
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
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: statusTextField.frame.height))                      // https://stackoverflow.com/a/33207638/3123886
        statusTextField.leftViewMode = .always                                                                                             // https://stackoverflow.com/a/33207638/3123886
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)                                        // action
        statusTextField.delegate = self                                                                                                    // attention
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
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
        setStatusButton.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)                                    // action
        return setStatusButton
    }()
    private lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView()
        infoStackView.axis = .horizontal
        infoStackView.spacing = 16
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        return infoStackView
    }()
    private lazy var labelsStackView: UIStackView = {
        let labelsStackView = UIStackView()
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        labelsStackView.spacing = 10
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        return labelsStackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray5
        self.translatesAutoresizingMaskIntoConstraints = false
        [self.infoStackView, self.statusTextField, self.setStatusButton].forEach( {self.addSubview($0)} )
        [self.avatar, self.labelsStackView].forEach( {self.infoStackView.addArrangedSubview($0)} )
        [self.name, self.status, self.statusTextField].forEach( {self.labelsStackView.addArrangedSubview($0)} )
        setupConstraints()
        hideKeyboardWhenTappedAround()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
//            self.topAnchor.constraint(equalTo: self.topAnchor),
//            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.infoStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.infoStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.infoStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            self.avatar.topAnchor.constraint(equalTo: self.infoStackView.topAnchor),
            self.avatar.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor),
            self.avatar.heightAnchor.constraint(equalTo: self.avatar.widthAnchor, multiplier: 1.0),
            
            self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 16),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor),
            self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
    @objc private func showStatusButtonTapped() {
        status.text = statusText
        print("Print to console:", status.text ?? "check this")
    }
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = statusTextField.text ?? ""
    }
    
    
    private func hideKeyboardWhenTappedAround() {                                                                                          // https://stackoverflow.com/a/27079103/3123886
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }


    @objc private func dismissKeyboard() {                                                                                                 // https://stackoverflow.com/a/27079103/3123886
        self.endEditing(true)
    }
    
}


extension ProfileHeaderView: UITextFieldDelegate {                                                                                       // attention
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
