//
//  Extensions.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 16.05.2022.
//

import UIKit


// https://stackoverflow.com/a/51471763/3123886
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}


// https://stackoverflow.com/a/38790163/3123886
extension UIView {

    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}


extension String {
    
    func shorted(to symbols: Int) -> String {
        guard self.count > symbols else { return self }
        return self.prefix(symbols) + " ..."
    }

}

