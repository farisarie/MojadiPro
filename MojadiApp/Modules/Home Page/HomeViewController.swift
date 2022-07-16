//
//  HomeViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 05/04/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController{

    var category: [Datum] = []
    var popular: [Popular]?
    var comingSoon: [ComingSoon] = []
    var insight: [Insight] = []
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
//    var popular: [Popular] = [
//        Popular(courseTitle: "Intro to Entrepreneurship", courseImage: "popular", courseTeacher: "Stephen Fox", ratingLabel: "4.5"),
//        Popular(courseTitle: "Intro to Marketing", courseImage: "popular", courseTeacher: "Stephen Fox", ratingLabel: "2.1")
//    ]
    
    var insightt: [Insightt] = [
        Insightt(imageInsight: "insight", title: "How to Formulate a Successful Business Strategy", type: "Free E-Book")
    ]
    
    var comingSooon: [Popularr] = [
        Popularr(courseTitle: "English For Business - Batch 2", courseImage: "guys", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ratingLabel: "2.2"),
        Popularr(courseTitle: "English For Business - Batch 3", courseImage: "gurl", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ratingLabel: "2.3")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        // Do any additional setup after loading the view.
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ComingSoonViewCell", bundle: nil), forCellReuseIdentifier: "soonCell")
        tableView.register(UINib(nibName: "InsightViewCell", bundle: nil), forCellReuseIdentifier: "insightCell")
        signInSetup()
            
        if #available(iOS 13.0, *) {
            searchController.searchTextField.backgroundColor = .white
            searchController.searchTextField.borderStyle = .roundedRect
            searchController.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Searching for anything...", attributes: [NSAttributedString.Key.backgroundColor:UIColor.clear,
                NSAttributedString.Key.strokeColor:UIColor(hex: "A1A1AA"),
                NSAttributedString.Key.foregroundColor:UIColor(hex: "A1A1AA")])
        } else {
            // Fallback on earlier versions
        }  //adapt the color here.
            
        let name = UserDefaults.standard.string(forKey: "nameLogin")
        labelName.text = "Hello, \(name ?? "")"
        loadCategory()
       loadPopular()
        loadComingSoon()
        loadInsight()
    }
    

   
    func signInSetup(){
        if SessionManager.isLogin() {
            signInBtn.setImage(UIImage(named: "notifHome"), for: .normal)
            
        } else {
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.borderColor = UIColor(hex: "1AE4CE").cgColor
        signInBtn.layer.cornerRadius = 14
        signInBtn.layer.masksToBounds = false
        }
    }
    @objc func allButtonTapped(_ sender: Any){
        showSoonController()
    }
    @objc func seeAllButtonTapped(_ sender: Any){
        showPopularController()
    }
    
    func loadCategory(){
        HomeProviders.shared.loadCategory { (result) in
            switch result{
            case .success(let data):
                self.category = data
                self.tableView.reloadData()
               
                
            case .failure(let error):
                self.presentAlert(title: "Error!", message: error.localizedDescription) { _ in
                    
                }
            }
        }
    }
    
    func loadPopular(){
        HomeProviders.shared.loadPopular { (result) in
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
    func loadComingSoon(){
        HomeProviders.shared.loadComingSoon { (result) in
            switch result{
            case .success(let data):
                self.comingSoon = data
                self.tableView.reloadData()
                
            case .failure(let error):
                self.presentAlert(title: "Error!", message: error.localizedDescription) { _ in
                    
                }
            }
        }
    }
    func loadInsight(){
        HomeProviders.shared.loadInsight { (result) in
            switch result{
            case .success(let data):
                self.insight = data
                self.tableView.reloadData()
                
            case .failure(let error):
                self.presentAlert(title: "Error", message: error.localizedDescription) { _ in
                    
                }
            }
        }
    }

}

@available(iOS 13.0, *)
extension HomeViewController: UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return comingSoon.count
        case 3:
            return insight.count
        default:
            return 0
     
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "category_cell", for: indexPath) as! CategoriesViewCell
            cell.collectionView.tag = 99
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.reloadData()
      
        return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "popular_cell", for: indexPath) as! PopularTableViewCell
            cell.populerCollection.tag = 100
            cell.populerCollection.dataSource = self
            cell.populerCollection.delegate = self
            cell.populerCollection.reloadData()
            cell.popularCourse.text = "Popular Course"
            cell.allButton.addTarget(self, action: #selector(self.seeAllButtonTapped(_:)), for: .touchUpInside)
            cell.allButton.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
            cell.allButton.titleLabel?.textColor = UIColor(hex: "138D80")
            cell.populerCollection.reloadData()
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "soonCell", for: indexPath) as! ComingSoonViewCell
            

            let coming = comingSoon[indexPath.row]
            cell.soonDesc.text = coming.datumDescription
            cell.soonImage.kf.setImage(with: URL(string: coming.cover))
            cell.soonTitle.text = coming.name
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "insightCell", for: indexPath) as! InsightViewCell
            let insighth = insight[indexPath.row]
            cell.insightImg.kf.setImage(with: URL(string: insighth.coverInsight))
            cell.titleLabel.text = insighth.titleInsight
            cell.typeLabel.text = "Free Book"
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
        
    
}


@available(iOS 13.0, *)
extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 99{
            return category.count
        } else if collectionView.tag == 100{
            return popular?.count ?? 0
       
            
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 99{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catcoll_cell", for: indexPath) as! CatCollectionCell
            let categori = category[indexPath.row]
            cell.nameLabel.text = categori.categoryName
          
        return cell
            
        }else if collectionView.tag == 100{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popular_collection_cell", for: indexPath) as! PopularViewCell
           
            let populer = popular![indexPath.row]
            cell.imageCourse.kf.setImage(with: URL(string: populer.photoURL))
            cell.titleCourse.text = populer.name
            cell.teacherCourse.text = populer.expertName
          
            return cell
        }
      
            return UICollectionViewCell()

        
    }
    
    
}

@available(iOS 13.0, *)
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 99{
        return CGSize(width: 120, height: 27)
        } else{
            return CGSize(width: 195, height: 216)
        }
            return CGSize(width: 0, height: 0)
    
    
        
    
}
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView.tag == 100{
//            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//    }
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 100{
            return 20
        }
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 100{
            return 20
        }
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 100{
            if let detail = popular?[indexPath.row]{
                showDetailLearningController(detail)
            }
        }
    }
}

@available(iOS 13.0, *)
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2{
            let view = UIView(frame: .zero)
            view.backgroundColor = .clear
            
            let label = UILabel(frame: .zero)
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.text = "Coming Soon"
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                
            ])
            
            let button = UIButton(frame: .zero)
            
            var seeAll = [NSAttributedString.Key : Any]()
            seeAll = [
                .font : UIFont(name: "Nunito-Regular", size: 14),
                .foregroundColor : UIColor(hex: "14B8A6"),
                .backgroundColor : UIColor.clear
            ]
            
            let seeAllString = "See all"
            let seeAllAttString = NSAttributedString(string: seeAllString, attributes: seeAll)
            button.setAttributedTitle(seeAllAttString, for: .normal)
            button.backgroundColor = UIColor.clear
            
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
            ])
            button.addTarget(self, action: #selector(self.allButtonTapped(_:)), for: .touchUpInside)
            return view
        } else if section == 3 {
            let view = UIView(frame: .zero)
            view.backgroundColor = .clear
            
            let label = UILabel(frame: .zero)
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.text = "Industry Insight"
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                
            ])
            return view
    }
        else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2{
            return 20 // tinggi view di set 56
        }
        else if section == 3{
            return 20
        }
        else {
            return 0.0001
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
        return 20
        } else {
            return 10
        }
    
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if let detail = popular?[indexPath.row]{
                showDetailLearningController(detail)
            }
        case 1:
            if let detail = popular?[indexPath.row]{
                showDetailLearningController(detail)
            }
        case 2:
            if let detail = popular?[indexPath.row]{
                showDetailLearningController(detail)
            }
        case 3:
            if let detail = popular?[indexPath.row]{
                showDetailLearningController(detail)
            }
        default:
            break
        }
    }

}

@available(iOS 13.0, *)
extension HomeViewController: TableViewCellDelegate{
    func didTapButton() {
        showInsightController()
    }
}


