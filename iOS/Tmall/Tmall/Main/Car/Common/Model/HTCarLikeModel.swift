//
//  HTCarLikeModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCarLikeType {
	case `default`
}

class HTCarLikeModel: NSObject {
	
	var title: String?
	var type: HTCarLikeType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
    
    var price: String?
    var brandImage: String?
    var brandTitle: String?
	
	class func packModelArray() -> [HTCarLikeModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
        let priceKey = "priceKey"
        let brandImageKey = "brandImageKey"
        let brandTitleKey = "brandTitleKey"
		let keyValueArray = [
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
            [titleKey: "[3期免息][两年保修]Apple/苹果 iPad 2018款 9.7英寸wifi新款平板电脑32G/128G 正品国行新品授权旗舰店", typeKey: HTCarLikeType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "9ecd2f9769ddfbbd58ece1587a7aa98a", selectedImageKey: "", selectedKey: false, priceKey: "¥2358", brandImageKey: "d07c7a0f2db4106d2ec7780fcbc05845", brandTitleKey: "Apple/苹果"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCarLikeModel in
			let model = HTCarLikeModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCarLikeType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
            model.price = dictionary[priceKey] as? String
            model.brandImage = dictionary[brandImageKey] as? String
            model.brandTitle = dictionary[brandTitleKey] as? String
			return model
		}
		return modelArray
	}
}
