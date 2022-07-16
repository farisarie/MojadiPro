//
//  RateViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 06/05/22.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var rateComment: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var rate : [Categories] = [
        Categories(typeCourse: "Video yang berkualitas dan mudah di pahami"),
        Categories(typeCourse: "Fitur Video Expert sangat membantu saya mengenal lebih dalam mengenai profesi yang saya minati")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Rate MojadiPro"
        view.backgroundColor = UIColor(hex: "16171D")
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "RateViewCell", bundle: nil), forCellReuseIdentifier: "rate_cell")
        tableView.dataSource = self
        rateComment.attributedPlaceholder = NSAttributedString(string: "Tulis Jawaban", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "8D8D8D")])
        // Do any additional setup after loading the view.
    }
    

   
}

extension RateViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rate_cell", for: indexPath) as! RateViewCell
        if #available(iOS 13.0, *) {
            cell.imgRate.image = UIImage(systemName: "circlebadge.fill")
        } else {
            // Fallback on earlier versions
        }
        cell.nameRate.text = "Sava Alya Andini"
        cell.descRate.text = rate[indexPath.row].typeCourse
        cell.starRate.image = UIImage(named: "stars")
        return cell
    }
    
    
}


extension UIViewController{
    func ShowRateViewController() {
    let storyboard = UIStoryboard(name: "Rate", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "rate") as! RateViewController
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    }
