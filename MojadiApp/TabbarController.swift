//
//  TabbarController.swift
//  MojadiApp
//
//  Created by yoga arie on 07/04/22.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 15
        if #available(iOS 11.0, *) {
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    

    func setup(){
        tabBar.tintColor = UIColor(hex: "14B8A6")
        tabBar.unselectedItemTintColor = UIColor(hex: "8D8D8D")
    }

}

extension UIViewController{
    func navigateToHome() {
    let storyboard = UIStoryboard(name: "Tabbar", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "tabbar") //akses viewcontroller
  
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController = viewController
    }
}
