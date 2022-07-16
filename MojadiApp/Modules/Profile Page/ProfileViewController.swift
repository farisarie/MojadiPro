//
//  ProfileViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 10/04/22.
//
import SwiftyJSON
import Alamofire
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    var profile: [Profile] = [
        Profile(name: "My Profile", image: "profile"),
        Profile(name: "About MojadiPro", image: "about"),
        Profile(name: "Setting", image: "setting"),
        Profile(name: "Rate MojadiPro", image: "star")
    ]
    let screenWidth = UIScreen.main.bounds.width
    let lowestScreenWidth: CGFloat = 375.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = UIColor(hex: "16171D")
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ProfileViewCell", bundle: nil), forCellReuseIdentifier: "setting_cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
   
    func setup(){
        let name = UserDefaults.standard.string(forKey: "emailLogin")
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        tableView.backgroundColor = .red
        tableView.layer.cornerRadius = 13
        tableView.layer.masksToBounds = true
        imgView.image = UIImage(named: "ruth")
        nameLabel.text = name
        nameLabel.textColor = .white
        mottoLabel.text = "#Mojadiapp #JadiApaAjaBisa"
        mottoLabel.textColor = .white
        containerView.backgroundColor = UIColor(hex: "14B8A6")
        nameLabel.font = UIFont(name: "Nunito-Bold", size: 16)
        mottoLabel.font = UIFont(name: "Nunito-Regular", size: 12)
        
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        
            let token = UserDefaults.standard.string(forKey: "tokenLogin")!
            let header : HTTPHeaders = ["Authorization" : "Bearer " + token]
            AF.request(Constant.BASE_URL + "logout", method: .post, encoding: JSONEncoding.default, headers: header).responseJSON { response in

                print("TOKEN MOJADIAPP = \(response)")
                if response.error != nil{
                    self.showAlert(response.error?.localizedDescription ?? "")
                    return
                }
                let response = JSON(response.value as Any)
                let status = response["status"].intValue

                if status == 200 {
                    UserDefaults.standard.set(false, forKey: "isLogin")
                    UserDefaults.standard.synchronize()

                    self.navigateToLogin()
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
extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting_cell", for: indexPath) as! ProfileViewCell
        let image = UIImage(named: profile[indexPath.row].image)
        cell.nameLabel.text = profile[indexPath.row].name
        cell.imgSetting.image = image
        return cell
    }
    
    
    
}
    


extension ProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
         showEditController()
        } else if indexPath.row == 1{
            showAboutController()
        }
        else if indexPath.row == 2{
            showSettingController()
        } else{
           ShowRateViewController()
        }
        

        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = screenWidth > lowestScreenWidth ? 43.67 : 43.45
       
        return width
    }
    }

//extension ProfileViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let group = profileGroup[indexPath.section]
//
//        if group != .profile{
//        switch indexPath.row{
//        case 0:
//
//            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
//            let editController = storyboard.instantiateViewController(withIdentifier: "edit") as! EditProfileViewController
//            show(editController, sender: self)
//        case 1:
//            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
//            let editController = storyboard.instantiateViewController(withIdentifier: "about") as! AboutViewController
//            show(editController, sender: self)
//        case 2:
//            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
//            let editController = storyboard.instantiateViewController(withIdentifier: "setting") as! SettingViewController
//            show(editController, sender: self)
//
//        case 3:
//           logOut()
//
//        default:
//            break
//
//
//        }
