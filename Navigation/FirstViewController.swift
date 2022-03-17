//
//  ViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 10.02.2022.
//

import UIKit

// передача из SecondViewController в FirstViewController
// передача от второго к первому - способ 1 delegate, protocol
protocol ViewControllerDelegate: AnyObject {
    func changeButtonTitleColor()
}


class FirstViewController: UIViewController {


    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() { // вызывается 1 раз при создании ViewController
        
        print(#function, "FirstViewController")
        
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.prefersLargeTitles = true // переменная относится ко всем экранам с navigationBar (если где-то переопределить, то везде изменится)
        // гайдлайны apple говорят, что размер navigationBar должен быть одинаковым на всех экранах
        
        //self.navigationItem.title = "First"
        
        self.navigationItem.backButtonTitle = "Back..." // кастомное название назад
        //self.navigationItem.backButtonTitle = "" // чтобы была просто стрелочка

        
        self.setupButton()
                
        // перерисовка, методы, которые вызываются, когда идет перерасчет layout, когда мы меняем к пр. какие-то constraints
        
        //self.view.setNeedsLayout() // асинхронный метод (оба вызывают viewWillLayoutSubviews и viewDidLayoutSubviews) он работает с анимацией
        //self.view.layoutIfNeeded() // синхронный метод (оба вызывают viewWillLayoutSubviews и viewDidLayoutSubviews) не работает с анимацией

    }

    //override func viewWillLayoutSubviews() {
    //    //
    //}
    
    //override func viewDidLayoutSubviews() {
    //    //
    //}

    //deinit {
    //    //
    //}

    
    private func setupButton() {
        self.continueButton.clipsToBounds = true
        self.continueButton.layer.cornerRadius = 15
        self.continueButton.backgroundColor = .systemBlue
        self.continueButton.setTitle("Continue", for: .normal)
        self.continueButton.setTitleColor(.white, for: .normal)
        
        self.continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        //let left = continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100)
        //let right = continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100)
        //let bottom = continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100)
        //let centerX = continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        //let centerY = continueButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        //NSLayoutConstraint.activate([left,right,bottom])
    }
    
    
    //@IBAction func didContinueButton(_ sender: Any) {
    //    let secondViewController = UIViewController()
    //    self.navigationController?.pushViewController(secondViewController, animated: true)
    //}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(#function, "FirstViewController viewWillAppear")
        print("будет отображен FirstViewController")
        
        self.navigationController?.navigationBar.prefersLargeTitles = true // костыль, который все используют (если нужны разного размера заголовки navigation)
        self.navigationItem.title = "First" // костыль, который все используют (если нужны разного размера заголовки navigation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(#function, "FirstViewController viewDidAppear")
        print("уже отобразился FirstViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print(#function, "FirstViewController viewWillDisappear")
        print("сейчас исчезнет FirstViewController")

        self.navigationItem.title = "" // костыль, который все используют (если нужны разного размера заголовки navigation)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print(#function, "FirstViewController viewDidDisappear")
        print("сейчас исчезнет FirstViewController")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // передача из FirstViewController в SecondViewController
        // передача от первого ко второму
        
        guard
            segue.identifier == "showSecondViewController",
                let secondViewController = segue.destination as? SecondViewController
        else {
                return
            }
        
        //secondViewController.customLabel.text = "QWERTY" // так не получится
        secondViewController.customText = "Custom text received from first view"
        
        // передача из SecondViewController в FirstViewController
        // передача от второго к первому - способ 1 delegate, protocol
        secondViewController.delegate = self
        
        // передача из SecondViewController в FirstViewController
        // передача от второго к первому - способ 2 closure
        secondViewController.closure = { [weak self] in
            self?.continueButton.setTitleColor(.yellow, for: .normal)
        }
        //secondViewController.closure = { // опасно, т.к. строгая ссылка
        //    self.continueButton.setTitleColor(.yellow, for: .normal)
        //}
        
        
    }

}


// передача из SecondViewController в FirstViewController
// передача от второго к первому - способ 1
extension FirstViewController:ViewControllerDelegate {
    func changeButtonTitleColor() {
        self.continueButton.setTitleColor(.red, for: .normal)
    }
}
