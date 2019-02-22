//
//  HTMusicPlayerController.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import AVFoundation

class HTMusicPlayerController: UIViewController {

	static let share = HTMusicPlayerController()
	
	let rotateController = HTMusicPlayerRotateController()
	
	let lyricController = HTMusicPlayerLyricController()
	
	lazy var navigationBar: HTMusicPlayerNavigaionBar = {
		let navigationBar = HTMusicPlayerNavigaionBar.init(frame: CGRect.zero)
		navigationBar.backBarButton.whenTouch(inside: { [weak self] (_, _) in
			self?.backBarButtonItemAction()
		})
		return navigationBar
	}()
	
	lazy var backgroundView: HTMusicPlayerBackgroundView = {
		let backgroundView = HTMusicPlayerBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var controlBar: HTMusicPlayerControlBar = {
		let controlBar = HTMusicPlayerControlBar.init(frame: CGRect.zero)
		return controlBar
	}()

	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		view.isUserInteractionEnabled = false
		return view
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [.mixWithOthers, .defaultToSpeaker])
		try? AVAudioSession.sharedInstance().setActive(true)

		HTMusicPlayer.share.url = URL.init(fileURLWithPath: Bundle.main.path(forAuxiliaryExecutable: "1.mp3") ?? "")
		HTMusicPlayer.share.rate = 0
		NotificationCenter.default.addObserver(self, selector: #selector(musicPlayerDidEndPlay), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: HTMusicPlayer.share.player.currentItem)
	}
	
	func initInterface() {
		automaticallyAdjustsScrollViewInsets = false
		view.addSubview(backgroundView)
		view.addSubview(controlBar)
		view.addSubview(darkView)
		view.addSubview(navigationBar)
		backgroundView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		controlBar.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.height.equalTo(HTMusicPlayerControlBar.controlBarHeight)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		navigationBar.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(HTStatic.navigationHeight)
		}
		backgroundView.addSubview(rotateController.view)
		rotateController.view.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		backgroundView.addSubview(lyricController.view)
		lyricController.view.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		lyricController.view.alpha = 0
		backgroundView.whenTouch(inside: { [weak self] (_, _) in
			UIView.animate(withDuration: 0.15, animations: {
				self?.rotateController.view.alpha = 1 - (self?.rotateController.view.alpha ?? 1)
				self?.lyricController.view.alpha = 1 - (self?.lyricController.view.alpha ?? 1)
			})
		}, receive: nil)
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	@objc func backBarButtonItemAction() {
		navigationController?.popViewController(animated: true)
	}
	
	func switchTabbarPlayerButton(_ hidden: Bool) {
		UIView.animate(withDuration: 0.2) {
			HTTabbarController.playerButton.alpha = hidden ? 0 : 1
		}
	}

	@objc func musicPlayerDidEndPlay(_ notification: Notification?) {
		guard let item = notification?.object as? AVPlayerItem, item == HTMusicPlayer.share.player.currentItem else {
			return
		}
		HTMusicPlayer.share.rate = 0
		HTMusicPlayer.share.seekTo(0) { (finished) in
			HTMusicPlayer.share.rate = 1
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		switchTabbarPlayerButton(true)
		navigationController?.navigationBar.isHidden = true
		rt_disableInteractivePop = false
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		switchTabbarPlayerButton(false)
		tabBarItem.imageInsets = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
	}

}
