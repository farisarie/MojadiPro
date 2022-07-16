//
//  BankViewCell.swift
//  MojadiApp
//
//  Created by Yafi Cahyono Adi on 12/04/22.
//

import UIKit

class BankViewCell: UITableViewCell {

    @IBOutlet weak var optionButton: RoundedButton!
    @IBOutlet weak var nameBank: UILabel!
    @IBOutlet weak var containerBank: UIView!
    @IBOutlet weak var imageBank: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        containerBank.layer.masksToBounds = true
        containerBank.layer.cornerRadius = 10
        optionButton.layer.borderWidth = 2
        optionButton.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        // Configure the view for the selected state
    }

}
