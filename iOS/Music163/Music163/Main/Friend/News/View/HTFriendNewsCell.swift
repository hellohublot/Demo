//
//  HTFriendNewsCell.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTFriendNewsCell: UITableViewCell, ReuseCell {
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var userTitleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.init(red: 0.28, green: 0.44, blue: 0.6, alpha: 1)
        return label
    }()
    
    lazy var fansCountLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12)
        return label
    }()
    
    lazy var userShareLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25)
        label.text = "分享单曲: "
        return label
    }()
    
    lazy var followUserButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8), for: .normal)
        button.setImage(UIImage.init(named: "08e4d55c8ae9bd43088ddf94bfd21577"), for: .normal)
        button.setBackgroundImage(UIImage.init(named: "a9d7bcd986389cdcaaaf3678fbf5c920"), for: .normal)
        button.setTitle("关注", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 8, bottom: 5, right: 8)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 0.996078, alpha: 0.45)
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    lazy var songBackgroundView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "66299796bdd6d544ad9e1e3bd4fcabd3")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var songPlayButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.setImage(UIImage.init(named: "bb6a027e75efe500fb109604c3a3e171")?.imageInsert(UIColor.init(white: 0, alpha: 0.8), UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)), for: .normal)
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var songTitleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
        return label
    }()
    
    lazy var songDetailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.16)
        return label
    }()
    
    lazy var likeCountButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
        let image = UIImage.init(named: "79c8f9c0ffd172d0e82c6182c5bfa3a9")
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .left
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
        return button
    }()
    
    lazy var replyCountButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
        let image = UIImage.init(named: "0b80827e8b4f4db83c213437802e0600")
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .left
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
        return button
    }()
    
    lazy var shareCountButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
        let image = UIImage.init(named: "5e94f52e73d0f62a15cd24d47d4ef1c4")
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .left
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
        return button
    }()
    
    lazy var moreActionButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        let image = UIImage.init(named: "7eae8a2d57708dd57f4c9bcc907b80ab")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var separatorLineView: UIView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage.init(named: "3fd9f0dac02f5e09c255d677ca5c951b")
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        songPlayButton.imageView?.layer.cornerRadius = (songPlayButton.imageView?.bounds.size.height ?? 0) / 2.0
        userImageView.layer.cornerRadius = userImageView.bounds.size.height / 2.0
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        addSubview(userImageView)
        contentView.addSubview(userTitleLabel)
        contentView.addSubview(fansCountLabel)
        contentView.addSubview(userShareLabel)
        contentView.addSubview(followUserButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(songBackgroundView)
        addSubview(songPlayButton)
        songBackgroundView.addSubview(songTitleLabel)
        songBackgroundView.addSubview(songDetailLabel)
        contentView.addSubview(likeCountButton)
        contentView.addSubview(replyCountButton)
        contentView.addSubview(shareCountButton)
        contentView.addSubview(moreActionButton)
        contentView.addSubview(separatorLineView)
        userImageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.top.equalTo(20)
            maker.width.height.equalTo(40)
        }
        userTitleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(userImageView).offset(2)
            maker.left.equalTo(userImageView.snp.right).offset(10)
        }
        fansCountLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(userImageView).offset(-2)
            maker.left.equalTo(userTitleLabel)
        }
        userShareLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(userTitleLabel)
            maker.left.equalTo(userTitleLabel.snp.right).offset(10)
        }
        followUserButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(-10)
            maker.top.equalTo(userTitleLabel)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(userImageView.snp.bottom).offset(12)
            maker.left.equalTo(userTitleLabel)
            maker.right.equalTo(followUserButton)
        }
        collectionView.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.height.equalTo((UIScreen.main.bounds.width - 60) - 10)
        }
        songBackgroundView.snp.makeConstraints { (maker) in
            maker.top.equalTo(collectionView.snp.bottom).offset(6)
            maker.left.right.equalTo(titleLabel)
            maker.height.equalTo(56)
        }
        songPlayButton.snp.makeConstraints { (maker) in
            maker.left.top.equalTo(songBackgroundView).offset(8)
            maker.bottom.equalTo(songBackgroundView).offset(-8)
            maker.width.equalTo(songPlayButton.snp.height)
        }
        songTitleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(songPlayButton.snp.right).offset(10)
            maker.top.equalTo(songPlayButton).offset(4)
        }
        songDetailLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(songTitleLabel)
            maker.bottom.equalTo(songPlayButton).offset(-4)
        }
        likeCountButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(titleLabel)
            maker.top.equalTo(songBackgroundView.snp.bottom).offset(20)
        }
        replyCountButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(likeCountButton.snp.right)
            maker.centerY.equalTo(likeCountButton)
            maker.width.equalTo(likeCountButton)
        }
        shareCountButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(replyCountButton.snp.right)
            maker.centerY.equalTo(likeCountButton)
            maker.width.equalTo(likeCountButton)
        }
        moreActionButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(shareCountButton.snp.right)
            maker.centerY.equalTo(likeCountButton)
            maker.right.equalTo(titleLabel)
        }
        separatorLineView.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(0)
            maker.top.equalTo(likeCountButton.snp.bottom).offset(15)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTFriendNewsModel else {
            return
        }
        userImageView.image = UIImage.init(named: model.userImage ?? "")
        userTitleLabel.text = model.userTitle
        fansCountLabel.text = model.fansCount
        titleLabel.text = model.title
        collectionView.setCellModelArray(model.imageList, proxy: self)
        songPlayButton.setBackgroundImage(UIImage.init(named: model.songImage ?? ""), for: .normal)
        songTitleLabel.text = model.songTitle
        songDetailLabel.text = model.songDetail
        likeCountButton.setTitle(model.likeCount, for: .normal)
        replyCountButton.setTitle(model.replyCount, for: .normal)
        shareCountButton.setTitle(model.shareCount, for: .normal)
    }

}

extension HTFriendNewsCell: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
        return HTFriendNewsImageCell.self
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
        let columnCount: CGFloat = 3
        let interitemsSpace = self.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: indexPath.section)
        let width = (collectionView.bounds.size.width - ((columnCount - 1) * interitemsSpace)) / columnCount
        return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
}
