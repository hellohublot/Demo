//
//  HTVideoContentController.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift
import AVFoundation

class HTVideoContentController: UIViewController {
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	var playerLayer: CALayer?
	
	lazy var tableView: UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero)
		tableView.backgroundColor = UIColor.clear
		tableView.separatorStyle = .none
		return tableView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource() {
		
	}
	
	func initInterface() {
		view.addSubview(tableView)
		if #available(iOS 11.0, *) {
			tableView.contentInsetAdjustmentBehavior = .never
		} else {
			automaticallyAdjustsScrollViewInsets = false
		}
		tableView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
        tableView.contentInset = UIEdgeInsets.init(top: HTVideoNavigationBar.navigationBarHeight, left: 0, bottom: HTStatic.tabbarHeight, right: 0)
	}
	
	func reloadModelArrayWithType(_ type: HTVideoPageType?) {
		DispatchQueue.global(qos: .background).async {
			let modelArray = HTVideoContentModel.packModelArray()
			DispatchQueue.main.async {
				self.tableView.setCellModelArray(modelArray, proxy: self)
				self.tableView.reloadData()
			}
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		HTVideoPlayer.share.rate = 0
	}

}

extension HTVideoContentController: TableViewThrough {

	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		if decelerate == false {
			scrollViewDidEndDecelerating(scrollView)
		}
	}

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		var visibleIndexCellList = [IndexPath: UITableViewCell]()
		for indexPath in (tableView.indexPathsForVisibleRows ?? [IndexPath]()) {
			if let cell = tableView.cellForRow(at: indexPath), tableView.bounds.contains(cell.frame) {
				visibleIndexCellList[indexPath] = cell
			}
		}
		guard let willPlayIndexCell = visibleIndexCellList.first else {
			return
		}
		guard let willPlayModel = tableView.cellModelArray()[willPlayIndexCell.key.row] as? HTVideoContentModel,
			let willPlayCell = willPlayIndexCell.value as? HTVideoContentCell else {
				return
		}

		try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [.mixWithOthers, .defaultToSpeaker])
		try? AVAudioSession.sharedInstance().setActive(true)

		HTVideoPlayer.share.url = URL.init(string: willPlayModel.videoURL ?? "")
		HTVideoPlayer.share.rate = 1
		HTVideoPlayer.share.player.volume = 0
		
		NotificationCenter.default.removeObserver(self)
		NotificationCenter.default.addObserver(self, selector: #selector(videoPlayerItemDidEndPlay), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: HTVideoPlayer.share.player.currentItem)

		let playerLayer = self.playerLayer ?? {
			let playerLayer = AVPlayerLayer.init(player: HTVideoPlayer.share.player)
			playerLayer.videoGravity = .resizeAspectFill
			self.playerLayer = playerLayer
			return playerLayer
		}()
		willPlayCell.playerView.layer.addSublayer(playerLayer)
		playerLayer.frame = willPlayCell.playerView.bounds.insetBy(dx: -3, dy: 0)
	}
	
	@objc func videoPlayerItemDidEndPlay(_ notification: Notification) {
		guard let item = notification.object as? AVPlayerItem, item == HTVideoPlayer.share.player.currentItem else {
			return
		}
		HTVideoPlayer.share.rate = 0
		HTVideoPlayer.share.seekTo(0) { (finished) in
			HTVideoPlayer.share.rate = 1
		}
	}

	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTVideoContentCell.self
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return reuseViewNumberOfSections(in: tableView)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reuseView(tableView, numberOfRowsInSection: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 310
	}
	
}
