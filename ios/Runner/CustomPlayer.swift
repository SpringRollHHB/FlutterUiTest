//
//  CustomPlayer.swift
//  Runner
//
//  Created by 韩闯 on 2024/9/3.
//

import Foundation
import AVKit

class CustomPlayer: UIView {
    var playerChannel : FlutterMethodChannel?
    var playerButton : UIButton?
    let playerContentView = UIView()
    let progressSlider = UISlider()
    
    
    public var url: String = ""
    public var loopEnable: Bool = true
    public var videoMode: AVLayerVideoGravity = .resizeAspect {
        didSet {
            playerLayer?.videoGravity = videoMode
        }
    }
    public var isPlaying: Bool {
        get {
            if (player?.currentItem?.status == .readyToPlay && self.player?.rate != 0) {
                return true
            }
            return false
        }
    }
    public var mute: Bool = false {
        didSet {
            player?.isMuted = mute
        }
    }
    private var item: AVPlayerItem?
    private var playerLayer: AVPlayerLayer?
    private var player: AVPlayer?
    
    
    private var addKVO: Bool = false
    private var timeObserver: Any?
    
    init(frame: CGRect,url:String,messenger:FlutterBinaryMessenger?) {
        super.init(frame: frame)
        self.playerChannel = FlutterMethodChannel(name: "swift/player/channel",
                                                 binaryMessenger: messenger!)
        self.playerChannel!.setMethodCallHandler({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              
            })
        self.url = url
        createSubviews()
        addVideoKVO()
        play()
    }
    
    public func play() {
        player?.play()
    }
    
    public func pause() {
        player?.pause()
    }
    
    public func play(with progress: CGFloat) {
        let currentTime = progress * CMTimeGetSeconds(player?.currentItem?.asset.duration ?? CMTime())
        item?.seek(to: CMTime(value: CMTimeValue(currentTime), timescale: CMTimeScale(1.0)), toleranceBefore: .zero, toleranceAfter: .zero)
    }
    
    public func stopPlayer() {
        if (addKVO) {
            addKVO = false
            item?.removeObserver(self, forKeyPath: "status")
        }
        if let observer = timeObserver {
            player?.removeTimeObserver(observer)
        }
        NotificationCenter.default.removeObserver(self)
        
        item = nil
        player = nil
        playerLayer = nil
    }
    
    func addVideoKVO() {
        addKVO = true
        item?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
    }
    
    @objc
    func onPlaybackFinished() {
        if loopEnable {
            if (item != nil) {
                item?.seek(to: .zero)
                player?.play()
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if let playerItem = object as? AVPlayerItem, let status = player?.currentItem?.status {
                   switch status {
                   case.failed:
                       if let error = playerItem.error {
                           print("播放错误：\(error.localizedDescription)")
                       }
                   case.readyToPlay:
                       print("视频准备好播放，可以开始播放")
                       player?.play()
                       playerButton?.isSelected = isPlaying
                       if let playerItem = player?.currentItem {
                           let asset = playerItem.asset
                           let tracks = asset.tracks(withMediaType:.video)
                           let videoTrack = tracks.first!
                           let size = videoTrack.naturalSize
                           var w = self.frame.width
                           var h = self.frame.height - 100
                           if(size.width >= size.height){
                               h = size.height / size.width * w
                           } else {
                               w = h * size.width / size.height
                           }
                           
                           self.playerContentView.frame = CGRect(x: 0, y: (self.frame.height - h)/2 , width: w, height: h)
                           self.playerLayer?.frame = self.playerContentView.bounds
                           self.progressSlider.frame = CGRect(x: 0, y: self.playerContentView.frame.maxY, width: self.frame.width, height: 2)
                           progressSlider.isHidden = false

                           print("视频原始宽度: \(size.width)，视频原始高度: \(size.height)")
                       }

                   default:
                       break
                   }
               }
           }
    }
    
    func createSubviews() {
        progressSlider.minimumValue = 0
        progressSlider.value = 0
        progressSlider.maximumValue = 1
        progressSlider.setThumbImage(UIImage(), for: .normal)
        progressSlider.frame = CGRect(x: 0, y: self.frame.height-120, width: self.frame.width, height: 10)
        progressSlider.isHidden = true
        playerContentView.frame = self.bounds;
        playerContentView.backgroundColor = .black
        self.addSubview(playerContentView)
        
        self.addSubview(progressSlider)
//        guard let videoURL = Bundle.main.url(forResource: "VID_20210118_231016", withExtension: "mp4") else {return}

        
        
        self.backgroundColor = .black
        
        let closeButton = UIButton(type: .custom)
        closeButton.frame = CGRect(x: 20, y: 50, width: 50, height: 30)
        closeButton.setTitle("关闭", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        self.addSubview(closeButton)
        
        let playerButton = UIButton(type: .custom)
        playerButton.frame = CGRect(x: self.frame.width/2, y: self.frame.height - 100, width: 50, height: 30)
        playerButton.setTitle("播放", for: .normal)
        playerButton.setTitle("暂停", for: .selected)
        playerButton.setTitleColor(.white, for: .normal)
        playerButton.addTarget(self, action: #selector(playerButtonAction), for: .touchUpInside)
        self.addSubview(playerButton)
        self.playerButton = playerButton
        
        
        guard let videoURL = URL(string: url) else { return }
        let item = AVPlayerItem(url: videoURL)
        let player = AVPlayer(playerItem: item)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspect
        playerLayer.contentsScale = UIScreen.main.scale

        
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [weak self] time in
            print(self?.playerLayer?.frame ?? CGRectZero)
            guard let self = self else { return }
            if let duration = self.player?.currentItem?.duration {
                let currentTime = time.seconds
                let totalTime = duration.seconds
                let progress = currentTime / totalTime
                self.progressSlider.value = Float(progress)
                print("播放进度：\(progress * 100)%")
            }
        })
        self.playerContentView.layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onPlaybackFinished), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        self.item = item
        self.player = player
        self.playerLayer = playerLayer
    }
    
    @objc func playerButtonAction(){
        if(isPlaying){
            pause()
        }else{
            play()
        }
        playerButton?.isSelected = isPlaying
    }
    
    @objc func closeButtonAction(){
        stopPlayer()
        self.playerChannel?.invokeMethod("close", arguments: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
