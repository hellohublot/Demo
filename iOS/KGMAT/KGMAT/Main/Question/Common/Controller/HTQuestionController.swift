//
//  HTQuestionController.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTQuestionController: UIViewController {
    
    lazy var navigationBar: HTQuestionNavigationBar = {
        let navigationBar = HTQuestionNavigationBar.init(frame: CGRect.zero)
        return navigationBar
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero)
        tableView.backgroundColor = UIColor.clear
        tableView.register(HTQuestionStoreHeaderView.self, forHeaderFooterViewReuseIdentifier: HTQuestionStoreHeaderView.identifier)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    /*-------------------------------------/ init /-----------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
        initInterface()
    }
    
    func initDataSource () {
        navigationBar.setModel(nil, for: IndexPath.init())
        let modelArray = HTQuestionSectionModel.packModelArray()
        tableView.setSectionModelArray(modelArray, proxy: self)
    }
    
    func initInterface() {
        navigationController?.navigationBar.isHidden = true
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        view.addSubview(tableView)
        view.addSubview(navigationBar)
        tableView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(0)
            maker.top.equalTo(navigationBar.snp.bottom)
        }
        navigationBar.snp.makeConstraints { (maker) in
            maker.top.equalTo(HTStatic.statusHeight)
            maker.left.right.equalTo(0)
            maker.height.equalTo(0)
        }
        
        navigationBar.navigationType = .maxHeight
        
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    
    

}

extension HTQuestionController: TableViewThrough {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let velocityY = velocity.y
        guard abs(velocityY) > 0.3 else {
            return
        }
        switch navigationBar.navigationType {
        case .maxHeight?:
            if (velocityY > 0) {
                navigationBar.navigationType = .minHeight
            }
        case .minHeight?:
            if velocityY < 0 {
                navigationBar.navigationType = .maxHeight
            }
        default:
            break
        }
    }
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
        return HTQuestionStoreCell.self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reuseViewNumberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuseView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = tableView.sectionModelArray()[section] as? HTQuestionSectionModel
        let reuseView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HTQuestionStoreHeaderView.identifier)
        (reuseView as? ReuseCell)?.setModel(sectionModel, for: IndexPath.init(row: 0, section: section))
        return reuseView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

