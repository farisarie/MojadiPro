//
//  InstructureViewController.swift
//  Ngetest
//
//  Created by yoga arie on 30/03/22.
//

import UIKit
enum  InstructorProfile{
    case detail
    case courses
}
var InstructorOption: [InstructorProfile] = [.courses, .detail]

class InstructureViewController: UIViewController {
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
  
    
    var selectIndex = 0
    var instructure: [Instructure] = [
        Instructure(titleCourse: "Bahasa Inggris", imgCourse: "instructuree", imgInstructure: "instructureProfile", priceCourse: "Cost : Rp200.000.00", deadlineDate: "Deadline : 3 March", rateCourse: "4.5")]
    var progress : [Status] = [
        Status(count: 1, progressName: "Detail", select: true),
        Status(count: 0, progressName: "Courses", select: false)


    ]

    @IBOutlet weak var learningCollection: UICollectionView!
    @IBOutlet weak var courseCollection: UICollectionView!
    @IBOutlet weak var participants: UILabel!
    @IBOutlet weak var courses: UILabel!
    @IBOutlet weak var instructorRating: UILabel!
    @IBOutlet weak var instructorName: UILabel!
    @IBOutlet weak var instructureImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.isHidden = false
        learningCollection.isHidden = true
        view.backgroundColor = UIColor(hex: "16171D")
        learningCollection.backgroundColor = .clear
        setup()
        viewControllerSetup()
        textColor()
        courseCollection.register(UINib(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_course")
        learningCollection.register(UINib(nibName: "InstructureViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_instructure")
//        tableProgress.dataSource = self
        courseCollection.dataSource = self
//        tableProgress.delegate = self
        courseCollection.delegate = self
        learningCollection.dataSource = self
        learningCollection.delegate = self
        detailView.backgroundColor = .clear
        labelView.backgroundColor = .clear
        detailLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra"
        detailLabel.textColor = .white
        detailLabel.sizeToFit()
    }
  

    func setup(){
        instructureImage.image = UIImage(named: "instructure")
        courses.text = "10 Courses"
        instructorName.text = "Hanna Olive"
        instructorRating.text = "4.2 Instructor Rating"
        participants.text = "150 Participants"
    }
    func textColor(){
        courses.textColor = .white
        instructorName.textColor = .white
        instructorRating.textColor = .white
        participants.textColor = .white

    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }



}

extension InstructureViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == courseCollection{
            return progress.count
        } else{
            
            return instructure.count
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
        } else {
            let cell = learningCollection.dequeueReusableCell(withReuseIdentifier: "cell_instructure", for: indexPath) as! InstructureViewCell
            let image = UIImage(named: instructure[indexPath.row].imgCourse)
            let profileImg = UIImage(named: instructure[indexPath.row].imgInstructure)
            let instructureProfile = UIImage(named: instructure[indexPath.row].imgCourse)
            
            cell.courseImage.image = instructureProfile
            cell.teacherImg.image = profileImg
            
            return cell
        }
    }
    
    
   


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if collectionView == courseCollection{
        selectIndex = indexPath.row
            progress[indexPath.row].select = true
        
        if indexPath.row == 0 {
            detailView.isHidden = false
            learningCollection.isHidden = true
        } else {
            detailView.isHidden = true
            learningCollection.isHidden = false
        }
    
        

            for i in progress.indices {
                print(i)
                if i != indexPath.row{
                    progress[i].select = false

                }

            }
        
        courseCollection.reloadData()
        }
    else {
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == courseCollection {
        return CGSize(width: 170, height: 40)
        } else {
            return CGSize(width: 350, height: 207)
        }
}

}


extension UIViewController {
    
    func showInstructorProfileController(){
        let storyboard = UIStoryboard(name: "Instructure", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "rootInstructure") as! InstructureViewController
        viewController.hidesBottomBarWhenPushed = true
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
