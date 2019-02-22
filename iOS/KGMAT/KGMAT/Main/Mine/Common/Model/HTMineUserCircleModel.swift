//
//  HTMineUserCircleModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineUserCircleType {
    case `default`
}

class HTMineUserCircleModel: NSObject {
    
    var title: String?
    var type: HTMineUserCircleType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var imageButtonBackgroundImage: String?
    var imageButtonImage: String?
    var titleButtonBackgroundImage: String?
    var titleButtonTitle: String?
    var titleButtonTitleColor: UIColor?
    
    class func packModelArray() -> [HTMineUserCircleModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        
        let imageButtonBackgroundImageKey = "imageButtonBackgroundImageKey"
        let imageButtonImageKey = "imageButtonImageKey"
        let titleButtonBackgroundImageKey = "titleButtonBackgroundImageKey"
        let titleButtonTitleKey = "titleButtonTitleKey"
        let titleButtonTitleColorKey = "titleButtonTitleColorKey"
        
        let keyValueArray = [
            [titleKey: "", typeKey: HTMineUserCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, imageButtonBackgroundImageKey: "2512719290757d43736a8134ed631e70", imageButtonImageKey: "f7a62522a83af8b583b10b96281f238b", titleButtonBackgroundImageKey: "892755382d0fa8749685277065bc9fba", titleButtonTitleKey: "1", titleButtonTitleColorKey: UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)],
            [titleKey: "", typeKey: HTMineUserCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, imageButtonBackgroundImageKey: "879c22a7598dd85d345d621b735f27ac", imageButtonImageKey: "2ed59c2d630766255524c17ca8cd9085", titleButtonBackgroundImageKey: "1cb81168d467c1f45d646e786f17b447", titleButtonTitleKey: "95", titleButtonTitleColorKey: UIColor.init(white: 0, alpha: 1)],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineUserCircleModel in
            let model = HTMineUserCircleModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineUserCircleType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            model.imageButtonBackgroundImage = dictionary[imageButtonBackgroundImageKey] as? String
            model.imageButtonImage = dictionary[imageButtonImageKey] as? String
            model.titleButtonBackgroundImage = dictionary[titleButtonBackgroundImageKey] as? String
            model.titleButtonTitle = dictionary[titleButtonTitleKey] as? String
            model.titleButtonTitleColor = dictionary[titleButtonTitleColorKey] as? UIColor
            return model
        }
        return modelArray
    }
}
