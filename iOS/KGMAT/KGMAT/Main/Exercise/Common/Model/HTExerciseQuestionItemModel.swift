//
//  HTExerciseQuestionItemModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTExerciseQuestionItemType {
    case `default`
}

class HTExerciseQuestionItemModel: NSObject {
    
    var title: String?
    var type: HTExerciseQuestionItemType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    class func packModelArray(_ type: HTExerciseQuestionPageType?) -> [HTExerciseQuestionItemModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        var keyValueArray = [[String: Any]]()
        switch type {
        case .sc?:
            keyValueArray.append(contentsOf: [
                [titleKey: "SC-OG", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "SC-PREP", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "SC-GWD", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "SC-Manhattan", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "SC-Magoosh", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            ])
        case .cr?:
            keyValueArray.append(contentsOf: [
                [titleKey: "CR-OG", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "CR-PREP", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "CR-GWD", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "CR-Manhattan", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "CR-Magoosh", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            ])
        case .rc?:
            keyValueArray.append(contentsOf: [
                [titleKey: "RC-OG", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "RC-PREP", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "RC-GWD", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "RC-Manhattan", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "RC-Magoosh", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            ])
        case .ps?:
            keyValueArray.append(contentsOf: [
                [titleKey: "PS-OG", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "PS-PREP", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "PS-Manhattan", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "PS-Magoosh", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            ])
        case .ds?:
            keyValueArray.append(contentsOf: [
                [titleKey: "DS-OG", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "DS-PREP", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "DS-Manhattan", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
                [titleKey: "DS-Magoosh", typeKey: HTExerciseQuestionItemType.default, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
            ])
        default:
            break
        }
        let modelArray = keyValueArray.map { dictionary -> HTExerciseQuestionItemModel in
            let model = HTExerciseQuestionItemModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTExerciseQuestionItemType
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
