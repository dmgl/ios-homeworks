//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 28.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "logo.png")
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    private lazy var loginEmailOrPhoneTextField: UITextField = {
        let loginEmailOrPhoneTextField = UITextField()
        loginEmailOrPhoneTextField.placeholder = "Email or phone"
        loginEmailOrPhoneTextField.clipsToBounds = true
        loginEmailOrPhoneTextField.textColor = .black
        loginEmailOrPhoneTextField.font = UIFont.systemFont(ofSize: 16)
        loginEmailOrPhoneTextField.autocapitalizationType = .none
        loginEmailOrPhoneTextField.backgroundColor = .systemGray5
        loginEmailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginEmailOrPhoneTextField.layer.borderWidth = 0.5
        loginEmailOrPhoneTextField.layer.cornerRadius = 10
        loginEmailOrPhoneTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginEmailOrPhoneTextField.frame.height))  // https://stackoverflow.com/a/33207638/3123886
        loginEmailOrPhoneTextField.leftViewMode = .always                                                                                    // https://stackoverflow.com/a/33207638/3123886
        loginEmailOrPhoneTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]                                        // https://stackoverflow.com/a/50579958/3123886
        loginEmailOrPhoneTextField.delegate = self                                                                                           // attention
        loginEmailOrPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginEmailOrPhoneTextField
    }()
    private lazy var loginPasswordTextField: UITextField = {
        let loginPasswordTextField = UITextField()
        loginPasswordTextField.placeholder = "Password"
        loginPasswordTextField.clipsToBounds = true
        loginPasswordTextField.textColor = .black
        loginPasswordTextField.font = UIFont.systemFont(ofSize: 16)
        loginPasswordTextField.autocapitalizationType = .none
        loginPasswordTextField.backgroundColor = .systemGray5
        loginPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginPasswordTextField.layer.borderWidth = 0.5
        loginPasswordTextField.layer.cornerRadius = 10
        loginPasswordTextField.isSecureTextEntry = true
        loginPasswordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginPasswordTextField.frame.height))        // https://stackoverflow.com/a/33207638/3123886
        loginPasswordTextField.leftViewMode = .always                                                                                      // https://stackoverflow.com/a/33207638/3123886
        loginPasswordTextField.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner ]                                        // https://stackoverflow.com/a/50579958/3123886
        loginPasswordTextField.delegate = self                                                                                             // attention
        loginPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginPasswordTextField
    }()
    private lazy var loginTextFieldsAlert: UILabel = {
        let loginPasswordTextFieldAlert = UILabel()
        loginPasswordTextFieldAlert.clipsToBounds = true
        loginPasswordTextFieldAlert.textColor = .red
        loginPasswordTextFieldAlert.font = UIFont.systemFont(ofSize: 12)
        loginPasswordTextFieldAlert.layer.borderColor = UIColor.lightGray.cgColor
        loginPasswordTextFieldAlert.translatesAutoresizingMaskIntoConstraints = false
        return loginPasswordTextFieldAlert
    }()
    private var loginTextFieldsAlertTopConstraint: NSLayoutConstraint?
    private var loginTextFieldsAlertLeadingConstraint: NSLayoutConstraint?
    private var loginTextFieldsAlertTrailingConstraint: NSLayoutConstraint?
    private var loginTextFieldsAlertBottomConstraint: NSLayoutConstraint?
    private var loginTextFieldsAlertHeightConstraint: NSLayoutConstraint?
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.clipsToBounds = true
        loginButton.setTitleColor(.white, for: .normal)
        let pixel = UIImage(named: "blue_pixel.png")
        let pixel08 = UIImage(named: "blue_pixel.png")                                                                                     // https://stackoverflow.com/a/28518126/3123886
        let pixelView = UIImageView(image: pixel08)
        pixelView.alpha = 0.8
        loginButton.setBackgroundImage(pixel, for: .normal)
        loginButton.setBackgroundImage(pixel08, for: .selected)
        loginButton.setBackgroundImage(pixel08, for: .highlighted)
        loginButton.setBackgroundImage(pixel08, for: .disabled)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)                                             // action
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.logoView)
        self.contentView.addSubview(self.loginEmailOrPhoneTextField)
        self.contentView.addSubview(self.loginPasswordTextField)
        self.contentView.addSubview(self.loginTextFieldsAlert)
        self.contentView.addSubview(self.loginButton)
        self.setupConstraints()
        self.hideKeyboardWhenTappedAround()                                                                                                // https://stackoverflow.com/a/27079103/3123886
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),

            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.logoView.topAnchor.constraint(lessThanOrEqualTo: self.scrollView.topAnchor, constant: 120),
            self.logoView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            
            self.loginEmailOrPhoneTextField.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
            self.loginEmailOrPhoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            self.loginEmailOrPhoneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            self.loginEmailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.loginPasswordTextField.topAnchor.constraint(equalTo: self.loginEmailOrPhoneTextField.bottomAnchor),
            self.loginPasswordTextField.leadingAnchor.constraint(equalTo: self.loginEmailOrPhoneTextField.leadingAnchor),
            self.loginPasswordTextField.trailingAnchor.constraint(equalTo: self.loginEmailOrPhoneTextField.trailingAnchor),
            self.loginPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.loginButton.topAnchor.constraint(equalTo: self.loginTextFieldsAlert.bottomAnchor, constant: 16),
            self.loginButton.leadingAnchor.constraint(equalTo: self.loginEmailOrPhoneTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.loginEmailOrPhoneTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            // for correct work of full scrolling down need to set bottom anchor for latest element
            self.loginButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            ])
        
        loginTextFieldsAlertTopConstraint = loginTextFieldsAlert.topAnchor.constraint(equalTo: self.loginPasswordTextField.bottomAnchor, constant: 2)
        loginTextFieldsAlertLeadingConstraint = loginTextFieldsAlert.leadingAnchor.constraint(equalTo: self.loginPasswordTextField.leadingAnchor, constant: 8)
        loginTextFieldsAlertTrailingConstraint = loginTextFieldsAlert.trailingAnchor.constraint(equalTo: self.loginPasswordTextField.trailingAnchor, constant: 8)
        loginTextFieldsAlertHeightConstraint = loginTextFieldsAlert.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([loginTextFieldsAlertTopConstraint,
                                     loginTextFieldsAlertLeadingConstraint,
                                     loginTextFieldsAlertTrailingConstraint,
                                     loginTextFieldsAlertHeightConstraint].compactMap({ $0 }))
        
        
    }
    
    
    @objc private func loginButtonTapped() {
        guard let emailOrPhoneText = self.loginEmailOrPhoneTextField.text else {print("check"); return}
        guard let passwordText = self.loginPasswordTextField.text else {print ("check"); return}
        // login screen: task 1
        if emailOrPhoneText.isEmpty {
            UIView.animate(withDuration: 0.2, delay: 0) {
                self.loginEmailOrPhoneTextField.layer.borderColor = UIColor.red.cgColor
                self.loginEmailOrPhoneTextField.layer.borderWidth = 1
                self.loginTextFieldsAlert.text = "Email or phone field cannot be empty"
                self.loginTextFieldsAlertHeightConstraint?.constant = 16
                self.view.layoutIfNeeded()
            }
            completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0.0) {
                    self.loginEmailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
                    self.loginEmailOrPhoneTextField.layer.borderWidth = 0.5
                }
            }
            return
        }
        if passwordText.isEmpty {
            UIView.animate(withDuration: 0.2, delay: 0) {
                self.loginPasswordTextField.layer.borderColor = UIColor.red.cgColor
                self.loginPasswordTextField.layer.borderWidth = 1
                self.loginTextFieldsAlert.text = "Password field cannot be empty"
                self.loginTextFieldsAlertHeightConstraint?.constant = 16
                self.view.layoutIfNeeded()
            }
            completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0.0) {
                    self.loginPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
                    self.loginPasswordTextField.layer.borderWidth = 0.5
                }
            }
            return
        }
        // login screen: task 2
        if (passwordText.count < minCredentialsLength) || (emailOrPhoneText.count < minCredentialsLength) {
            UIView.animate(withDuration: 0.2, delay: 0) {
                self.loginTextFieldsAlert.text = "All credentials must be at least 5 symbols"
                self.loginTextFieldsAlertHeightConstraint?.constant = 16
                self.view.layoutIfNeeded()
            }
            return
        }
        // login screen: task 3
        if (emailOrPhoneText != defaultEmailOrPhone ) || (passwordText != defaultPassword) {
            let alert = UIAlertController(title: "Oops", message: "Your login or password is incorrect\nPlease check it", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc private func kbdShow(notification: NSNotification) {
        if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardSize.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            // googled hack: variant for big screens (frameHeightWithoutKeyboard will be huge)
            let fromEdgeToButtonBottomPosition = self.loginButton.frame.origin.y + 50 + 16*2
            let frameHeightWithoutKeyboard = self.view.frame.height - keyboardHeight
            let offset = frameHeightWithoutKeyboard < fromEdgeToButtonBottomPosition ?
            fromEdgeToButtonBottomPosition - frameHeightWithoutKeyboard : 0
            self.scrollView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
    
    
    @objc private func kbdHide() {
        self.scrollView.contentOffset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    private func hideKeyboardWhenTappedAround() {                                                                                          // https://stackoverflow.com/a/27079103/3123886
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    @objc private func dismissKeyboard() {                                                                                                 // https://stackoverflow.com/a/27079103/3123886
        self.view.endEditing(true)
        
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.loginTextFieldsAlertHeightConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    
    }
    
    
}


extension LogInViewController: UITextFieldDelegate {                                                                                       // attention
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
