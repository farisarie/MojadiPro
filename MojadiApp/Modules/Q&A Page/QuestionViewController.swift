//
//  QuestionViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 08/05/22.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Q&A"
        view.backgroundColor = UIColor(hex: "16171D")
        tableView.register(UINib(nibName: "QuestionViewCell", bundle: nil), forCellReuseIdentifier: "question_cell")
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        viewControllerSetup()
    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }

}
extension QuestionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "question_cell", for: indexPath) as! QuestionViewCell
        cell.questionDate.text = "03/03/2022 12:21 PM"
        cell.profileName.text = "Leonardo Jhon Doe"
        cell.questionLabel.text = "Apa perbedaan simple past tense & simple present tense dan bagaimana memberikan tanggapan terhadap iklim bumi yang semakin dirusak oleh penghuni bumi"
        cell.qtyLabel.text = "0 response"
        cell.profileImg.image = UIImage(named: "question")
        
        return cell
    }
}

extension UIViewController {
    
    func showQuestionPage(){
        let storyboard = UIStoryboard(name: "Question", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "question") as! QuestionViewController
   
     //    present(viewController, animated: true, completion: nil)
        viewController.hidesBottomBarWhenPushed = true
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
