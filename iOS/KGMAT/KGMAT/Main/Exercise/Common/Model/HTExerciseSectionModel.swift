//
//  HTExerciseSectionModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTExerciseSectionType {
    case count
	case question
	case hard
	case guide
}

class HTExerciseSectionModel: NSObject, ReuseSectionArray {
    
    var title: String?
    var type: HTExerciseSectionType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
	
	var modelArray = [Any]()
    
    class func packModelArray() -> [HTExerciseSectionModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "", typeKey: HTExerciseSectionType.count, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "材料练习", typeKey: HTExerciseSectionType.question, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "难易练习", typeKey: HTExerciseSectionType.hard, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "备考指南", typeKey: HTExerciseSectionType.guide, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTExerciseSectionModel in
            let model = HTExerciseSectionModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTExerciseSectionType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .count?:
				model.modelArray = HTExerciseCountModel.packModelArray()
			case .question?:
				model.modelArray = HTExerciseQuestionModel.packModelArray()
			case .hard?:
				model.modelArray = HTExerciseHardModel.packModelArray()
			case .guide?:
				model.modelArray = HTExerciseGuideModel.packModelArray()
			default:
				break
			}
            return model
        }
        return modelArray
    }
}
