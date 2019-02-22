//
//  HTMineCountModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineCountTyp {
    case `default`
}

class HTMineCountModel: NSObject {
    
    var title: String?
    var type: HTMineCountTyp?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    class func packModelArray() -> [HTMineCountModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "收藏夹", typeKey: HTMineCountTyp.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "817fd4c11f546ee4c4890fec57e52eff", selectedImageKey: "", selectedKey: false],
            [titleKey: "错题本", typeKey: HTMineCountTyp.default, textKey: "31", controllerClassKey: UIViewController.self, imageKey: "96b4054d95cfd97829a2d198304e0fa1", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineCountModel in
            let model = HTMineCountModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineCountTyp
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
