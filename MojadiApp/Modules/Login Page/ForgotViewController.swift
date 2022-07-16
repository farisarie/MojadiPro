//
//  ForgotViewController.swift
//  Login
//
//  Created by yoga arie on 07/10/21.
//
import Alamofire
import UIKit
import SwiftyJSON

class ForgotViewController: UIViewController {

    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var email: String?
   
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
       
       
        
        // Do any additional setup after loading the view.
        emailTextField.text = email
        emailTextField.attributedPlaceholder = NSAttributedString(
        string: " Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
        string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
      
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        
        confirmTextField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
            }
    
    
        // Mark: - Actions
   // @IBAction func closeButtonTapped(_ sender: Any) {
    //    dismiss(animated: true, completion: nil)
   // }
 
    func isValid() -> Bool {
        guard let name = nameTextField.text, name.count >= 3  else{
            print("Name is not valid")
            nameTextField.textColor = .red
            return false
            
            
        }
        guard let email = emailTextField.text, email.isValidEmail else{
            let alert = UIAlertController(title: "Email Invalid", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
           
            return false
           
         }
        guard let password = passwordTextField.text, password.isPasswordValid else{
            let alert = UIAlertController(title: "Password Invalid", message: "password must be at least 8 characters long contain a number and an uppercase letter", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return false
           
         }
        guard let confirmPassword = confirmTextField.text, confirmPassword.isPasswordValid else{
            print("Password is not valid")
            return false
           
         }
        
        
        return true
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        view.endEditing(true)
        if isValid(){
            let params : [String: String] =
            ["fullname" : nameTextField.text ?? "",
             "email"    : emailTextField.text ?? "",
             "password" : passwordTextField.text ?? "",
             "password_confirmation" : confirmTextField.text ?? ""]
           
            AF.request(Constant.BASE_URL + "register", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
                if response.error != nil {
                    self.showAlert(response.error?.localizedDescription ?? "")
                    return
                }
                let responseRegis = JSON(response.value as Any)
                let status = responseRegis["status"].intValue
                let data = responseRegis["data"].stringValue
                if status == 200 {
                    self.navigationController?.popViewController(animated: true)
                    
                } else {
                    self.showAlert(data)
                }
                
                
                
            }
        } else {
            
        }
    }
    func showAlert(_ message: String){
       let alertContoller = UIAlertController(title: "information", message: message, preferredStyle: .alert)
       let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
       alertContoller.addAction(alertAction)
       present(alertContoller, animated: true, completion: nil)
   }
    @IBAction func alreadyRegister(_ sender: Any) {
       
            navigationController?.popViewController(animated: true)
       
}
}

// Mark: - Extensions
extension UIViewController {
    
    func showForgotViewController(email: String? = nil){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "forgot") as! ForgotViewController
        viewController.email = email
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
