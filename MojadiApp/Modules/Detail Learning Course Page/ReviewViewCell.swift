//
//  ReviewViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 20/05/22.
//

import UIKit

class ReviewViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    

    @IBOutlet weak var rateNumber: UILabel!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup(){
        self.layer.cornerRadius = 11
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(hex: "292934")
        imageLabel.layer.cornerRadius = 15
        imageLabel.layer.masksToBounds = true
        reviewLabel.font = UIFont(name: "Montserrat-Regular", size: 10 )
        reviewLabel.textColor = .white
        rateNumber.font = UIFont(name: "Montserrat-Regular", size: 7)
        rateNumber.textColor = .white
        nameLabel.font = UIFont(name: "Montserrat-Regular", size: 10)
        nameLabel.textColor = .white
  
        
    }

}
