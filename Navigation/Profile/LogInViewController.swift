//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 28.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    private let nc = NotificationCenter.default
    
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    private lazy var contentView: UIView = UIView()
    
    private lazy var logoView: UIImageView = UIImageView()
    
    private lazy var loginEmailOrTelTextField: UITextField = UITextField()
    private lazy var loginPasswordTextField: UITextField = UITextField()
    
    private lazy var loginButton: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = .white
        
        setupViews()
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.addSubview(contentView)
        
        self.contentView.addSubview(self.logoView)
        self.contentView.addSubview(self.loginEmailOrTelTextField)
        self.contentView.addSubview(self.loginPasswordTextField)
        self.contentView.addSubview(self.loginButton)
        
        setupConstraints()
        
        hideKeyboardWhenTappedAround()                                                                                                      // https://stackoverflow.com/a/27079103/3123886
        
    }


    private func setupViews() {
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        loginEmailOrTelTextField.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        /// __scrollView__
        
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        
        /// __logoView__
        
        logoView.image = UIImage(named: "logo.png")
        
        
        /// __loginEmailOrTelTextField__
        
        loginEmailOrTelTextField.placeholder = "Email or phone"
        //loginEmailOrTelTextField.clipsToBounds = true
        
        loginEmailOrTelTextField.textColor = .black
        loginEmailOrTelTextField.font = UIFont.systemFont(ofSize: 16)
        loginEmailOrTelTextField.autocapitalizationType = .none
        
        loginEmailOrTelTextField.backgroundColor = .systemGray6
                
        loginEmailOrTelTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginEmailOrTelTextField.layer.borderWidth = 0.5
        loginEmailOrTelTextField.layer.cornerRadius = 10
        
        loginEmailOrTelTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginEmailOrTelTextField.frame.height))     // https://stackoverflow.com/a/33207638/3123886
        loginEmailOrTelTextField.leftViewMode = .always                                                                                     // https://stackoverflow.com/a/33207638/3123886
        loginEmailOrTelTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]                                         // https://stackoverflow.com/a/50579958/3123886
        
         loginEmailOrTelTextField.delegate = self // attention
        
        
        /// __loginPasswordTextField__
        
        loginPasswordTextField.placeholder = "Password"
        //loginPasswordTextField.clipsToBounds = true
        
        loginEmailOrTelTextField.textColor = .black
        loginPasswordTextField.font = UIFont.systemFont(ofSize: 16)
        loginPasswordTextField.autocapitalizationType = .none
        
        loginPasswordTextField.backgroundColor = .systemGray6
                
        loginPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginPasswordTextField.layer.borderWidth = 0.5
        loginPasswordTextField.layer.cornerRadius = 10
        
        loginPasswordTextField.isSecureTextEntry = true
        
        loginPasswordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginEmailOrTelTextField.frame.height))       // https://stackoverflow.com/a/33207638/3123886
        loginPasswordTextField.leftViewMode = .always                                                                                       // https://stackoverflow.com/a/33207638/3123886
        loginPasswordTextField.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner ]                                         // https://stackoverflow.com/a/50579958/3123886
        
        loginPasswordTextField.delegate = self // attention
        
        
        /// __loginButton__
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.clipsToBounds = true
        
        loginButton.setTitleColor(.white, for: .normal)

        let pixel = UIImage(named: "blue_pixel.png")
        
        let pixel08 = UIImage(named: "blue_pixel.png")                                                                                      // https://stackoverflow.com/a/28518126/3123886
        let pixelView = UIImageView(image: pixel08)
        pixelView.alpha = 0.8
        
        loginButton.setBackgroundImage(pixel, for: .normal)
        loginButton.setBackgroundImage(pixel08, for: .selected)
        loginButton.setBackgroundImage(pixel08, for: .highlighted)
        loginButton.setBackgroundImage(pixel08, for: .disabled)
        
        loginButton.layer.cornerRadius = 10
        
        // action
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate(
            
            [
                
                /// __scrollView__
                
                self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                self.scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                self.scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
                self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                
                
                /// __contentView__
                
                self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                self.contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
                self.contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
                self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
                self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
                
                
                /// __logoView__
                
                self.logoView.topAnchor.constraint(lessThanOrEqualTo: self.scrollView.topAnchor, constant: 120),
                self.logoView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
                self.logoView.heightAnchor.constraint(equalToConstant: 100),
                self.logoView.widthAnchor.constraint(equalToConstant: 100),
                
                
                /// __loginEmailOrTelTextField__
                
                self.loginEmailOrTelTextField.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
                self.loginEmailOrTelTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                self.loginEmailOrTelTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                self.loginEmailOrTelTextField.heightAnchor.constraint(equalToConstant: 50),
                
                
                /// __loginPasswordTextField__
                
                self.loginPasswordTextField.topAnchor.constraint(equalTo: self.loginEmailOrTelTextField.bottomAnchor),
                self.loginPasswordTextField.leadingAnchor.constraint(equalTo: self.loginEmailOrTelTextField.leadingAnchor),
                self.loginPasswordTextField.trailingAnchor.constraint(equalTo: self.loginEmailOrTelTextField.trailingAnchor),
                self.loginPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
                
                
                /// __loginButton__
                
                self.loginButton.topAnchor.constraint(equalTo: self.loginPasswordTextField.bottomAnchor, constant: 16),
                self.loginButton.leadingAnchor.constraint(equalTo: self.loginPasswordTextField.leadingAnchor),
                self.loginButton.trailingAnchor.constraint(equalTo: self.loginPasswordTextField.trailingAnchor),
                self.loginButton.heightAnchor.constraint(equalToConstant: 50),
                
                // for correct work of full scrolling down need to set bottom anchor for latest element
                self.loginButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            ]
        
        )
        
    }
    
    
    @objc private func loginButtonTapped() {
        
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //nc.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        //nc.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    
    }
    
    
    @objc private func kbdShow(notification: NSNotification) {
        
        
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keyboardRectangle = keyboardSize.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
//            scrollView.contentInset.bottom = keyboardHeight                                                               // by tutor
//            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)    // by tutor
            
            
            // googled hack: variant for big screens (frameHeightWithoutKeyboard will be huge)                              // var 2
            let fromEdgeToButtonBottomPosition = self.loginButton.frame.origin.y + 50 + 16*2
            let frameHeightWithoutKeyboard = self.view.frame.height - keyboardHeight
            
            let offset = frameHeightWithoutKeyboard < fromEdgeToButtonBottomPosition ?
                fromEdgeToButtonBottomPosition - frameHeightWithoutKeyboard
                : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: offset)
            
        }
        
    }
    
    
    @objc private func kbdHide() {
        
        //scrollView.contentInset = .zero                                                                                   // by tutor
        //scrollView.verticalScrollIndicatorInsets = .zero                                                                  // by tutor
        
        self.scrollView.contentOffset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
    
    func hideKeyboardWhenTappedAround() {                                                                                                   // https://stackoverflow.com/a/27079103/3123886
            
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    
    }
    
    
    @objc private func dismissKeyboard() {                                                                                                  // https://stackoverflow.com/a/27079103/3123886
        
        self.view.endEditing(true)
        
    }
    
    
//    @objc private func rotated() {
//    
//        if UIDevice.current.orientation.isLandscape {
//            logoView.isHidden = true
//        } else {
//            logoView.isHidden = false
//        }
//
//
//}
    
    
}


extension LogInViewController: UITextFieldDelegate { // attention
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}
