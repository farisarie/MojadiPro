//
//  RateViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 06/05/22.
//

import UIKit

class RateViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descRate: UILabel!
    @IBOutlet weak var starRate: UIImageView!
    @IBOutlet weak var nameRate: UILabel!
    @IBOutlet weak var imgRate: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       backgroundColor = .clear
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    func setup(){
        containerView.backgroundColor = UIColor(hex: "363644")
        imgRate.layer.cornerRadius = 8
        imgRate.layer.masksToBounds = true
        descRate.textColor = .white
        nameRate.textColor = .white
        containerView.layer.cornerRadius = 13
        containerView.layer.masksToBounds = true
    }
    
}
