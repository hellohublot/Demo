//
//  HTGrassModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTGrassType {
	case `default`
}

class HTGrassDiscoverModel: NSObject {
	
	var title: String?
	var type: HTGrassType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var userImage: String?
	var userTitle: String?
	var levelImage: String?
	var likeTitle: String?
    
    var height: CGFloat?
	
	class func packModelArray() -> [HTGrassDiscoverModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let userImageKey = "userImageKey"
		let levelImageKey = "userLevelKey"
		let userTitleKey = "userTitleKey"
		let likeTitleKey = "likeTitleKey"
		let keyValueArray = [
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],
			[titleKey: "祝天猫代言人易洋千玺18岁快乐~种草猫社区送上满满祝福", typeKey: HTGrassType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cf1a21a988222af1a694c47b30751a77", selectedImageKey: "", selectedKey: false, userImageKey: "61733713659761acfdc640acdfedbf90", levelImageKey: "6a9cd52fb4e3379d6a9976d28953f99c", userTitleKey: "福利喵", likeTitleKey: "1156"],

		]
		let modelArray = keyValueArray.map { dictionary -> HTGrassDiscoverModel in
			let model = HTGrassDiscoverModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTGrassType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.userImage = dictionary[userImageKey] as? String
			model.levelImage = dictionary[levelImageKey] as? String
			model.userTitle = dictionary[userTitleKey] as? String
			model.likeTitle = dictionary[likeTitleKey] as? String
            model.height = CGFloat(arc4random() % 100 + 200)
			return model
		}
		return modelArray
	}
}
