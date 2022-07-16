//
//  WebinarViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 22/04/22.
//

import UIKit

class WebinarViewCell: UICollectionViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var webinarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupText()
    }
    func setupText(){
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-Bold", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF")
        ]
        let myString = "Join Now"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        joinBtn.setAttributedTitle(myAttrString, for: .normal)
        self.layer.cornerRadius = 11
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        overviewLabel.textColor = UIColor(hex: "14B8A6")
        overviewLabel.font = UIFont(name: "Nunito-SemiBold", size: 14)
        date.textColor = .white
        date.font = UIFont(name: "Nunito-Regular", size: 14 )
        webinarLabel.textColor = .white
        webinarLabel.font = UIFont(name: "Nunito-Regular", size: 12 )

        joinBtn.backgroundColor = UIColor(hex: "14B8A6")
        joinBtn.setTitleColor(.white, for: .normal)
        
        joinBtn.layer.cornerRadius = 14
        joinBtn.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        
    }
}
//teacherCourse.font = UIFont(name: "Nunito-Regular", size: 12 )
