//
//  QuestionViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 08/05/22.
//

import UIKit

class QuestionViewCell: UITableViewCell {

    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionDate: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
      
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(){
        containerView.backgroundColor = UIColor(hex: "292934")
        qtyLabel.textColor = UIColor(hex: "14B8A6")
        questionLabel.textColor = .white
        profileName.textColor = .white
        questionDate.textColor = UIColor(hex: "9C9C9C")
        containerView.layer.cornerRadius = 13
        containerView.layer.masksToBounds = true
    }
    
}
