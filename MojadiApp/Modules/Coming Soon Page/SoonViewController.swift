//
//  SoonViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 12/04/22.
//

import UIKit
import Kingfisher

class SoonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var comingSoon1: [Search]?
    var comingSoon: [Popularr] = [
        Popularr(courseTitle: "English For Business - Batch 2", courseImage: "guys", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ratingLabel: "1.0"),
        Popularr(courseTitle: "English For Business - Batch 3", courseImage: "gurl", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ratingLabel: "1.0")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Coming Soon"
        viewControllerSetup()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ComingSoonViewCell", bundle: nil), forCellReuseIdentifier: "soonCell")
        tableView.backgroundColor = .clear
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
      
        searchBar.delegate = self
       
    }
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func search(_ keyword: String){
        HomeProviders.shared.searchComingsoon(keyword) { (result) in
            switch result{
            case .success(let data):
                self.comingSoon1 = data
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension SoonViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(searchBar.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string = NSString(string: searchBar.text ?? "").replacingCharacters(in: range, with: text)
        if string.count >= 3 {
            search(string)
        }
        return true
    }
}



extension UIViewController {
    
    func showSoonController(){
        let storyboard = UIStoryboard(name: "ComingSoon", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "soon") as! SoonViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

extension SoonViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comingSoon1?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "soonCell", for: indexPath) as! ComingSoonViewCell
        let result = comingSoon1![indexPath.row]
        
        cell.soonDesc.text = result.datumDescription
        cell.soonImage.kf.setImage(with: URL(string: result.cover))
        cell.soonTitle.text = result.name
        return cell
    }
    
    
}

//extension UISearchBar {
//
//func change(textFont : UIFont?) {
//
//    for view : UIView in (self.subviews[0]).subviews {
//
//        if let textField = view as? UITextField {
//            textField.font = textFont
//        }
//    }
//} }
