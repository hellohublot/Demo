//
//  HTIndexModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTIndexSectionType {
	case circle
	case banner
	case image
	case limit
	case cheap
	case discover
	case new
	case brand
	case good
}

class HTIndexSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var detail: String?
	var type: HTIndexSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTIndexSectionModel] {
		let titleKey = "titleKey"
		let detailKey = "detailKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.circle, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.banner, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.image, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.limit, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "聚划算", detailKey: "抢手机天猫专享神劵", typeKey: HTIndexSectionType.cheap, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "发现品牌", detailKey: "", typeKey: HTIndexSectionType.discover, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.new, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.brand, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", detailKey: "", typeKey: HTIndexSectionType.good, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexSectionModel in
			let model = HTIndexSectionModel()
			model.title = dictionary[titleKey] as? String
			model.detail = dictionary[detailKey] as? String
			model.type = dictionary[typeKey] as? HTIndexSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .circle?:
				model.modelArray = HTIndexCircleModel.packModelArray()
			case .banner?:
				model.modelArray = [HTIndexBannerModel.packModelArray()]
			case .image?:
				model.modelArray = HTIndexImageModel.packModelArray()
			case .limit?:
				model.modelArray = HTIndexLimitModel.packModelArray()
			case .cheap?:
				model.modelArray = HTIndexCheapModel.packModelArray()
			case .discover?:
				model.modelArray = HTIndexDiscoverModel.packModelArray()
			case .new?:
				model.modelArray = HTIndexNewModel.packModelArray()
			case .brand?:
				model.modelArray = HTIndexBrandModel.packModelArray()
			case .good?:
				model.modelArray = HTIndexGoodModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
