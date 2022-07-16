//
//  PaymentInfoViewCell.swift
//  Ngetest
//
//  Created by yoga arie on 20/03/22.
//

import UIKit

class PaymentInfoViewCell: UITableViewCell {



    @IBOutlet weak var checkBtn: RoundedButton!
    @IBOutlet weak var packageDiscount: UILabel!
    @IBOutlet weak var packagePrice: UILabel!
    @IBOutlet weak var packageName: UILabel!

    @IBOutlet weak var packageImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func setup(){
//        signUpLabel.textColor = .white
        packageDiscount.textColor = UIColor(hex: "71717A")
        packagePrice.textColor = .white
        packageName.textColor = .white
        checkBtn.backgroundColor = .clear
        checkBtn.layer.borderWidth = 2
        checkBtn.layer.borderColor = UIColor(hex: "A1A1AA").cgColor
        
        
    }
   
 
    
}

