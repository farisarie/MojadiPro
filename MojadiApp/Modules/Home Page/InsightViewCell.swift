//
//  InsightViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 27/04/22.
//

import UIKit

protocol TableViewCellDelegate: AnyObject{
    func didTapButton()
}
class InsightViewCell: UITableViewCell {

    weak var delegate: TableViewCellDelegate?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var freeBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var insightImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
                let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupView(){
     
        self.backgroundColor = .clear
        containerView.layer.cornerRadius = 14
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor(hex: "292934")
        typeLabel.textColor = UIColor(hex: "71717A")
        typeLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        titleLabel.font = UIFont(name: "Nunito-SemiBold", size: 14)
        titleLabel.textColor = UIColor(hex: "1AE4CE")
        
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-SemiBold", size: 12),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Access Your Free E-Book"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        freeBtn.setAttributedTitle(myAttrString, for: .normal)
        freeBtn.backgroundColor = UIColor(hex: "1AE4CE")
        freeBtn.layer.cornerRadius = 13
        freeBtn.layer.masksToBounds = true
    }
    @IBAction func btnTapped(_ sender: Any) {
        delegate?.didTapButton()
    }
    
}
