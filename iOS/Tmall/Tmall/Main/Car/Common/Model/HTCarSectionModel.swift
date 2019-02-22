//
//  HTCarSectionModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTCarSectionType {
    case good
    case like
}

class HTCarSectionModel: NSObject, ReuseSectionArray {
    
    var title: String?
    var type: HTCarSectionType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    var modelArray = [Any]()
    
    class func packModelArray() -> [HTCarSectionModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "Apple Store 官方", typeKey: HTCarSectionType.good, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: true],
            [titleKey: "", typeKey: HTCarSectionType.like, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTCarSectionModel in
            let model = HTCarSectionModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTCarSectionType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary [selectedImageKey] as? String
            switch model.type {
            case .good?:
                model.modelArray = HTCarGoodModel.packModelArray()
            case .like?:
                model.modelArray = HTCarLikeModel.packModelArray()
            default:
                break
            }
            return model
        }
        return modelArray
    }
}
