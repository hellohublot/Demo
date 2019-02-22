//
//  HTCourseController.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseController: UIViewController {
    
    lazy var navigationBar: HTCourseNavigationBar = {
        let navigationBar = HTCourseNavigationBar.init(frame: CGRect.zero)
        return navigationBar
    }()
    
    lazy var backgroundView: HTCourseBackgroundView = {
        let backgroundView = HTCourseBackgroundView.init(frame: CGRect.zero)
        return backgroundView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
		let frame = CGRect.init(x: 0, y: 0, width: 0, height: 0.0001)
        tableView.tableFooterView = UIView.init(frame: frame)
		tableView.tableFooterView = UIView.init(frame: frame)
        tableView.estimatedSectionFooterHeight = 0
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
		tableView.register(HTCourseSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: HTCourseSectionHeaderView.identifier)
		tableView.register(HTCourseOpenHeaderView.self, forHeaderFooterViewReuseIdentifier: HTCourseOpenHeaderView.identifier)
		tableView.register(HTCourseLiveFooterView.self, forHeaderFooterViewReuseIdentifier: HTCourseLiveFooterView.identifier)
		tableView.register(HTCourseStoryFooterView.self, forHeaderFooterViewReuseIdentifier: HTCourseStoryFooterView.identifier)
        return tableView
    }()
    
    /*-------------------------------------/ init /-----------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
        initInterface()
    }
    
    func initDataSource () {
        let modelArray = HTCourseSectionModel.packModelArray()
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
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        navigationBar.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(0)
            maker.height.equalTo(HTStatic.navigationHeight)
        }
        view.layoutIfNeeded()
        tableView.contentInset = UIEdgeInsets.init(top: HTCourseBackgroundView.imageBlueHeight, left: 0, bottom: 0, right: 0)
        tableView.backgroundView = backgroundView
        tableView.setContentOffset(CGPoint.init(x: 0, y: -HTCourseBackgroundView.imageBlueHeight), animated: false)
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    
    

}

extension HTCourseController: TableViewThrough {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + scrollView.contentInset.top
        navigationBar.reloadNavigationBarAlphaWithOffset(offsetY)
        backgroundView.reloadHeaderImageViewWithOffset(offsetY)
    }
    
    func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTCourseSectionModel
		switch sectionModel?.type {
		case .circle?:
			return HTCourseCircleView.self
		case .replay?:
			return HTCourseReplayView.self
        case .live?:
            return HTCourseLiveCell.self
        case .grade?:
            return HTCourseGradeView.self
        case .story?:
            return HTCourseStoryCell.self
        case .service?:
            return HTCourseServiceCell.self
		default:
			return HTCourseServiceCell.self
		}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reuseViewNumberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuseView(tableView, numberOfRowsInSection: section)
    }
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionModel = tableView.sectionModelArray()[section] as? HTCourseSectionModel
		var reuseClass: ReuseCell.Type
		switch sectionModel?.type {
		case .open?, .grade?, .story?, .service?:
			reuseClass = HTCourseSectionHeaderView.self
		case .replay?, .live?:
			reuseClass = HTCourseOpenHeaderView.self
		default:
			return nil
		}
		let reuseView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseClass.identifier)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: IndexPath.init(row: 0, section: section))
		return reuseView
	}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
    }
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let sectionModel = tableView.sectionModelArray()[section] as? HTCourseSectionModel
		var reuseClass: ReuseCell.Type
		switch sectionModel?.type {
		case .live?:
			reuseClass = HTCourseLiveFooterView.self
		case .story?:
			reuseClass = HTCourseStoryFooterView.self
		default:
			return nil
		}
		let reuseView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseClass.identifier)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: IndexPath.init(row: 0, section: section))
		return reuseView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		let sectionModel = tableView.sectionModelArray()[section] as? HTCourseSectionModel
		switch sectionModel?.type {
		case .open?, .grade?, .story?, .service?:
			return 50
		case .replay?, .live?:
			return 50
		default:
			return 0.0001
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTCourseSectionModel
		switch sectionModel?.type {
		case .circle?:
			return 115
		case .replay?:
			return 200
        case .live?:
            let model = sectionModel?.modelArray[indexPath.row] as? NSObject
            return HTCourseLiveCell.cacheModelSize(model, CGSize.init(width: tableView.bounds.size.width, height: 0)).height
        case .grade?:
            return 390
        case .story?:
            return 180
        case .service?:
            return 75
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		let sectionModel = tableView.sectionModelArray()[section] as? HTCourseSectionModel
		switch sectionModel?.type {
		case .live?:
			return 60
		case .story?:
			return 60
		default:
			return 0.0001
		}
	}
    
}
