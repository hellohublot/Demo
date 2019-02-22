//
//  HTDiscoverRecommendSectionModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTDiscoverRecommendSectionType {
	case banner
	case circle
	case bill
	case news
	case vip
	case radio
	case article
}

class HTDiscoverRecommendSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTDiscoverRecommendSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTDiscoverRecommendSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTDiscoverRecommendSectionType.banner, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendSectionType.circle, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "推荐歌单", typeKey: HTDiscoverRecommendSectionType.bill, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "最新音乐", typeKey: HTDiscoverRecommendSectionType.news, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "最新音乐", typeKey: HTDiscoverRecommendSectionType.vip, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "主播电台", typeKey: HTDiscoverRecommendSectionType.radio, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendSectionType.article, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendSectionModel in
			let model = HTDiscoverRecommendSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .banner?:
				model.modelArray = [HTDiscoverRecommendBannerModel.packModelArray()]
			case .circle?:
				model.modelArray = HTDiscoverRecommendCircleModel.packModelArray()
			case .bill?:
				model.modelArray = HTDiscoverRecommendBillModel.packModelArray()
			case .news?:
				model.modelArray = HTDiscoverRecommendNewsModel.packModelArray()
			case .vip?:
				model.modelArray = [HTDiscoverRecommendVipModel.packModelArray()]
			case .radio?:
				model.modelArray = HTDiscoverRecommendRadioModel.packModelArray()
			case .article?:
				model.modelArray = HTDiscoverRecommendArticleModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
