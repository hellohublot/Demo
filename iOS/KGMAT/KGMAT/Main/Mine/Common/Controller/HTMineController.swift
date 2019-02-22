//
//  HTMineController.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineController: UIViewController {

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
    
    func initDataSource () {
        let modelArray = HTMineSectionModel.packModelArray()
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
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
        }
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    
    

}


extension HTMineController: TableViewThrough {
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
        let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
        switch sectionModel?.type {
        case .user?:
            return HTMineUserCell.self
        case .count?:
            return HTMineCountCell.self
        case .banner?:
            return HTMineBannerCell.self
        case .record?:
            return HTMineRecordCell.self
        default:
            return HTMineRecordCell.self
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reuseViewNumberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuseView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
        (cell as? HTMineBannerCell)?.removeButtonTouchInside = { [weak self] in
            guard let weakSelf = self else {
                return
            }
            var willRemoveModelArray = tableView.sectionModelArray()
            willRemoveModelArray.remove(at: indexPath.section)
            tableView.setSectionModelArray(willRemoveModelArray, proxy: weakSelf)
            tableView.deleteSections([indexPath.section], with: .automatic)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
        switch sectionModel?.type {
        case .user?:
            return 230
        case .count?:
            return 110
        case .banner?:
            return 90
        case .record?:
            return 70
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
