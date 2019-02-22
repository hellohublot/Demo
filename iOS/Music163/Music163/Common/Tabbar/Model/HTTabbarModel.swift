//
//  HTTabbarModel.swift
//  Tian
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTTabbarType {
	case discover
	case video
	case mine
	case friend
	case account
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
            [titleKey: "发现", typeKey: HTTabbarType.discover, textKey: "", controllerClassKey: HTDiscoverController.self, imageKey: "0712e22e461a2a412dd82a18f0d16a69", selectedImageKey: "64185c7ece7ef12d62be7b095518eccf", selectedKey: false],
            [titleKey: "视频", typeKey: HTTabbarType.video, textKey: "", controllerClassKey: HTVideoController.self, imageKey: "d4ab6d79d01f89d4cc9cfab13ffe6fd1", selectedImageKey: "bd99eb4380d8f0accd332972e748d62c", selectedKey: false],
            [titleKey: "我的", typeKey: HTTabbarType.mine, textKey: "", controllerClassKey: HTMineController.self, imageKey: "f2499fca9172bd8cd1790da9b4b78eb2", selectedImageKey: "c8802ecbde5c67183e5fc324f476c688", selectedKey: false],
            [titleKey: "朋友", typeKey: HTTabbarType.friend, textKey: "", controllerClassKey: HTFriendController.self, imageKey: "21e30f7206c2994b073d731af0ac0dac", selectedImageKey: "79887a67fc5b25002475789a77248e54", selectedKey: false],
			[titleKey: "帐号", typeKey: HTTabbarType.account, textKey: "", controllerClassKey: HTAccountController.self, imageKey: "ff0edb72cf649a50bbefe110d1aaabf4", selectedImageKey: "7cb7c694debfc0c46244a016e93bf252", selectedKey: false],
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
