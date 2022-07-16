//
//  TOSViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 05/05/22.
//

import UIKit

class TOSViewController: UIViewController {

    @IBOutlet weak var tosTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Terms Of Use"
        tosTextView.backgroundColor = .clear
        tosTextView.text = "These Terms of Use ('Terms') were last updated on May 20, 2021.\n\nUdemy’s mission is to improve lives through learning. We enable anyone anywhere to create and share educational content (instructors) and to access that educational content to learn (students). We consider our marketplace model the best way to offer valuable educational content to our users. We need rules to keep our platform and services safe for you, us, and our student and instructor community. These Terms apply to all your activities on the Udemy website, the Udemy mobile applications, our TV applications, our APIs, and other related services (“Services”).\n\nIf you publish a course on the Udemy platform, you must also agree to the Instructor Terms. We also provide details regarding our processing of personal data of our students and instructors in our Privacy Policy. If you are using Udemy as part of your employer’s Udemy Business learning and development program, you can consult our Udemy Business Privacy Statement.\n\nIf you live in the United States or Canada, by agreeing to these Terms, you agree to resolve disputes with Udemy through binding arbitration (with very limited exceptions, not in court), and you waive certain rights to participate in class actions, as detailed in the Dispute Resolution section.\n\nTable of Contents\n 1. Accounts\n 2. Content Enrollment and Lifetime Access\n 3. Payments, Credits, and Refunds\n 4. Content and Behavior Rules\n 5. Udemy’s Rights to Content You Post\n 6. Using Udemy at Your Own Risk\n 7. Udemy’s Rights\n 8. Subscription Terms\n 9. Miscellaneous Legal Terms\n 10. Dispute Resolution\n 11. Updating These Terms\n 12. How to Contact Us\n 1. Accounts\n You need an account for most activities on our platform. Keep your password somewhere safe, because you’re responsible for all activity associated with your account. If you suspect someone else is using your account, let us know by contacting our Support Team. You must have reached the age of consent for online services in your country to use Udemy. You need an account for most activities on our platform, including to purchase and access content or to submit content for publication. When setting up and maintaining your account, you must provide and continue to provide accurate and complete information, including a valid email address. You have complete responsibility for your account and everything that happens on your account, including for any harm or damage (to us or anyone else) caused by someone using your account without your permission. This means you need to be careful with your password. You may not transfer your account to someone else or use someone else’s account. If you contact us to request access to an account, we will not grant you such access unless you can provide us with the information that we need to prove you are the owner of that account. In the event of the death of a user, the account of that user will be closed."
        tosTextView.textColor = .white
    }
    



}

extension UIViewController{
    func termsOfService() {
    let storyboard = UIStoryboard(name: "TOS", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "tos") as! TOSViewController
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    }
