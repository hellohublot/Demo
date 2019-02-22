//
//  HTDiscoverRecommendArticleModel.swift
//  Music163
//
//  Created by hublot on 2018/12/14.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendArticleType {
	case `default`
}

class HTDiscoverRecommendArticleModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendArticleType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var playCount: String?
	var replyCount: String?
	var userImage: String?
	var userTitle: String?
	
	class func packModelArray() -> [HTDiscoverRecommendArticleModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let playCountKey = "playCountKey"
		let replyCountKey = "replyCountKey"
		let userImageKey = "userImageKey"
		let userTitleKey = "userTitleKey"
		
		let keyValueArray = [
			[titleKey: "￼这些歌比《说散就散》《体面》更扎心！", typeKey: HTDiscoverRecommendArticleType.default, textKey: "歌单", controllerClassKey: UIViewController.self, imageKey: "1bfe52439591ae6fdf5f94132cef4feb", selectedImageKey: "", selectedKey: false, playCountKey: "947万", replyCountKey: "388", userImageKey: "81d09b24890d101a8cbcb9ad7c1414f3", userTitleKey: "黄颂龙"],
			[titleKey: "￼软妹子 萝莉 中文 萌音", typeKey: HTDiscoverRecommendArticleType.default, textKey: "歌单", controllerClassKey: UIViewController.self, imageKey: "85a385dbc83516c5649580216509c23e", selectedImageKey: "", selectedKey: false, playCountKey: "35870", replyCountKey: "16", userImageKey: "6223613f36ab450a67dc93b62e288884", userTitleKey: "柯紀"],
			[titleKey: "￼￼“你是无意穿堂风 偏偏孤倨引山洪”", typeKey: HTDiscoverRecommendArticleType.default, textKey: "歌单", controllerClassKey: UIViewController.self, imageKey: "be8b1fe9e4a8b782ae35bab90beed248", selectedImageKey: "", selectedKey: false, playCountKey: "35870", replyCountKey: "16", userImageKey: "58ee3bad9b5bcf251624ededc04ed0fd", userTitleKey: "死66_"],
			[titleKey: "￼有没有一句歌词直戳内心", typeKey: HTDiscoverRecommendArticleType.default, textKey: "歌单", controllerClassKey: UIViewController.self, imageKey: "ca5b8c281ed2015ae48b7abedaa9bd39", selectedImageKey: "", selectedKey: false, playCountKey: "897万", replyCountKey: "1068", userImageKey: "8c7d4c98e3eb8cb790f77e5352229979", userTitleKey: "wo超级爱自由"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendArticleModel in
			let model = HTDiscoverRecommendArticleModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendArticleType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.playCount = dictionary[playCountKey] as? String
			model.replyCount = dictionary[replyCountKey] as? String
			model.userImage = dictionary[userImageKey] as? String
			model.userTitle = dictionary[userTitleKey] as? String
			return model
		}
		return modelArray
	}
}
