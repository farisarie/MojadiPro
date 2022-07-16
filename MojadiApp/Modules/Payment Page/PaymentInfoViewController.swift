//
//  PaymentInfoViewController.swift
//  Ngetest
//
//  Created by yoga arie on 20/03/22.
//

import UIKit

class PaymentInfoViewController: UIViewController {

    var paket = [Paket]()
    @IBOutlet weak var buyBtn: RoundedButton!
    
    @IBOutlet weak var paymentInfoTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentInfoTable.dataSource = self
        paymentInfoTable.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        initData()
        viewControllerSetup()
        let button = UIButton(type: .system)
            if #available(iOS 13.0, *) {
                button.setImage(UIImage(named: "Vector"), for: .normal)
                button.tintColor = UIColor(hex: "FFFFFF")
            } else {
                // Fallback on earlier versions
            }
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.addTarget(self, action: #selector(self.refreshButtonTapped(_:)), for: .touchUpInside)
        let barItem = UIBarButtonItem(customView:  button)
        navigationItem.rightBarButtonItem = barItem
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-SemiBold", size: 14),
            .foregroundColor : UIColor(hex: "FFFFFF"),
            .backgroundColor : UIColor(hex: "1AE4CE")
        ]
        let myString = "Buy"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        buyBtn.setAttributedTitle(myAttrString, for: .normal)
        buyBtn.backgroundColor = UIColor(hex: "1AE4CE")
        
    }
    @IBAction func buyButtonTapped(_ sender: Any) {
        navigateToPaymentDetail()
    }
    @objc func refreshButtonTapped(_ sender: Any){
        showHistoryController()
    }
    
    
    func initData(){
        let package1 = Paket(imgPaket: "cart1", pricePaket: "Rp 252.000,00", discountPaket: "Rp 279.999,00", namePaket: "Bahasa Inggris")
        let package2 = Paket(imgPaket: "cart2", pricePaket: "Rp 306.000,00", discountPaket: "Rp 360.000,00 ", namePaket: "Intro to Marketing")
        let package3 = Paket(imgPaket: "cart1", pricePaket: "Rp 562.500,00", discountPaket: "Rp 750.000,00 ", namePaket: "Intro to Creative")
        
        paket.append(package1)
        paket.append(package2)
        paket.append(package3)


    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(hex: "16171D")
        paymentInfoTable.backgroundColor = .clear
        
    }
    
}

extension PaymentInfoViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentInfoTable.dequeueReusableCell(withIdentifier: "paket_cell", for: indexPath) as! PaymentInfoViewCell
//        let image = UIImage(named: datas[indexPath.row].imgCategory)
//        cell.categoryImageCollection.image = image
//
//        cell.categoryNameCollection.text = datas[indexPath.row].nameCategory
//        cell.categoryNumberCollection.text = datas[indexPath.row].numberCategory
//        return cell
//        signUpLabel.textColor = .white
        let image = UIImage(named: paket[indexPath.row].imgPaket)
        cell.packageImg.image = image
        
        
        cell.packageName.text = paket[indexPath.row].namePaket
        cell.packageDiscount.text = paket[indexPath.row].discountPaket
        cell.packagePrice.text = paket[indexPath.row].pricePaket
        cell.checkBtn.tag = indexPath.row
        cell.checkBtn.addTarget(self, action: #selector(checkMarkButtonClicked(_:)), for: .touchUpInside)
        
         return cell
    }
    @objc func checkMarkButtonClicked(_ sender: UIButton){
     
        if sender.isSelected{
            sender.layer.borderWidth = 2
            sender.isSelected = false
           
            
            
        } else {
            sender.layer.borderWidth = 0
            sender.isSelected = true
        }
    }
    
    
}


    
    

