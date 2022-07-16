//
//  InstructureViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 28/04/22.
//

import UIKit

class InstructureViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var priceCourse: UILabel!
    @IBOutlet weak var dateCourse: UILabel!
    @IBOutlet weak var titleCourse: UILabel!
    @IBOutlet weak var teacherImg: UIImageView!
    @IBOutlet weak var courseImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codes
        setupView()
    }
    func setupView(){
       containerView.backgroundColor = UIColor(hex: "292934")
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        priceCourse.textColor = UIColor(hex: "14B8A6")
        dateCourse.textColor = UIColor(hex: "A3A3A3")
        titleCourse.textColor = .white
    }

}
//nameCourse.font = UIFont(name: "Nunito-SemiBold", size: 14 )
