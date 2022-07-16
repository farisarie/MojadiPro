//
//  MoreViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 22/04/22.
//

import UIKit

class MoreViewCell: UICollectionViewCell {

    @IBOutlet weak var moreImg: UIImageView!
    @IBOutlet weak var moreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moreLabel.font = UIFont(name: "Montserrat-Regular", size: 13)
        moreLabel.textColor = .white
    }

}
