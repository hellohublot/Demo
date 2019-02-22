//
//  HTAccountActionModel.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTAccountActionType {
	case message
	case vip
	case shop
	case game
	case free
	case setup
	case scanf
	case skin
	case dark
	case close
	case clock
	case drive
	case child
	case radio
	case cheap
	case join
	case share
	case about
	case exit
}

enum HTAccountActionDisplayType {
	case largeImage
	case smallImage
	case titleImage
	case switchcontrol
	case exittitle
}

class HTAccountActionModel: NSObject {
	
	var title: String?
	var type: HTAccountActionType?
	var displayType: HTAccountActionDisplayType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var detailImage: String?
	var detailTitle: String?
	
	var showAccessoryImage: Bool?
	var showSeparatorLine: Bool?
	
	class func packModelArray(_ type: HTAccountSectionType?) -> [HTAccountActionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let displayTypeKey = "displayTypeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let detailImageKey = "detailImageKey"
		let detailTitleKey = "detailTitleKey"
		let showSeparatorKey = "showSeparatorKey"
		let showAccessoryImageKey = "showAccessoryImageKey"
		var keyValueArray = [[String: Any]]()
		switch type {
		case .message?:
			keyValueArray.append(contentsOf: [
				[titleKey: "我的消息", typeKey: HTAccountActionType.message, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "713b219050781d5afbde6647ed22feeb", selectedImageKey: "", selectedKey: false, detailImageKey: "50856cb1a687a7dc7989f81ac023e56f", detailTitleKey: "", showSeparatorKey: false, showAccessoryImageKey: true],
			])
		case .more?:
			keyValueArray.append(contentsOf: [
				[titleKey: "会员中心", typeKey: HTAccountActionType.vip, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "02c3f00be3d6b3303f507eddcf1dbd30", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "商城", typeKey: HTAccountActionType.shop, displayTypeKey: HTAccountActionDisplayType.titleImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "1f2e78de0e76bb06fe93e5a536cab741", selectedImageKey: "", selectedKey: false, detailImageKey: "71e09144bd8c1994ec5187e36cc6a70d", detailTitleKey: "双色羽绒服特价秒杀", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "游戏推荐: 明日之后", typeKey: HTAccountActionType.game, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "bb54e76dab4b2f72a700d68fa630fe29", selectedImageKey: "", selectedKey: false, detailImageKey: "0d760299c41d73a2969326d2f76cd783", detailTitleKey: "黑科技", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "在线听歌免流量", typeKey: HTAccountActionType.free, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "8537c91c1fe5ba7a4c4efb8f5d866a69", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: false, showAccessoryImageKey: true],
			])
		case .setup?:
			keyValueArray.append(contentsOf: [
				[titleKey: "设置", typeKey: HTAccountActionType.setup, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "0477467b7d6cc66e679a976b3ad5a211", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "扫一扫", typeKey: HTAccountActionType.scanf, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e573731c6f02fac978e53c0ff35238a4", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "个性换肤", typeKey: HTAccountActionType.skin, displayTypeKey: HTAccountActionDisplayType.smallImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "d6def602b75c634f50c9b2cb3e473e5f", selectedImageKey: "", selectedKey: false, detailImageKey: "6ea9277974e1ea1efd08e77243f7a41d", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "夜间模式", typeKey: HTAccountActionType.dark, displayTypeKey: HTAccountActionDisplayType.switchcontrol, textKey: "", controllerClassKey: UIViewController.self, imageKey: "06f667d198917eacd7539d684981932f", selectedImageKey: "", selectedKey: true, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: false],
				[titleKey: "定时关闭", typeKey: HTAccountActionType.close, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "617a0831b8cf41a057330f1c9b8bcdd7", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "音乐闹钟", typeKey: HTAccountActionType.clock, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "22361cd11edf963348a377a519250b7d", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "驾驶模式", typeKey: HTAccountActionType.drive, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "090fc9cbc5d6f1202e31bb6dd78ef30c", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "亲子频道", typeKey: HTAccountActionType.child, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "77b820523ef793c1605a4912e80bd6bf", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "小冰电台", typeKey: HTAccountActionType.radio, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "30287991f36ad766e9ce5c5c4297534d", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "优惠劵", typeKey: HTAccountActionType.cheap, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "abc7dc9d66fb2d818718992c381c24e0", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: false, showAccessoryImageKey: true],
			])
		case .about?:
			keyValueArray.append(contentsOf: [
				[titleKey: "加入网易音乐人", typeKey: HTAccountActionType.join, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "788a2e0d406179383a005746628f319f", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "分享网易云音乐", typeKey: HTAccountActionType.share, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b9366bf3c83a111c0eefcea0075525f7", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: true, showAccessoryImageKey: true],
				[titleKey: "关于", typeKey: HTAccountActionType.about, displayTypeKey: HTAccountActionDisplayType.largeImage, textKey: "", controllerClassKey: UIViewController.self, imageKey: "55cfa319e9187e9f1dcc6683b3af5924", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: false, showAccessoryImageKey: true],
			])
		case .exit?:
			keyValueArray.append(contentsOf: [
				[titleKey: "退出登录", typeKey: HTAccountActionType.exit, displayTypeKey: HTAccountActionDisplayType.exittitle, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailImageKey: "", detailTitleKey: "", showSeparatorKey: false, showAccessoryImageKey: false],
			])
		default:
			break
		}
		let modelArray = keyValueArray.map { dictionary -> HTAccountActionModel in
			let model = HTAccountActionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTAccountActionType
			model.displayType = dictionary[displayTypeKey] as? HTAccountActionDisplayType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.detailImage = dictionary[detailImageKey] as? String
			model.detailTitle = dictionary[detailTitleKey] as? String
			model.showSeparatorLine = dictionary[showSeparatorKey] as? Bool
			model.showAccessoryImage = dictionary[showAccessoryImageKey] as? Bool
			return model
		}
		return modelArray
	}
}
