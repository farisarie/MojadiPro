//
//  ModuleViewController.swift
//  Ngetest
//
//  Created by yoga arie on 29/03/22.
//

import UIKit

class ModuleViewController: UIViewController {
    var selectIndex = 0
    var progress = [Status]()
    var dataCourse = [Course]()
    var more : [Profile] = [
        Profile(name: "About instructure", image: "aboutt"),
        Profile(name: "Course certificate", image: "certificate"),
        Profile(name: "Share course", image: "share"),
        Profile(name: "Q&A", image: "qa"),
        Profile(name: "Download rangkuman", image: "download")]
    let screenWidth = UIScreen.main.bounds.width
    let lowestScreenWidth: CGFloat = 375.0
    @IBOutlet weak var mentorImg: UIButton!
    
    @IBOutlet weak var courseCollection: UICollectionView!
    @IBOutlet weak var learningCollection: UICollectionView!
    @IBOutlet weak var moduleCourse: UILabel!
    @IBOutlet weak var descModule: UILabel!
    @IBOutlet weak var ratingModule: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moduleImage: UIImageView!
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        
      
        courseCollection.register(UINib(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_course")
       
        courseCollection.dataSource = self
        courseCollection.delegate = self
//        moduleoptionviewcell
        learningCollection.dataSource = self
        learningCollection.delegate = self
        
        setupText()
        setupColor()
        learningCollection.backgroundColor = .clear
        dummyData()
        
        viewControllerSetup()
        learningCollection.register(UINib(nibName: "CourseViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_instructure")
        learningCollection.register(UINib(nibName: "WebinarViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_webinar")
        learningCollection.register(UINib(nibName: "MoreViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_more")
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    func dummyData(){
        
    //blm diselect
        let dummy2 = Status(count: 1, progressName: "E-Learning", select: true)
        let dummy3 = Status(count: 0, progressName: "Webinar", select: false)
        let dummy4 = Status(count: 3, progressName: "More", select: false)
        
        
     
        progress.append(dummy2)
        progress.append(dummy3)
        progress.append(dummy4)
    }
    
    @IBAction func showProfile(_ sender: Any) {
        showInstructorProfileController()
    }
    func setupText(){
        if #available(iOS 13.0, *) {
            mentorImg.setImage(UIImage(named: "teacher"), for: .normal)
      
        } else {
            // Fallback on earlier versions
        }
    mentorImg.frame = CGRect(x: 0, y: 0, width: 49, height: 49)
 
        
        moduleCourse.text = "Bahasa Inggris"
        descModule.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam massa, neque pellentesque sed sollicitudin enim arcu sed. Fringilla pretium, metus, eget... Read More"
        ratingModule.text = "4.5"
        reviewsLabel.text = "167 reviews"
        roleLabel.text = "Mentor"
        nameLabel.text = "Hanna Olive"
        moduleImage.image = UIImage(named: "unsplash")
        
        
        
    }
    func setupColor(){
        moduleCourse.textColor = .white
        reviewsLabel.textColor = UIColor(hex: "666666")
        roleLabel.textColor = UIColor(hex: "666666")
        descModule.textColor = .white
        ratingModule.textColor = .white
        nameLabel.textColor = .white
    }
  

}
extension  ModuleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == courseCollection{
        return progress.count
        } else {
            if section == 1{
                return 3
            } else if section == 2{
                return 3
            } else {
                return more.count
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == courseCollection{
        let cell = courseCollection.dequeueReusableCell(withReuseIdentifier: "cell_course", for: indexPath) as! CourseCollectionViewCell


        let progressBar = progress[indexPath.row]

        cell.progressCourse.text = progressBar.progressName
        print(progressBar.select)


        if progressBar.select == true {

            cell.containerView.backgroundColor = UIColor(hex: "14B8A6")

            cell.progressCourse.textColor = UIColor.white
            cell.layer.backgroundColor = UIColor(hex: "B6E9E3").cgColor
//            cell.layer.borderColor = UIColor(hex: ConstantColor.green).cgColor
        } else {

            cell.containerView.backgroundColor = UIColor(hex: "B6E9E3")

            cell.progressCourse.textColor = UIColor(hex: "138D80")
//            cell.layer.borderColor = UIColor(hex: ConstantColor.gray).cgColor
            cell.layer.backgroundColor = UIColor(hex:"B6E9E3").cgColor
        }
        return cell
        }  else {
            if selectIndex == 0 {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_instructure", for: indexPath) as! CourseViewCell
                cell.imgCourse.image = UIImage(named: "menu_cat")
                cell.chapterLabel.text = "Chapter 1"
                cell.conditionImage.image = UIImage(named: "play")
                cell.nameCourse.text = "Course Overview"
                cell.pagesLabel.text = "1 Pages"
                cell.backgroundColor = .clear
                return cell
            } else if selectIndex == 1 {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_webinar", for: indexPath) as! WebinarViewCell
                cell.backgroundColor = .clear
                cell.date.text = "Sabtu, 2 April 2022"
                cell.overviewLabel.text = "Course Overview"
                cell.webinarLabel.text = "Webinar 1"
                return cell
            } else {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_more", for: indexPath) as! MoreViewCell
                let image = UIImage(named: more[indexPath.row].image)
                cell.moreImg.image = image
                cell.backgroundColor = .clear
                cell.moreLabel.text = more[indexPath.row].name
                return cell
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = screenWidth > lowestScreenWidth ? 110 : 105
        let width2 = screenWidth > lowestScreenWidth ? 345 : 330
        if collectionView == courseCollection{
        return CGSize(width: width, height: 40)
        }else {
            if selectIndex == 0 {
                return CGSize(width: width2, height: 90)
            } else if selectIndex == 1{
                return CGSize(width: width2, height: 170)
            } else if selectIndex == 2{
                return CGSize(width: 345, height: 35)
            }
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if collectionView == courseCollection{
        selectIndex = indexPath.row
            progress[indexPath.row].select = true
            
        
            
            for i in progress.indices {
                print(i)
                if i != indexPath.row{
                    progress[i].select = false
                    
                }
                
            }
       
        courseCollection.reloadData()
        learningCollection.reloadData()
        
        } else {
            switch selectIndex {
            case 0:
                showVideLCView()
            case 1:
             showVideLCView()
            case 2:
                showQuestionPage()
            default:
                break
            }
        }
    
    
}




    


}

extension UIViewController {
    
    func showModuleController(){
        let storyboard = UIStoryboard(name: "Module", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "module") as! ModuleViewController
        viewController.hidesBottomBarWhenPushed = true
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
