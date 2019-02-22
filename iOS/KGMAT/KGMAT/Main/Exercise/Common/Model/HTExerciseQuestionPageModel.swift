//
//  HTExerciseQuestionPageModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTExerciseQuestionPageType {
    case sc
    case cr
    case rc
    case ps
    case ds
}

class HTExerciseQuestionPageModel: NSObject {
    
    var title: String?
    var type: HTExerciseQuestionPageType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var itemModelArray = [HTExerciseQuestionItemModel]()
    
    class func packModelArray() -> [HTExerciseQuestionPageModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "SC", typeKey: HTExerciseQuestionPageType.sc, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "CR", typeKey: HTExerciseQuestionPageType.cr, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "RC", typeKey: HTExerciseQuestionPageType.rc, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "PS", typeKey: HTExerciseQuestionPageType.ps, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            [titleKey: "DS", typeKey: HTExerciseQuestionPageType.ds, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTExerciseQuestionPageModel in
            let model = HTExerciseQuestionPageModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTExerciseQuestionPageType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            model.itemModelArray = HTExerciseQuestionItemModel.packModelArray(model.type)
            return model
        }
        modelArray.first?.selected = true
        return modelArray
    }
}
