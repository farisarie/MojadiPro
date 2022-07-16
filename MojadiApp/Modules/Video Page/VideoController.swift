//
//  ViewController.swift
//  Video
//
//  Created by yoga arie on 19/04/22.
//

import AVKit
import UIKit
import AVFoundation

class VideoController: UIViewController {
   
    
 
    @IBOutlet weak var seeAllBtn: UIButton!
    @IBOutlet weak var fullScreen: UIButton!
    @IBOutlet weak var barView: UIViewExtensions!
    @IBOutlet weak var answerTxtField: UITextField!
    @IBOutlet weak var rewindButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    let videoPlayerView = UIView()
    var player: AVPlayer?
    var timer: Timer?

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var commentBar: UIView!
    @IBOutlet weak var questionBox: UIView!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var courseQuestion: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
 
    var timeObserver: Any?
    override func viewDidLoad() {
        super.viewDidLoad()
        commentSetting()
        buttonCustom()
        title = "Chapter 1"
        view.backgroundColor = UIColor(hex: "16171D")
        view.addSubview(videoPlayerView)
        videoPlayerView.layer.cornerRadius = 18
        videoPlayerView.layer.masksToBounds = true
        videoPlayerView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                videoPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                videoPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                videoPlayerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                videoPlayerView.heightAnchor.constraint(equalToConstant: 215)
                
                
            ])
        } else {
            // Fallback on earlier versions
        }
       
            
            }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupVideoPlayer()
        resetTimer()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleControls))
        view.addGestureRecognizer(tapGesture)
    
    }
    func buttonCustom(){
        var attributes = [NSAttributedString.Key : Any]()
        attributes = [
            .font : UIFont(name: "Nunito-Regular", size: 14),
            .foregroundColor : UIColor(hex: "138D80")
            
        ]
        let myString = "See All"
        let myAttrString = NSAttributedString(string: myString, attributes: attributes)
        seeAllBtn.setAttributedTitle(myAttrString, for: .normal)
        seeAllBtn.backgroundColor = .clear
    }
    func commentSetting(){
        self.hidesBottomBarWhenPushed = true
        answerTxtField.backgroundColor = .clear
        answerTxtField.attributedPlaceholder = NSAttributedString(string: "Tulis Jawaban", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "8D8D8D")])
        commentBar.backgroundColor = UIColor(hex: "363644")
        profileImg.image = UIImage(named: "prof")
        courseLabel.textColor = .white
        courseLabel.font = UIFont.systemFont(ofSize: 20)
        courseQuestion.textColor = .white
        courseQuestion.font = UIFont.systemFont(ofSize: 14)
        questionBox.backgroundColor = .clear
        questionBox.layer.cornerRadius = 14
        questionBox.layer.masksToBounds = true
        questionBox.layer.borderWidth = 1
        questionBox.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        commentBar.backgroundColor = UIColor(hex: "363644")
        
    }
    @IBAction func fullscreenTapped(_ sender: Any) {
        guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        else{
            return
        }
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true)
        var value  = UIInterfaceOrientation.landscapeRight.rawValue
        if UIApplication.shared.statusBarOrientation == .landscapeLeft || UIApplication.shared.statusBarOrientation == .landscapeRight{
           value = UIInterfaceOrientation.portrait.rawValue
        }

        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
        player.play()
        
        
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = player else {
            return
        }
        if !player.isPlaying{
            player.play()
            playPauseButton.setImage(UIImage(named: "play_circle_filled"), for: .normal)
        }else {
            playPauseButton.setImage(UIImage(named: "play_circle_filled"), for: .normal)
            player.pause()
        }
    }
   
    func setupVideoPlayer(){
        guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        else{
            return
        }
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
       
        playerLayer.frame = videoPlayerView.bounds
        videoPlayerView.layer.addSublayer(playerLayer)
        player?.play()
        view.sendSubviewToBack(videoPlayerView)

        
        let interval = CMTime(seconds: 0.01, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { elapsedTime in
         
        })
    }
    
   
        
    
    
    @IBAction func jumpBackward(_ sender: Any) {
        guard let currentTime = player?.currentTime() else { return }
           let currentTimeInSecondsMinus10 =  CMTimeGetSeconds(currentTime).advanced(by: -10)
           let seekTime = CMTime(value: CMTimeValue(currentTimeInSecondsMinus10), timescale: 1)
           player?.seek(to: seekTime)
    }
    
    @IBAction func jumpForward(_ sender: Any) {
        guard let currentTime = player?.currentTime() else { return }
            let currentTimeInSecondsPlus10 =  CMTimeGetSeconds(currentTime).advanced(by: 10)
            let seekTime = CMTime(value: CMTimeValue(currentTimeInSecondsPlus10), timescale: 1)
            player?.seek(to: seekTime)
    }
    func resetTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(hideControls), userInfo: nil, repeats: false)
    }
    @objc func hideControls() {
        fullScreen.isHidden = true
        playPauseButton.isHidden = true
        barView.isHidden = true
        forwardButton.isHidden = true
        rewindButton.isHidden = true
    }
    @objc func toggleControls() {
        fullScreen.isHidden = !fullScreen.isHidden
        playPauseButton.isHidden = !playPauseButton.isHidden
        barView.isHidden = !barView.isHidden
        forwardButton.isHidden = !forwardButton.isHidden
        rewindButton.isHidden = !rewindButton.isHidden
  
        resetTimer()
    }
    
}
extension AVPlayer{
    var isPlaying: Bool{
        return rate != 0 && error == nil
    }
}

//var playPauseButton: PlayPauseButton!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }
//
//            let player = AVPlayer(url: url)
//            player.rate = 1 //auto play
//            let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            playerViewController.view.frame = playerFrame
//            playerViewController.showsPlaybackControls = false
//
//            addChild(playerViewController)
//            view.addSubview(playerViewController.view)
//            playerViewController.didMove(toParent: self)
//
//            playPauseButton = PlayPauseButton()
//            playPauseButton.avPlayer = player
//            view.addSubview(playPauseButton)
//            playPauseButton.setup(in: self)
//        }
//
//        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//            super.viewWillTransition(to: size, with: coordinator)
//
//            playPauseButton.updateUI()
//        }
    
extension UIViewController {
    
    func showVideoController(){
        let storyboard = UIStoryboard(name: "Video", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "video") as! VideoController
        viewController.hidesBottomBarWhenPushed = true
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
