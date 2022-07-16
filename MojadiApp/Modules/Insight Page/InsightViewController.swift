//
//  InsightViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 05/05/22.
//

import UIKit

class InsightViewController: UIViewController {

    @IBOutlet weak var courseLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var insightTxtView: UITextView!
    @IBOutlet weak var insightImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Online Insight"
        
        insightImg.image = UIImage(named: "insightt")
        insightTxtView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget. "
        insightTxtView.textColor = .white
        insightTxtView.backgroundColor = .clear
        containerView.backgroundColor = UIColor(hex: "292934")
        containerView.layer.cornerRadius = 13
        containerView.layer.masksToBounds = true
        txtField.backgroundColor = UIColor(hex: "45454E")
        courseLbl.text = "Free Strategy Formulation E-Book"
        courseLbl.textColor = .white
        courseLbl.font = UIFont(name: "Nunito-SemiBold", size: 20)
        viewControllerSetup()
        buttonSetup()
    }
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }
    func buttonSetup(){
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-Bold", size: 12),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Submit"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        submitBtn.setAttributedTitle(myAttrString, for: .normal)
        submitBtn.backgroundColor = UIColor(hex: "1AE4CE")
        submitBtn.layer.cornerRadius = 17
        submitBtn.layer.masksToBounds = true
    }



}

extension UIViewController {
    
    func showInsightController(){
        let storyboard = UIStoryboard(name: "Insight", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "insight") as! InsightViewController
        viewController.hidesBottomBarWhenPushed = true
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

