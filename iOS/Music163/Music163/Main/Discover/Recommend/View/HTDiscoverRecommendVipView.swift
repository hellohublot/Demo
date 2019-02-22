//
//  HTDiscoverRecommendVipCell.swift
//  Music163
//
//  Created by hublot on 2018/12/13.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift
import HTScrollPageView

class HTDiscoverRecommendVipView: UICollectionViewCell, ReuseCell {
	
	var modelArray = [HTDiscoverRecommendVipModel]()
	
	var backgroundIndex = -1
		
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: "PingFangSC-Medium", size: 17)
		label.textColor = UIColor.init(white: 1, alpha: 1)
		label.text = "会员专区"
		label.textAlignment = .center
		return label
	}()
	
	lazy var bannerView: HTScrollPageView = {
		let bannerView = HTScrollPageView.init(frame: CGRect.zero)
		return bannerView
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
		button.setTitleColor(UIColor.init(white: 1, alpha: 0.6), for: .normal)
		button.setTitle("进入会员中心", for: .normal)
        let right: CGFloat = 14 + 12
        button.setBackgroundImage(UIImage.init(named: "b177ba2114a50b7816103db2429e72b8")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: right), resizingMode: .stretch), for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: right, bottom: 8, right: right)
		return button
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		detailButton.layer.cornerRadius = detailButton.bounds.size.height / 2.0
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(titleLabel)
		addSubview(bannerView)
		addSubview(detailButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 30, left: 0, bottom: 0, right: 0))
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.top.equalTo(backgroundImageView).offset(17)
		}
		bannerView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.top.equalTo(titleLabel.snp.bottom).offset(17)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(bannerView.snp.bottom).offset(15)
			maker.bottom.equalTo(backgroundImageView).offset(-15)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? [HTDiscoverRecommendVipModel], model != modelArray else {
			return
		}
		modelArray = model
		bannerView.delegate = self
		bannerView.autoScrollTimeInterval = 0
		layoutIfNeeded()
		bannerView.reloadData()
	}

}

extension HTDiscoverRecommendVipView: HTScrollPageDelegate {
	
	func number(of pageView: HTScrollPageView!) -> Int {
		return modelArray.count
	}
	
	func buttonWillDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
		let model = modelArray[indexRow]
		let cell = button.subviews.last as? HTDiscoverRecommendVipCell ?? {
			let cell = HTDiscoverRecommendVipCell.init(frame: CGRect.zero)
			button.addSubview(cell)
			cell.snp.makeConstraints({ (maker) in
				maker.edges.equalTo(UIEdgeInsets.zero)
			})
			return cell
		}()
		cell.setModel(model, for: IndexPath.init(row: indexRow, section: 0))
	}
	
	func buttonDidDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
        
	}
	
	func scrollPageViewDidScroll(_ pageView: HTScrollPageView!, indexOffset: CGFloat) {
        reloadCellTransform(indexOffset)
		reloadBackgroundImageView(indexOffset)
	}
    
    func reloadCellTransform(_ indexOffset: CGFloat) {
        let buttonList: [UIButton?] = (bannerView.subviews.first?.subviews as? [UIButton]) ?? [UIButton?]()
        for button in buttonList {
            guard let button = button else {
                continue
            }
            let frame = button.convert(button.bounds, to: bannerView)
            var progress = 1 - abs(frame.origin.x / bannerView.bounds.size.width)
            progress = progress / 5 + 0.8 - 0.1
            let transform = CGAffineTransform.init(scaleX: progress, y: progress)
            button.subviews.first?.transform = transform
        }
    }
    
    func reloadBackgroundImageView(_ indexOffset: CGFloat) {
        var index = Int(round(indexOffset))
        if index >= modelArray.count {
            index = 0
        }
        guard index != backgroundIndex else {
            return
        }
        backgroundIndex = index
        let model = modelArray[index]
        var duration = 0.15
        if backgroundImageView.image == nil {
            duration = 0
        }
        UIView.animate(withDuration: duration, animations: {
            self.backgroundImageView.alpha = 0
        }) { (finished) in
            self.backgroundImageView.image = UIImage.init(named: model.selectedImage ?? "")
            UIView.animate(withDuration: duration, animations: {
                self.backgroundImageView.alpha = 1
            }, completion: nil)
        }
    }
	
}
