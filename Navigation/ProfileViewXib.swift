//
//  ProfileView.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 02.03.2022.
//

import UIKit

class ProfileViewXib: UIView {


    @IBOutlet weak var prfAvatar: UIImageView!
    @IBOutlet weak var prfName: UILabel!
    @IBOutlet weak var prfBirthday: UILabel!
    @IBOutlet weak var prfCity: UILabel!
    @IBOutlet weak var prfText: UITextView!


    override init(frame: CGRect) {
        super.init(frame: frame)
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
 

    func setupViews() {
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleHeight,
                                    .flexibleWidth]
        self.addSubview(xibView)
    }
    

    private func loadViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ProfileView", bundle: bundle)
        if let xibView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return xibView
        } else {
            return UIView()
        }
    }
    
    
    func setupView() {
        self.prfName.text = "Léa Seydoux"
        self.prfBirthday.text = "01-07-1985"
        self.prfCity.text = "Paris"
    }

}


