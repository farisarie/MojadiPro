//
//  ForgotPageViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 03/05/22.
//

import UIKit

class ForgotPageViewController: UIViewController {

    @IBOutlet weak var resetBtn: RoundedButton!
    @IBOutlet weak var emailTextField: DesignableTextField!
    var email: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        emailTextField.text = email
        emailTextField.attributedPlaceholder = NSAttributedString(
        string: " Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
        // Do any additional setup after loading the view.
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-Bold", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Send Reset Link"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        resetBtn.setAttributedTitle(myAttrString, for: .normal)
        resetBtn.backgroundColor = UIColor(hex: "1AE4CE")
        resetBtn.layer.cornerRadius = 17
        resetBtn.layer.masksToBounds = true
        
    }
    

    

}

extension UIViewController {
    
    func showForgotPageController(email: String? = nil){
        let storyboard = UIStoryboard(name: "Forgot", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "forgott") as! ForgotPageViewController
        viewController.email = email
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
