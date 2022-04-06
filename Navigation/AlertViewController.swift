//
//  AlertViewController.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 20.03.2022.
//

import UIKit

class AlertViewController: UIAlertController {
    
    
    var completionHideButton: (()->())?
    var completionShowButton: (()->())?
    
    // Важно понять: тут просто объявляем closure, и вызываем,
    // а определяем функционад там, где у нас есть
    // доступ к нужному см. InfoViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.title = "Delete post immediately?"
        self.message = "Choose your decision"
        
        
        print("Delete post immediately?")
        

        let deleteConfirmation = UIAlertAction(title: "Yes, delete", style: .destructive) {
            action in
            print("Yes, was deleted")
        }

        let deleteAbort = UIAlertAction(title: "No", style: .cancel) {
            (_) in
            print("No, abort delete")
        }
        
        self.addAction(deleteConfirmation)
        self.addAction(deleteAbort)
    }

    
    override func viewWillAppear(_ animated: Bool) {        // можно было бы у InfoViewController там 
        self.completionHideButton?()                        // где present указать на completion
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.completionShowButton?()
    }
    
    
}
