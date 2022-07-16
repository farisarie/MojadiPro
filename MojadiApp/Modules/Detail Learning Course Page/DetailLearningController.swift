//
//  DetailLearningController.swift
//  MojadiApp
//
//  Created by yoga arie on 20/05/22.
//

import UIKit
import Kingfisher

class DetailLearningController: UIViewController {
    
    var selectIndex = 0
    var idCourse : Int?
    
    var progress = [Status]()
    var detail : DataClass!
    
    var elearning = [Elearning]()
    var webinar = [Webinar]()
    
    var more : [Profile] = [
        Profile(name: "About instructure", image: "aboutt"),
        Profile(name: "Course certificate", image: "certificate"),
        Profile(name: "Share course", image: "share"),
        Profile(name: "Q&A", image: "qa"),
        Profile(name: "Download rangkuman", image: "download")]
    
    let screenWidth = UIScreen.main.bounds.width
    let lowestScreenWidth: CGFloat = 375.0
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var detailCollection: UICollectionView!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var titleCourse: UILabel!
    @IBOutlet weak var detailCourse: UILabel!
    @IBOutlet weak var ratingStar: UIImageView!
    @IBOutlet weak var ratingNumber: UILabel!
    @IBOutlet weak var totalParticipants: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var expertImg: UIButton!
    @IBOutlet weak var expertName: UILabel!
    @IBOutlet weak var expertTitle: UILabel!
    @IBOutlet weak var expertReviews: UILabel!
    
    @IBOutlet weak var learningCollection: UICollectionView!
    @IBOutlet weak var learningButton: UIButton!
    @IBOutlet weak var courseInfo: UILabel!
    
    var emptyBool = [Bool]()
    var selectArray = ["a", "b", "c", "d", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerSetup()
        
        learningCollection.backgroundColor = .clear
        view.backgroundColor = UIColor(hex: "16171D")
        detailCollection.register(UINib(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_option")
        learningCollection.register(UINib(nibName: "LearningViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_learning")
        learningCollection.register(UINib(nibName: "WebinarCell", bundle: nil), forCellWithReuseIdentifier: "cell_webinar")
        learningCollection.register(UINib(nibName: "ReviewViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_review")
        dummyData()
        loadData()
        setupButton()
        detailCollection.dataSource = self
        detailCollection.delegate = self
        learningCollection.dataSource = self
        learningCollection.delegate = self
       setupText()
        
        selectArray.forEach { _ in
            emptyBool.append(false)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func loadData(){
       

        DetailService.shared.loadDetail(idCourse ?? 0) { response in
            self.detail = response.data
            print("DETAILERROR\(self.detail)")
            

        } _: { _ in

        }
        
        DetailService.shared.loadElearning(idCourse ?? 0) { response in
            self.elearning = response.data
            self.learningCollection.reloadData()
            print("DETAILERROR\(self.detail)")

        } _: { _ in
            
        }
        
        DetailService.shared.loadWebinar(idCourse ?? 0) { (response) in
            self.webinar = response.data
            self.learningCollection.reloadData()
        } _: { _ in
            
        }

        
    }
    
    
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func dummyData(){
        let data1 = Status(count: 1, progressName: "E-Learning", select: true)
        let data2 = Status(count: 0, progressName: "Webinar", select: false)
        let data3 = Status(count: 3, progressName: "Review", select: false)
        
        progress.append(data1)
        progress.append(data2)
        progress.append(data3)
        
    }
    func setupText(){
        expertImg.setImage(UIImage(named: "teacher"), for: .normal)
        expertImg.frame = CGRect(x: 0, y: 0, width: 49, height: 49)
        expertName.text = "Oliver"
        expertTitle.text = "Mentor"
        expertReviews.text = "167 reviews"
        courseInfo.text = "......"
        expertName.textColor = .white
        expertTitle.textColor = .white
        expertReviews.textColor = .white
        courseInfo.textColor = .white
        titleCourse.text =  "Bahasa Inggris"
        detailCourse.text = "......."
        
//        courseImage.kf.setImage(with: URL(string: detail.photoURL))
        courseImage.layer.cornerRadius = 13
        courseImage.layer.masksToBounds = true
        courseImage.contentMode = .scaleAspectFill
//        bgImageView.kf.setImage(with: URL(string: detail.photoURL))
//        totalParticipants.text = "\(detail.currentParticipant) / \(detail.maximumParticipant) Participants"
        ratingNumber.textColor = .white
        coursePrice.text = "Rp.500.000,00"
    }
    func setupButton(){
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Montserrat-SemiBold", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Start Learning"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        learningButton.setAttributedTitle(myAttrString, for: .normal)
        learningButton.backgroundColor = UIColor(hex: "1AE4CE")
        learningButton.layer.cornerRadius = 21
        learningButton.layer.masksToBounds = true
    }
    
    func formatterRupiah(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
        let result = formatter.string(from: price as NSNumber) ?? ""
        return "Rp. \(result) ,00"
    }
  
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension DetailLearningController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailCollection {
        return progress.count
        } else {
            if selectIndex == 0 {
                return elearning.count
            } else if section == 1 {
                return 4
            } else {
                return 4
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailCollection {
        let cell = detailCollection.dequeueReusableCell(withReuseIdentifier: "cell_option", for: indexPath) as! CourseCollectionViewCell
        
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
        } else {
            if selectIndex == 0 {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_learning", for: indexPath) as! LearningViewCell
                
                print("count data \(elearning.count)")
                let elearningData = elearning[indexPath.row]
                cell.chapterLabel.text = elearningData.moduleTitle
                cell.overviewLabel.text = "Course Overview"
                cell.detailLabel.text = elearningData.moduleOverview
               
                cell.minimizeBtn.addTarget(self, action: #selector(self.minimizeButtonTapped(_:)), for: .touchUpInside)
                
                detailCollection.reloadData()
                cell.minimizeBtn.tag = indexPath.row
                
                cell.backgroundColor = .clear
                
                if emptyBool[indexPath.row] {
                    if #available(iOS 13.0, *) {
                        cell.minimizeBtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                    } else {
                        // Fallback on earlier versions
                    }
                } else {
                    if #available(iOS 13.0, *) {
                        cell.minimizeBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                
                return cell
            } else if selectIndex == 1 {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_webinar", for: indexPath) as! WebinarCell
                cell.backgroundColor = .clear
                let webinarParse = webinar[indexPath.row]
                cell.date.text = "Sabtu, 2 April 2022"
                
                
                cell.clock.text = "09.00 - 11.00 WIB"
                cell.overviewLabel.text = "Course Overview"
                cell.webinarLabel.text = webinarParse.title
                return cell
            } else {
                let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_review", for: indexPath) as! ReviewViewCell
                cell.starImg.image = UIImage(named: "stars-1")
                cell.imageLabel.image = UIImage(named: "ruth")
                cell.nameLabel.text = "Leonardo Jhon Doe"
                cell.rateNumber.text = "4.5"
                cell.reviewLabel.text = "Course ini benar benar membuat saya paham bahasa inggris, skill speakingku menjadi bertambah lancar dengan mengikuti course ini"
                
                return cell
            }
            }
        }
    
    
    @objc func minimizeButtonTapped(_ sender: UIButton){
        if emptyBool[sender.tag] {
            
            emptyBool[sender.tag] = false
            
        } else {
            emptyBool[sender.tag] = true
        }
        learningCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = screenWidth > lowestScreenWidth ? 110 : 105
        let width2 = screenWidth > lowestScreenWidth ? 345 : 320
        if collectionView == detailCollection {
        return CGSize(width: width, height: 40)
        } else {
            if selectIndex == 0 {
                if emptyBool[indexPath.row] {
                    return CGSize(width: width2, height: 190)
                } else {
                    return CGSize(width: width2, height: 110)
                }
                
            } else if selectIndex == 1 {
                return CGSize(width: width2, height: 137)
            } else {
                return CGSize(width: width2, height: 122)
            }
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == detailCollection{
        selectIndex = indexPath.row
            progress[indexPath.row].select = true
            
        
            
            for i in progress.indices {
                print(i)
                if i != indexPath.row{
                    progress[i].select = false
                    
                }
                
            }
        
        
        detailCollection.reloadData()
        learningCollection.reloadData()
    } else{
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

extension UIViewController{
    func showDetailLearningController(_ idCourses: Popular){
        let storyboard = UIStoryboard(name: "Detail Learning", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailLearningController
        viewController.hidesBottomBarWhenPushed = true
       
        viewController.idCourse = idCourses.id
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showDetailFromAllPopular(_ idCourse: AllPopular){
        let storyboard = UIStoryboard(name: "Detail Learning", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailLearningController
        viewController.hidesBottomBarWhenPushed = true
       
        viewController.idCourse = idCourse.id
        navigationController?.pushViewController(viewController, animated: true)
    }
}
