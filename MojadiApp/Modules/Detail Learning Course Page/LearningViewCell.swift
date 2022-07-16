//
//  LearningViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 30/06/22.
//

import UIKit

class LearningViewCell: UICollectionViewCell {

    @IBOutlet weak var minimizeBtn: UIButton!
    @IBOutlet weak var chapterLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
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
        
        overviewLabel.font = UIFont(name: "Nunito-SemiBold", size: 14)
    }
    

}
