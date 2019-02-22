//
//  HTVideoContentModel.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTVideoContentType {
	case `default`
}

class HTVideoContentModel: NSObject {
	
	var title: String?
	var type: HTVideoContentType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var videoIDString: String?
	var videoURL: String?
	
	var playCount: String?
	var videoDuration: String?
	
	var userImage: String?
	var userTitle: String?
	var likeCount: String?
	var replyCount: String?
	
	class func packModelArray() -> [HTVideoContentModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let videoIDStringKey = "videoIDStringKey"
		let playCountKey = "playCountKey"
		let videoDurationKey = "videoDurationKey"
		let userImageKey = "userImageKey"
		let userTitleKey = "userTitleKey"
		let likeCountKey = "likeCountKey"
		let replyCountKey = "replyCountKey"
		
		let keyValueArray = [
			[titleKey: "19只猫咪集体赖床，超温馨", typeKey: HTVideoContentType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00dd29a3f0365df28a98e9ddda0d5c7f", videoIDStringKey: "4069944DDF8978E12A5488877C36DFCB", selectedImageKey: "", selectedKey: false, playCountKey: "57万", videoDurationKey: "01:49", userImageKey: "063d36101a6358d601c6f3a37e066da1", userTitleKey: "Cafeuncle", likeCountKey: "3197", replyCountKey: "317"],
			[titleKey: "19只猫咪集体赖床，超温馨", typeKey: HTVideoContentType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00dd29a3f0365df28a98e9ddda0d5c7f", videoIDStringKey: "4069944DDF8978E12A5488877C36DFCB", selectedImageKey: "", selectedKey: false, playCountKey: "57万", videoDurationKey: "01:49", userImageKey: "063d36101a6358d601c6f3a37e066da1", userTitleKey: "Cafeuncle", likeCountKey: "3197", replyCountKey: "317"],
			[titleKey: "19只猫咪集体赖床，超温馨", typeKey: HTVideoContentType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00dd29a3f0365df28a98e9ddda0d5c7f", videoIDStringKey: "4069944DDF8978E12A5488877C36DFCB", selectedImageKey: "", selectedKey: false, playCountKey: "57万", videoDurationKey: "01:49", userImageKey: "063d36101a6358d601c6f3a37e066da1", userTitleKey: "Cafeuncle", likeCountKey: "3197", replyCountKey: "317"],
			[titleKey: "19只猫咪集体赖床，超温馨", typeKey: HTVideoContentType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00dd29a3f0365df28a98e9ddda0d5c7f", videoIDStringKey: "4069944DDF8978E12A5488877C36DFCB", selectedImageKey: "", selectedKey: false, playCountKey: "57万", videoDurationKey: "01:49", userImageKey: "063d36101a6358d601c6f3a37e066da1", userTitleKey: "Cafeuncle", likeCountKey: "3197", replyCountKey: "317"],
			[titleKey: "19只猫咪集体赖床，超温馨", typeKey: HTVideoContentType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00dd29a3f0365df28a98e9ddda0d5c7f", videoIDStringKey: "4069944DDF8978E12A5488877C36DFCB", selectedImageKey: "", selectedKey: false, playCountKey: "57万", videoDurationKey: "01:49", userImageKey: "063d36101a6358d601c6f3a37e066da1", userTitleKey: "Cafeuncle", likeCountKey: "3197", replyCountKey: "317"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTVideoContentModel in
			let model = HTVideoContentModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTVideoContentType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.videoIDString = dictionary[videoIDStringKey] as? String
			model.playCount = dictionary[playCountKey] as? String
			model.videoDuration = dictionary[videoDurationKey] as? String
			model.userImage = dictionary[userImageKey] as? String
			model.userTitle = dictionary[userTitleKey] as? String
			model.likeCount = dictionary[likeCountKey] as? String
			model.replyCount = dictionary[replyCountKey] as? String
			
			
			return model
		}
		
		Request.parseVideoIdString(modelArray.first?.videoIDString ?? "", { (videoURLString) in
			for (index, model) in modelArray.enumerated() {
				model.videoURL = videoURLString + "&" + "\(index)"
			}
		})
		
		return modelArray
	}
}
