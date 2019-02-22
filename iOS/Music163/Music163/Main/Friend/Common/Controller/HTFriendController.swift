//
//  HTFriendController.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTFriendController: UIViewController {

    lazy var navigationBar: HTFriendNavigationBar = {
        let navigationBar = HTFriendNavigationBar.init(frame: CGRect.zero)
        return navigationBar
    }()
    
    let newsController = HTFriendNewsController()
    
    let nearController = HTFriendNearController()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
    
    /*-------------------------------------/ init /-----------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
        initInterface()
    }
    
    func initDataSource () {
        navigationBar.segmentedControl.segmentedDidSelected = { [weak self] index in
            guard let this = self else {
                return
            }
            this.contentView.subviews.last?.removeFromSuperview()
            switch index {
            case 0:
                this.contentView.addSubview(this.newsController.view)
            case 1:
                this.contentView.addSubview(this.nearController.view)
            default:
                break
            }
            this.contentView.subviews.last?.snp.makeConstraints({ (maker) in
                maker.edges.equalTo(UIEdgeInsets.zero)
            })
        }
        navigationBar.segmentedControl.segmentedDidSelected?(0)
    }
    
    func initInterface() {
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(contentView)
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (maker) in
            maker.left.top.right.equalTo(0)
            maker.height.equalTo(HTFriendNavigationBar.navigationBarHeight)
        }
        contentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    
    

}
