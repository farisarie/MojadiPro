//
//  MoreViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 26/04/22.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var secContainer: UIView!
    @IBOutlet weak var mobileBtn: UIButton!
    @IBOutlet weak var atmBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor(hex: "16171D")
    }
    func setupView(){
        title = "Detail Payment"
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        secContainer.backgroundColor = .clear
        secContainer.layer.cornerRadius = 14
        secContainer.layer.masksToBounds = true
        secContainer.layer.borderWidth = 1
        secContainer.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        var atmAtributes = [NSAttributedString.Key : Any]()
        atmAtributes = [
            .font : UIFont(name: "Nunito-Regular", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "ATM BNI"
        let myAttrString = NSAttributedString(string: myString, attributes: atmAtributes)
        atmBtn.setAttributedTitle(myAttrString, for: .normal)
        atmBtn.backgroundColor = UIColor(hex: "1AE4CE")
        atmBtn.layer.cornerRadius = 13
        atmBtn.layer.masksToBounds = true
        var mobAtributes = [NSAttributedString.Key : Any]()
        mobAtributes = [
            .font : UIFont(name: "Nunito-Regular", size: 14),
            .foregroundColor : UIColor(hex: "1AE4CE"),
            .backgroundColor : UIColor(hex: "292934")]
            
            let mobString = "BNI Mobile Banking"
            let myMobString = NSAttributedString(string: mobString, attributes: mobAtributes )
        mobileBtn.setAttributedTitle(myMobString, for: .normal)
        mobileBtn.backgroundColor = UIColor(hex: "292934")
        mobileBtn.layer.cornerRadius = 13
        mobileBtn.layer.masksToBounds = true
        mobileBtn.layer.borderWidth = 2
        mobileBtn.layer.borderColor = UIColor(hex: "1AE4CE").cgColor
        
        
        var payAtributes = [NSAttributedString.Key : Any]()
        payAtributes = [
            .font : UIFont(name: "Nunito-Regular", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        
        let payString = "Pay Now"
        let payAttString = NSAttributedString(string: payString, attributes: payAtributes)
        payButton.setAttributedTitle(payAttString, for: .normal)
        payButton.backgroundColor = UIColor(hex: "1AE4CE")
        payButton.layer.cornerRadius = 17
        payButton.layer.masksToBounds = true
        
        
        
    }

}
extension UIViewController{
    func navigateToMorePaymentDetail() {
    let storyboard = UIStoryboard(name: "More", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "moreDetail") as! MoreViewController
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    }
