//
//  HTAccountSectionModel.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTAccountSectionType {
	case user
	case message
	case more
	case setup
	case about
	case exit
}

class HTAccountSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTAccountSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTAccountSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTAccountSectionType.user, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTAccountSectionType.message, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTAccountSectionType.more, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTAccountSectionType.setup, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTAccountSectionType.about, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTAccountSectionType.exit, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTAccountSectionModel in
			let model = HTAccountSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTAccountSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .user?:
				model.modelArray = HTAccountUserModel.packModelArray()
			case .message?, .more?, .setup?, .about?, .exit?:
				model.modelArray = HTAccountActionModel.packModelArray(model.type)
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
