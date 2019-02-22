//
//  HTQuestionModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTQuestionStoreType {
    case `default`
}

class HTQuestionStoreModel: NSObject {
    
    var title: String?
    var detail: String?
    var type: HTQuestionStoreType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var fullStarCount = 0
    var separatorInset = UIEdgeInsets.zero
    
    
    class func packModelArray() -> [HTQuestionStoreModel] {
        let titleKey = "titleKey"
        let detailKey = "detailKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let fullStarCountKey = "fullStarCountKey"
        let keyValueArray = [
            [titleKey: "Official Guide 官方指南", detailKey: "备考必备，权威材料", fullStarCountKey: 3, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "c3720d5861b737c1a14f7383fdfca5e5", selectedImageKey: "", selectedKey: false],
            [titleKey: "GMAT PREP 官方模考", detailKey: "备考必备，权威材料", fullStarCountKey: 3, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e91165fb007b7018bebe4f2e64ad0f96", selectedImageKey: "", selectedKey: false],
            [titleKey: "冲刺700+，这些词汇就够了！", detailKey: "免费领取，名师精讲", fullStarCountKey: 3, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2f32cf6e66d30f40e7d45613e70cf84f", selectedImageKey: "", selectedKey: false],
            [titleKey: "GWD 真题破解", detailKey: "精简真题，年代较久", fullStarCountKey: 2, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "07dfed6c18ff816b08e20a38f1bfb04a", selectedImageKey: "", selectedKey: false],
            [titleKey: "Manhattan 复习题集", detailKey: "参考使用", fullStarCountKey: 2, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "6dd57ea0dc95ce0088a17e0bf6602297", selectedImageKey: "", selectedKey: false],
            [titleKey: "Magoosh 模考题集", detailKey: "新进内容，补充练习", fullStarCountKey: 1, typeKey: HTQuestionStoreType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "87eca052e6700d89bf3c2db674494eb1", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTQuestionStoreModel in
            let model = HTQuestionStoreModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTQuestionStoreType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            model.detail = dictionary[detailKey] as? String
            model.fullStarCount = dictionary[fullStarCountKey] as? Int ?? 0
            model.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
            return model
        }
        modelArray.last?.separatorInset = UIEdgeInsets.zero
        return modelArray
    }
}
