//
//  HTTabbarModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTTabbarType {
	case index
	case grass
	case circle
	case car
	case mine
}

class HTTabbarModel: NSObject {
	
	var title: String?
	var type: HTTabbarType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTTabbarModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "精选", typeKey: HTTabbarType.index, textKey: "", controllerClassKey: HTIndexController.self, imageKey: "679d002fe31847052e57b656911261d2", selectedImageKey: "d44d3a5c727a042ac31604fc453c9da4", selectedKey: false],
			[titleKey: "种草猫", typeKey: HTTabbarType.grass, textKey: "", controllerClassKey: HTGrassController.self, imageKey: "8c4a1e0801e9b290df9e71b8d46d1ba1", selectedImageKey: "b7fc6c7a59cc4619726cac04f09fec2c", selectedKey: false],
			[titleKey: "逛商圈", typeKey: HTTabbarType.circle, textKey: "", controllerClassKey: HTCircleController.self, imageKey: "494e67b461543492c78551452b2a5057", selectedImageKey: "902bce18e4a17e49417012c4288cc0ac", selectedKey: false],
			[titleKey: "购物车", typeKey: HTTabbarType.car, textKey: "", controllerClassKey: HTCarController.self, imageKey: "d7e2208e9d01608770cfa8139344b2b7", selectedImageKey: "d713c590803db74600bebcf61b0de11c", selectedKey: false],
			[titleKey: "我", typeKey: HTTabbarType.mine, textKey: "", controllerClassKey: HTMineController.self, imageKey: "d26b01cf7c9b980d2a149a62b9e81a2b", selectedImageKey: "ea3eb998e8e11228499078250b979028", selectedKey: false]
		]
		let modelArray = keyValueArray.map { dictionary -> HTTabbarModel in
			let model = HTTabbarModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTTabbarType
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
