//
//  CourseViewCell.swift
//  Ngetest
//
//  Created by yoga arie on 20/04/22.
//

import UIKit

class CourseViewCell: UICollectionViewCell {

    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var imgCourse: UIImageView!
    @IBOutlet weak var nameCourse: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        self.layer.cornerRadius = 11
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        chapterLabel.textColor = .white
        pagesLabel.textColor = UIColor(hex: "71717A")
        nameCourse.textColor = UIColor(hex: "14B8A6")
        chapterLabel.font = UIFont(name: "Nunito-Regular", size: 12 )
        pagesLabel.font = UIFont(name: "Nunito-Regular", size: 12 )
        nameCourse.font = UIFont(name: "Nunito-SemiBold", size: 14 )
    }

}
