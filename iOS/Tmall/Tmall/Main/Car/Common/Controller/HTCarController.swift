//
//  HTCarController.swift
//  Tmall
//
//  Created by hublot on 2018/11/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        collectionView.alwaysBounceVertical = true
        collectionView.register(HTCarGoodHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTCarGoodHeaderView.identifier)
        collectionView.register(HTCarLikeHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTCarLikeHeaderView.identifier)
        collectionView.register(HTCarLikeFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTCarLikeFooterView.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    /*-------------------------------------/ init /-----------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
        initInterface()
    }
    
    func initDataSource () {
        let modelArray = HTCarSectionModel.packModelArray()
        collectionView.setSectionModelArray(modelArray, proxy: self)
    }
    
    func initInterface() {
        navigationItem.title = "购物车"
        let shareBarButton = UIBarButtonItem.init(image: UIImage.init(named: "51a436292e40b855640bee976dd02cef"), style: .plain, target: nil, action: nil)
        let editBarButton = UIBarButtonItem.init(title: "编辑", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [editBarButton, shareBarButton]
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
    }

}

extension HTCarController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
        let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .good?:
            return HTCarGoodCell.self
        case .like?:
            return HTCarLikeCell.self
        default:
            return HTCarGoodCell.self
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return reuseViewNumberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reuseView(collectionView, numberOfRowsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCarSectionModel
        var reuseClass: ReuseCell.Type
        switch kind {
        case UICollectionElementKindSectionHeader:
            switch sectionModel?.type {
            case .good?:
                reuseClass = HTCarGoodHeaderView.self
            case .like?:
                reuseClass = HTCarLikeHeaderView.self
            default:
                reuseClass = HTCarGoodHeaderView.self
            }
        case UICollectionElementKindSectionFooter:
            switch sectionModel?.type {
            case .like?:
                reuseClass = HTCarLikeFooterView.self
            default:
                reuseClass = HTCarLikeFooterView.self
            }
        default:
            reuseClass = HTCarGoodHeaderView.self
        }
        let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseClass.identifier, for: indexPath)
        (reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
        return reuseView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .good?:
            return CGSize.init(width: collectionView.bounds.size.width, height: 44)
        case .like?:
            return CGSize.init(width: collectionView.bounds.size.width, height: 60)
        default:
            return CGSize.zero
        }
    }
    
    func itemWidthFromItemSingleColumnCount(_ count: Int, _ section: Int) -> CGFloat {
        var width = collectionView.frame.size.width
        let sectionInset = collectionView(collectionView, layout: collectionView.collectionViewLayout, insetForSectionAt: section)
        let minimumInteritemWidth = collectionView(collectionView, layout: collectionView.collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
        width -= (sectionInset.left + sectionInset.right)
        width -= (CGFloat(count - 1) * minimumInteritemWidth)
        return floor(width / CGFloat(count))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .good?:
            return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 120)
        case .like?:
            return CGSize.init(width: itemWidthFromItemSingleColumnCount(2, indexPath.section), height: 240)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .like?:
            return CGSize.init(width: collectionView.bounds.size.width, height: 50)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .like?:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .like?:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTCarSectionModel
        switch sectionModel?.type {
        case .good?:
            return UIEdgeInsets.init(top: 0, left: 0, bottom: 150, right: 0)
        case .like?:
            return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        default:
            return UIEdgeInsets.zero
        }
    }

    
}
