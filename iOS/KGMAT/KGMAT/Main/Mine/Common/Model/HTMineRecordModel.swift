//
//  HTMineRecordModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineRecordType {
    case `default`
}

class HTMineRecordModel: NSObject {
    
    var title: String?
    var type: HTMineRecordType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var separatorInset = UIEdgeInsets.zero
    
    class func packModelArray() -> [HTMineRecordModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        let keyValueArray = [
            [titleKey: "学习记录", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "898843694c0bd7367c5d0e65217bc123", selectedImageKey: "", selectedKey: false],
            [titleKey: "我的笔记", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b320311794079ab2a3d0ac5ee8000b16", selectedImageKey: "", selectedKey: false],
            [titleKey: "我的课程", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e1f47fe1ba10ebcf521aee9b51708019", selectedImageKey: "", selectedKey: false],
            [titleKey: "我的消息", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "7666683bb561010cfd62b40aa0e2f89e", selectedImageKey: "", selectedKey: false],
            [titleKey: "设置", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "3d89cbe935eb4b7ed41aa7f47504dc56", selectedImageKey: "", selectedKey: false],
            [titleKey: "给我们反馈", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "53b00c94110277fddc4352099643c62c", selectedImageKey: "", selectedKey: false],
            [titleKey: "关于考满分", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "a9d66833d03b9ce634ee9f0d9324bcc1", selectedImageKey: "", selectedKey: false],
            [titleKey: "给我们好评", typeKey: HTMineRecordType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "38edeb2914514ae14bf04cc64b89bebb", selectedImageKey: "", selectedKey: false],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTMineRecordModel in
            let model = HTMineRecordModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTMineRecordType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            model.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
            return model
        }
        modelArray.last?.separatorInset = UIEdgeInsets.zero
        return modelArray
    }
}
