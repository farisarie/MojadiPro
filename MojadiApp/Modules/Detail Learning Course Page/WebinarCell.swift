//
//  WebinarCell.swift
//  MojadiApp
//
//  Created by yoga arie on 23/05/22.
//

import UIKit

class WebinarCell: UICollectionViewCell {
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var webinarLabel: UILabel!
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    func setup(){
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
        clock.font = UIFont(name: "Nunito-Regular", size: 14 )
        clock.textColor = .white
        

        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "14B8A6").cgColor
    }
}


