//
//  HTMineSectionModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTMineSectionType {
    case user
    case count
    case banner
    case record
}

class HTMineSectionModel: NSObject, ReuseSectionArray {
    
    var title: String?
    var type: HTMineSectionType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var modelArray = [Any]()
    
    class func packModelArray() -> [HTMineSectionModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "", typeKey: HTMineSectionType.user, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "", typeKey: HTMineSectionType.count, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "", typeKey: HTMineSectionType.banner, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "", typeKey: HTMineSectionType.record, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineSectionModel in
            let model = HTMineSectionModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineSectionType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            switch model.type {
            case .user?:
                model.modelArray = HTMineUserModel.packModelArray()
            case .count?:
                model.modelArray = [HTMineCountModel.packModelArray()]
            case .banner?:
                model.modelArray = [HTMineBannerModel.packModelArray()]
            case .record?:
                model.modelArray = HTMineRecordModel.packModelArray()
            default:
                break
            }
            return model
        }
        return modelArray
    }
}
