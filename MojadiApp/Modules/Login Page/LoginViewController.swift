//
//  LoginViewController.swift
//  MojadiPro
//
//  Created by yoga arie on 21/03/22.
//
import FirebaseAuth
import Alamofire
import UIKit
import SwiftyJSON
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {
 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = UIColor(hex: "16171D")

            emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
    }
    
    // MARK: - Actions
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        setupGoogle()
    }
    
    func showTextInputPrompt(withMessage message: String,
                               completionBlock: @escaping ((Bool, String?) -> Void)) {
        let prompt = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
          completionBlock(false, nil)
        }
        weak var weakPrompt = prompt
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
          guard let text = weakPrompt?.textFields?.first?.text else { return }
          completionBlock(true, text)
        }
        prompt.addTextField(configurationHandler: nil)
        prompt.addAction(cancelAction)
        prompt.addAction(okAction)
        present(prompt, animated: true, completion: nil)
      }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        view.endEditing(true)
        let validation = validate()
        if validation.isValid {
            login()
        }
        else {
            let alert = UIAlertController(title: "Error", message: validation.message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotButton(_ sender: Any) {
        showForgotPageController(email: emailTextField.text)
    }
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func forgotButtonTapped(_ sender: Any) {
        showForgotViewController(email: emailTextField.text)
        
        
    }
    
    @IBAction func viewTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    
    // MARK: - Helpers
    
    func validate() -> (isValid: Bool, message: String) {
        
        guard let email = emailTextField.text, !email.isEmpty else {
            return (false, "Email tidak boleh kosong")
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            return (false, "Password tidak boleh kosong")
        }
        
        return (true, "")
    }
    
    func login() {
        
        
        let params : [String : String ] =
        ["email" : emailTextField.text ?? "",
         "password" : passwordTextField.text ?? ""]
        
        AF.request(Constant.BASE_URL + "login", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            if response.error != nil{
                self.showAlert(response.error?.localizedDescription ?? "")
                return
            }
            let responseLogin = JSON(response.value as Any)
            
            let status = responseLogin["status"].intValue
            let message = responseLogin["message"].stringValue
            
            
            if status <= 200{
                let data = responseLogin["data"].dictionaryValue
                
                
                let token = data["bearer_token"]?.stringValue
                let user = data["user"]?.dictionaryValue
                let id = user?["id"]?.intValue
                let email = user?["email"]?.stringValue
               
                let firstName = user?["first_name"]?.stringValue
                
                let users = Users(id: id  ?? 0, email: email ?? "", token: token ?? "", firstName: firstName ?? "")
              
            
                SessionManager.createSession(users: users)
                
        self.navigateToHome()
        
        
    } else{
        self.showAlert(message)
    }
        }
    }
            func showAlert(_ message: String){
               let alertContoller = UIAlertController(title: "information", message: message, preferredStyle: .alert)
               let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertContoller.addAction(alertAction)
               present(alertContoller, animated: true, completion: nil)
           }
        
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            textField.resignFirstResponder()
            login()
            
        default:
            break
        }
        
        return false
    }
}

//MARK: - Extensioins
extension UIViewController{
    func navigateToLogin() {
    let storyboard = UIStoryboard(name: "Login", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "rootLogin") //akses viewcontroller

        let window = UIApplication.shared.windows.first
        window?.rootViewController = viewController
    }}





