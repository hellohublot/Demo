//
//  HTMineBannerModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineBannerType {
    case `default`
}

class HTMineBannerModel: NSObject {
    
    var title: String?
    var type: HTMineBannerType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    class func packModelArray() -> [HTMineBannerModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "", typeKey: HTMineBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "3692d647107a5b257e9d9b81ba86b85e", selectedImageKey: "", selectedKey: false],
            [titleKey: "", typeKey: HTMineBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e9416de54d64c34802e3055ae91134c1", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineBannerModel in
            let model = HTMineBannerModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineBannerType
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
