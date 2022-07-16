//
//  OnboardingViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 04/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    var slide :[OnboardingSlide] = []
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        loadData()
        buttonColor()
    }
    func buttonColor(){
        nextBtn.setTitleColor(.white, for: .normal)
        skipBtn.backgroundColor = .clear
  
        if #available(iOS 11.0, *) {
            skipBtn.setTitleColor(UIColor(named: "5BAA6"), for: .normal)
        } else {
            skipBtn.setTitleColor(.cyan, for: .normal)
        }
    }
    
    func updatePage(_ page: Int){
        pageControl.currentPage = page
        nextBtn.setTitle(page == slide.count - 1 ? "Sign In" : "Next →", for: .normal)
        skipBtn.setTitle(page == slide.count - 1 ? "Browse" : "Skip", for: .normal)
        if page == 2 {
            skipBtn.layer.borderWidth = 1
            skipBtn.layer.borderColor = UIColor(hex: "1AE4CE").cgColor
            skipBtn.layer.cornerRadius = 15
            skipBtn.layer.masksToBounds = true
        } else {
            skipBtn.layer.borderWidth = 0
        }
    }
    
    func loadData(){
        var data1 = OnboardingSlide(title: "100+ EXPERTS", image: "page1", detail: "Learn various topics and skill sets fromour industry Experts." )
        var data2 = OnboardingSlide(title: "COMPREHENSIVE LEARNING", image: "page2", detail: "Experience a hybrid learning with our e-learning modules and live webinar")
        var data3 = OnboardingSlide(title: "START YOUR SUCCESS NOW", image: "page3", detail: "Upgrade your skills and career now,start exploring the many courses on offer.")
        slide.append(data1)
        slide.append(data2)
        slide.append(data3)
        updatePage(0)
    }
    
    func goToPage(_ page: Int){
        collectionView.scrollToItem(at: IndexPath(item: page, section: 0), at: .centeredHorizontally, animated: true)
        updatePage(page)
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        let toPage = min(slide.count - 1, pageControl.currentPage + 1)
        if toPage != pageControl.currentPage {
            goToPage(toPage)
        } else {
            navigateToLogin()
            }
        }
       
    @IBAction func skipBtnClicked(_ sender: Any) {
        let skipPage = min(slide.count - 1, pageControl.currentPage + 2)
        if pageControl.currentPage == slide.count - 1{
            navigateToHome()
        } else {
            pageControl.currentPage += 2
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            goToPage(skipPage)
            
        }

        
        
    }
    
    

   

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "on_cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        cell.slideTitleLabel.textColor = .white
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        updatePage(page)
        
    }
     
}
