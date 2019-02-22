//
//  HTMusicPlayerLyricModel.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMusicPlayerLyricType {
	case `default`
}

class HTMusicPlayerLyricModel: NSObject {

	var title: String?
	var type: HTMusicPlayerLyricType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?

	var height: CGFloat = 0

	class func packModelArray() -> [HTMusicPlayerLyricModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "作曲 : 徐大乐", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "作词 : 徐大乐", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "做梦的 醒来的", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "沉默着 躁动着", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "世界太大 人会迷路", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "要么庸俗 要么孤独", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个安静的下午", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "一场突然的离开", typeKey: HTMusicPlayerLyricType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMusicPlayerLyricModel in
			let model = HTMusicPlayerLyricModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMusicPlayerLyricType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String

			model.height = max(38, model.title?.height(HTMusicPlayerLyricCell.font, HTMusicPlayerLyricCell.width) ?? 0)
			return model
		}

		modelArray.first?.height = max(43, modelArray.first?.height ?? 0)
		modelArray.last?.height = max(43, modelArray.last?.height ?? 0)

		return modelArray
	}
}
