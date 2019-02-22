//
//  HTVideoPageModel.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTVideoPageType {
	case `default`
}

class HTVideoPageModel: NSObject, HTPageModelAble {
	
	var title: String?
	var type: HTVideoPageType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var controller: UIViewController?
	
	class func packModelArray() -> [HTVideoPageModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "精选", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "LOOK直播", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "现场", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "等", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "听歌轨迹", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "翻唱", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "听BGM", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "MV", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "舞蹈", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "ACG音乐", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "演奏", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "视频榜", typeKey: HTVideoPageType.default, textKey: "", controllerClassKey: HTVideoContentController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTVideoPageModel in
			let model = HTVideoPageModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTVideoPageType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			return model
		}
		return modelArray
	}
}
