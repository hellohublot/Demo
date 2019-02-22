//
//  HTMusicPlayerLyricController.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMusicPlayerLyricController: UIViewController {

	lazy var volumeSlider: HTMusicPlayerLyricVolumeSlider = {
		let volumeSlider = HTMusicPlayerLyricVolumeSlider.init(frame: CGRect.zero)
		return volumeSlider
	}()

	lazy var gradientLayer: CALayer = {
		let gradientLayer = CAGradientLayer.init()
		gradientLayer.colors = [
			UIColor.init(white: 0, alpha: 0).cgColor,
			UIColor.init(white: 0, alpha: 0).cgColor,
			UIColor.init(white: 0, alpha: 1).cgColor,

			UIColor.init(white: 0, alpha: 1).cgColor,
			UIColor.init(white: 0, alpha: 0).cgColor,
			UIColor.init(white: 0, alpha: 0).cgColor
		]
		gradientLayer.locations = [0, 0.04, 0.14, 0.86, 0.96, 1]
		return gradientLayer
	}()

	lazy var gradientView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()

	lazy var tableView: UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
		let rect = CGRect.init(x: 0, y: 0, width: 0, height: 0.0001)
		tableView.tableFooterView = UIView.init(frame: rect)
		tableView.tableHeaderView = UIView.init(frame: rect)
		tableView.estimatedSectionFooterHeight = 0.0001
		tableView.estimatedSectionHeaderHeight = 0.0001
		tableView.backgroundColor = UIColor.clear
		tableView.separatorStyle = .none
		tableView.allowsSelection = false
		return tableView
	}()

	lazy var moreButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "f80d197b7b8b511dc0a58fbf3d92c2d8")
		button.setImage(image, for: .normal)
		return button
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTMusicPlayerLyricModel.packModelArray()
		tableView.setCellModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
		view.addSubview(volumeSlider)
		view.addSubview(gradientView)
		gradientView.addSubview(tableView)
		view.addSubview(gradientView)
		view.addSubview(moreButton)
		volumeSlider.snp.makeConstraints { (maker) in
			maker.top.equalTo(13 + HTStatic.navigationHeight)
			maker.left.equalTo(12)
			maker.right.equalTo(-13)
			maker.height.equalTo(20)
		}
		gradientView.snp.makeConstraints { (maker) in
			maker.top.equalTo(volumeSlider.snp.bottom)
			maker.bottom.equalTo(-HTMusicPlayerControlBar.controlBarHeight)
			maker.left.right.equalTo(0)
		}
		tableView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(gradientView)
		}
		moreButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.top.equalTo(tableView).offset(4)
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		gradientLayer.frame = gradientView.bounds
		gradientView.layer.mask = gradientLayer
	}

}

extension HTMusicPlayerLyricController: TableViewThrough {

	func scrollViewDidScroll(_ scrollView: UIScrollView) {

	}

	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTMusicPlayerLyricCell.self
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
		let model = tableView.cellModelArray()[indexPath.row] as? HTMusicPlayerLyricModel
		return model?.height ?? 0
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return tableView.bounds.size.height / 2.0
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return tableView.bounds.size.height / 2.0
	}

}
