//
//  GuidePage.swift
//  Uber
//
//  Created by 黄启明 on 2016/10/27.
//  Copyright © 2016年 huatengIOT. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: BaseController {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    var fxLoca: FxLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayVideo()
        guidePageAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //启动页动画
    func guidePageAnimation() {
        var images: [UIImage] = []
        var image: UIImage
        var imageName: String
        for i in 0...67 {
            imageName = "logo-" + String(format: "%03d", i)
            //image = UIImage(named: imageName)!
            image = UIImage(contentsOfFile: Bundle.main.path(forResource: imageName, ofType: "png")!)!
            images.append(image)
        }
        backImage.animationImages = images
        backImage.animationRepeatCount = 1
        backImage.animationDuration = 5.0
        backImage.startAnimating()
        
        UIView.animate(withDuration: 0.7, delay: 5.0, options: .curveEaseOut, animations: {
            self.backView.alpha = 1.0
            self.player.play()
        }, completion: { finished in
            FxLog(message: "播放视频完成")
        })
    }
    //播放视频
    func initPlayVideo() {
        let path = Bundle.main.path(forResource: "welcome_video", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = backView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        backView.layer.insertSublayer(playerLayer, at: 0)
        backView.alpha = 0.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishedVideo(sender:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    func didFinishedVideo(sender: Notification) {
        let item = sender.object as! AVPlayerItem
        item.seek(to: kCMTimeZero)
        player.play()
    }
    //点击登录
    @IBAction func loginClick(_ sender: Any) {
        fxLoca = FxLocation()
        fxLoca?.startLocation()
    }
    
    
}
