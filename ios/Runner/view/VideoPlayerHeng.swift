

import UIKit
import AVFoundation

class VideoPlayerHeng: UIViewController {
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private let playPauseButton = UIButton()
    private let progressView = UIProgressView(progressViewStyle: .default)
    private let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置视图控制器的背景颜色为黑色
        view.backgroundColor = UIColor.black

        setupVideoPlayer()
        setupControls()
        addConstraints()

        // 设置定时器更新进度条
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }

    private func setupVideoPlayer() {
        guard let videoURL = Bundle.main.url(forResource: "letmedownslowly", withExtension: "mp4", subdirectory: "videos") else {
            print("Invalid video URL")
            return
        }

        // 初始化 AVPlayer
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        playerLayer?.videoGravity = .resizeAspect
        if let playerLayer = playerLayer {
            view.layer.addSublayer(playerLayer)
        }

        // 播放视频
        player?.play()

        // 监听播放状态
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }

    private func setupControls() {
        // 设置播放/暂停按钮
        playPauseButton.setImage(UIImage(named: "video_start_playing"), for: .normal)
        playPauseButton.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playPauseButton)

        // 设置进度条
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.white.withAlphaComponent(0.5)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)

        // 设置返回按钮
        backButton.setImage(UIImage(named: "video_back"), for: .normal)
        backButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
    }

    private func addConstraints() {
        // 布局控件
        NSLayoutConstraint.activate([
            // 返回按钮
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),

            // 播放/暂停按钮
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -33),
            playPauseButton.widthAnchor.constraint(equalToConstant: 48),
            playPauseButton.heightAnchor.constraint(equalToConstant: 48),

            // 进度条
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressView.bottomAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: -10)
        ])
    }

    @objc private func togglePlayPause() {
        if player?.rate == 0 {
            player?.play()
            playPauseButton.setImage(UIImage(named: "video_start_playing"), for: .normal)
        } else {
            player?.pause()
            playPauseButton.setImage(UIImage(named: "video_player_stop"), for: .normal)
        }
    }

    @objc private func updateProgress() {
        guard let player = player else { return }
        let progress = Float(player.currentTime().seconds / player.currentItem!.duration.seconds)
        progressView.progress = progress
    }

    @objc private func didFinishPlaying() {
        // 视频播放完成后的处理逻辑
        player?.seek(to: .zero)
        player?.play()
    }

    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

