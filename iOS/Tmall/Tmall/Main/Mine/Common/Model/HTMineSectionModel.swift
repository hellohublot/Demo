//
//  HTMineSectionModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTMineSectionType {
	case order
	case collect
	case packet
	case point
	case gift
	case card
	case tool
}

class HTMineSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTMineSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTMineSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "我的订单", typeKey: HTMineSectionType.order, textKey: "查看全部", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "我的收藏", typeKey: HTMineSectionType.collect, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "红包卡劵", typeKey: HTMineSectionType.packet, textKey: "查看全部", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "积分兑红包", typeKey: HTMineSectionType.point, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "三单有礼", typeKey: HTMineSectionType.gift, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "天猫超市卡", typeKey: HTMineSectionType.card, textKey: "立刻充值", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "必备工具", typeKey: HTMineSectionType.tool, textKey: "查看全部", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineSectionModel in
			let model = HTMineSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .order?:
				model.modelArray = HTMineOrderModel.packModelArray()
			case .collect?:
				model.modelArray = HTMineCollectModel.packModelArray()
			case .packet?, .point?, .gift?, .card?:
				model.modelArray = HTMineImageModel.packModelArray(model.type)
			case .tool?:
				model.modelArray = HTMineToolModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
