//
//  HTFriendNewsController.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTFriendNewsController: UIViewController {

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
        let modelArray = HTFriendNewsModel.packModelArray()
        self.tableView.setCellModelArray(modelArray, proxy: self)
        self.tableView.reloadData()
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
        tableView.contentInset = UIEdgeInsets.init(top: HTFriendNavigationBar.navigationBarHeight, left: 0, bottom: HTStatic.tabbarHeight, right: 0)
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/


}

extension HTFriendNewsController: TableViewThrough {
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
        return HTFriendNewsCell.self
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
        return 578
    }
    
}
