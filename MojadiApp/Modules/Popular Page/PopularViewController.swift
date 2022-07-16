//
//  PopularViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 12/04/22.
//

import UIKit
import Kingfisher

class PopularViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var popular: [AllPopular]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Popular Course"
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PopTableViewCell", bundle: nil), forCellReuseIdentifier: "cell_poppular")
        // Do any additional setup after loading the view.
        viewControllerSetup()
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = UIColor(hex: "292934")
            searchBar.searchTextField.borderStyle = .roundedRect
            searchBar.barTintColor = UIColor(hex: "16171D")
            searchBar.searchTextField.attributedPlaceholder =
            NSAttributedString.init(string: "Searching for anything...", attributes: [NSAttributedString.Key.backgroundColor:UIColor.clear,
                NSAttributedString.Key.strokeColor:UIColor(hex: "A1A1AA"),
                NSAttributedString.Key.foregroundColor:UIColor(hex: "A1A1AA")])
        } else {
            // Fallback on earlier versions
        }  //adapt the color here.
        loadPopular()
    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func loadPopular(){
        HomeProviders.shared.loadAllPopular { (result) in
            switch result{
            case .success(let data):
                self.popular = data
                self.tableView.reloadData()
                
            case .failure(let error):
                self.presentAlert(title: "Error!", message: error.localizedDescription) { _ in
                    
                }
            }
        }
    }
    

    

}

extension PopularViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popular?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_poppular", for: indexPath) as! PopTableViewCell
        
        let populer = popular![indexPath.row]
        
        cell.imageCourse.kf.setImage(with: URL(string: populer.photoURL))
        cell.titleCourse.text = populer.name
        cell.teacherCourse.text = populer.expertName
        cell.ratingLabel.text = String(populer.averageRate)
        return cell
    }
    
    
}

extension PopularViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detail = popular?[indexPath.row]{
            showDetailFromAllPopular(detail)
            }
        }
}

extension UIViewController {
    
    func showPopularController(){
        let storyboard = UIStoryboard(name: "Popular", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "rootPopular") as! PopularViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

