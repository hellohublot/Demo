//
//  HTCourseCircleView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseCircleView: UITableViewCell, ReuseCell {

	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		flowLayout.scrollDirection = .horizontal
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.isScrollEnabled = false
        collectionView.layer.masksToBounds = false
        collectionView.layer.cornerRadius = 4
        collectionView.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        collectionView.layer.shadowOpacity = 0.4
        collectionView.layer.shadowRadius = 6
        collectionView.layer.shadowColor = UIColor.init(red: 0.858824, green: 0.858824, blue: 0.858824, alpha: 1).cgColor
		return collectionView
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
		contentView.addSubview(collectionView)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 8, bottom: 15, right: 8))
		}
	}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setHighlighted(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        collectionView.backgroundColor = UIColor.white
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? [HTCourseCircleModel], model != (collectionView.cellModelArray() as? [HTCourseCircleModel]) else {
			return
		}
		collectionView.setCellModelArray(model, proxy: self)
	}

}

extension HTCourseCircleView: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTCourseCircleCell.self
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.bounds.size.width / CGFloat(collectionView.cellModelArray().count)
		return CGSize.init(width: width, height: collectionView.bounds.size.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.zero
	}
	
}
