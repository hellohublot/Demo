//
//  HTQuestionSectionModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTQuestionSectionType {
    case store
}

class HTQuestionSectionModel: NSObject, ReuseSectionArray {
    
    var title: String?
    var type: HTQuestionSectionType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    var modelArray = [Any]()
    
    class func packModelArray() -> [HTQuestionSectionModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "30个收录材料", typeKey: HTQuestionSectionType.store, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTQuestionSectionModel in
            let model = HTQuestionSectionModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTQuestionSectionType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            switch model.type {
            case .store?:
                model.modelArray = HTQuestionStoreModel.packModelArray()
            default:
                break
            }
            return model
        }
        return modelArray
    }
}
