//
//  HTMineUserModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineUserType {
    case `default`
}

class HTMineUserModel: NSObject {
    
    var title: String?
    var type: HTMineUserType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var circleModelArray = HTMineUserCircleModel.packModelArray()
    
    class func packModelArray() -> [HTMineUserModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "", typeKey: HTMineUserType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineUserModel in
            let model = HTMineUserModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineUserType
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
