//
//  VideoLCViewController.swift
//  MojadiApp
//
//  Created by Yafi Cahyono Adi on 22/04/22.
//

import UIKit
import AVKit
import AVFoundation

class VideoLCViewController: UIViewController {
    @IBOutlet weak var vidPlayer: UIView!
    
    @IBOutlet weak var sendBtn: UIImageView!
    @IBOutlet weak var ansQuiz: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var ContainerVidLC: UIView!
    @IBOutlet weak var VidTitleCourse: UILabel!
    
    @IBOutlet weak var customControl: UIView!
    var isVideoPlaying = false
    
    private var player: AVPlayer!
    private var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Chapter 1"
        customControl.layer.masksToBounds = false
        customControl.layer.cornerRadius = 20
        if #available(iOS 11.0, *) {
            customControl.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        
        vidPlayer.layer.masksToBounds = true
        vidPlayer.layer.cornerRadius = 20

        ContainerVidLC.layer.masksToBounds = true
        ContainerVidLC.layer.cornerRadius = 5.0
        ContainerVidLC.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        ContainerVidLC.layer.borderWidth = 1
        ansQuiz.backgroundColor = .clear
        ansQuiz.attributedPlaceholder = NSAttributedString(string: "Tulis Jawaban", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "8D8D8D")])
        videoPlayer()
        
    }
    
    func videoPlayer() {
        let url = URL(string: "https://mojadi-public.s3-ap-southeast-1.amazonaws.com/videos/1647947115428Fitur-Vid-Sharing.mp4")!
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        vidPlayer.layer.addSublayer(playerLayer)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = vidPlayer.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != vidPlayer {
            customControl.isHidden = true
        }else{
            customControl.isHidden = false
        }
    }
    
    @IBAction func playpauseBtn(_ sender: UIButton) {
        if isVideoPlaying{
            player.pause()
            sender.setImage(UIImage(named: "playbtn"), for: .normal)
        }else {
            player.play()
            sender.setImage(UIImage(named: "pausebtn"), for: .normal)
        }
        isVideoPlaying = !isVideoPlaying
    }
    
    @IBAction func fullscreenBtn(_ sender: Any) {
        let controller = AVPlayerViewController()
        controller.player = player
        
        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            self.player.play()
        }
    }
//    @IBAction func forwardBtn(_ sender: Any) {
//
//    }
//
//    @IBAction func backwardBtn(_ sender: Any) {
//
//    }
}
extension UIViewController {
    
    func showVideLCView(){
        let storyboard = UIStoryboard(name: "VideoLearningCourse", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoursePlayer") as! VideoLCViewController
   
     //    present(viewController, animated: true, completion: nil)
        viewController.hidesBottomBarWhenPushed = true
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
