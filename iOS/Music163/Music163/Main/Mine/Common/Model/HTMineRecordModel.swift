//
//  HTMineRecordModel.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineRecordType {
	case `default`
}

class HTMineRecordModel: NSObject {
	
	var title: String?
	var type: HTMineRecordType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var showSeparatorLine: Bool?
	
	class func packModelArray() -> [HTMineRecordModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let showSeparatorLineKey = "showSeparatorLineKey"
		let keyValueArray = [
			[titleKey: "本地音乐", typeKey: HTMineRecordType.default, textKey: "2", controllerClassKey: UIViewController.self, imageKey: "168221e4073a6921bdbcc491f2665ce6", selectedImageKey: "", selectedKey: false, showSeparatorLineKey: true],
			[titleKey: "最近播放", typeKey: HTMineRecordType.default, textKey: "2", controllerClassKey: UIViewController.self, imageKey: "05204d8d7f4895bb27c4b2325840c9be", selectedImageKey: "", selectedKey: false, showSeparatorLineKey: true],
			[titleKey: "我的电台", typeKey: HTMineRecordType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "98ca25248103b275138a847e0f79a7f5", selectedImageKey: "", selectedKey: false, showSeparatorLineKey: true],
			[titleKey: "我的收藏", typeKey: HTMineRecordType.default, textKey: "专辑/歌手/视频/专栏", controllerClassKey: UIViewController.self, imageKey: "df3be79b1bf3d01a7c31b79cba21f36d", selectedImageKey: "", selectedKey: false, showSeparatorLineKey: true],
			[titleKey: "Sati 空间", typeKey: HTMineRecordType.default, textKey: "特别的聆听模式", controllerClassKey: UIViewController.self, imageKey: "7df1a7798055f8f1458137f56b995652", selectedImageKey: "", selectedKey: false, showSeparatorLineKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineRecordModel in
			let model = HTMineRecordModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineRecordType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.showSeparatorLine = dictionary[showSeparatorLineKey] as? Bool
			return model
		}
		return modelArray
	}
}
