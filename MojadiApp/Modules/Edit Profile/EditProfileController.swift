//
//  EditProfileController.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class EditProfileController: UIViewController {

    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = UIColor(hex: "16171D")
    }
    func setup(){
        title = "Edit Profile"
        nameTxtField.backgroundColor = UIColor(hex: "292934")
        passwordTxtField.backgroundColor = UIColor(hex: "292934")
        emailTxtField.backgroundColor = UIColor(hex: "292934")
        profileImage.image = UIImage(named: "edit")
        emailTxtField.attributedPlaceholder = NSAttributedString(
        string: " Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
    passwordTxtField.attributedPlaceholder = NSAttributedString(
        string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        nameTxtField.attributedPlaceholder = NSAttributedString(
            string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-Bold", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Update Profile"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        updateBtn.setAttributedTitle(myAttrString, for: .normal)
        updateBtn.backgroundColor = UIColor(hex: "1AE4CE")
        updateBtn.layer.cornerRadius = 17
        updateBtn.layer.masksToBounds = true
    }

}

extension UIViewController {
    
    func showEditController(){
        let storyboard = UIStoryboard(name: "Edit", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "edit") as! EditProfileController
        viewController.hidesBottomBarWhenPushed = true
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
