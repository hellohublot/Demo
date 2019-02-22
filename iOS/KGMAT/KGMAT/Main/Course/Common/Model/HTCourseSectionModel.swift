//
//  HTCourseSectionModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTCourseSectionType {
    case circle
	case open
	case replay
	case live
	case grade
	case story
	case service
}

class HTCourseSectionModel: NSObject, ReuseSectionArray {
    
    var title: String?
    var type: HTCourseSectionType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
	var detail: String?
    
    var modelArray = [Any]()
    
    class func packModelArray() -> [HTCourseSectionModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
		let detailKey = "detailKey"
        let keyValueArray = [
			[titleKey: "", typeKey: HTCourseSectionType.circle, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: ""],
			[titleKey: "每日公开课", typeKey: HTCourseSectionType.open, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: ""],
			[titleKey: "回放更新", typeKey: HTCourseSectionType.replay, textKey: "", controllerClassKey: UIViewController.self, imageKey: "96bf59aadd5e7b17285a85fe32e9b06d", selectedImageKey: "", selectedKey: false, detailKey: "全部"],
            [titleKey: "明日直播预告", typeKey: HTCourseSectionType.live, textKey: "", controllerClassKey: UIViewController.self, imageKey: "0b21c2e92de54a91f1ade9db8f45d90e", selectedImageKey: "", selectedKey: false, detailKey: "近期课表"],
            [titleKey: "精品课程", typeKey: HTCourseSectionType.grade, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: ""],
            [titleKey: "学员故事", typeKey: HTCourseSectionType.story, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: ""],
            [titleKey: "服务说明", typeKey: HTCourseSectionType.service, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: ""],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTCourseSectionModel in
            let model = HTCourseSectionModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTCourseSectionType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
			model.detail = dictionary[detailKey] as? String
			switch model.type {
			case .circle?:
				model.modelArray = [HTCourseCircleModel.packModelArray()]
			case .replay?:
				model.modelArray = [HTCourseReplayModel.packModelArray()]
            case .live?:
                model.modelArray = HTCourseLiveModel.packModelArray()
            case .grade?:
                model.modelArray = [HTCourseGradeModel.packModelArray()]
            case .story?:
                model.modelArray = HTCourseStoryModel.packModelArray()
            case .service?:
                model.modelArray = HTCourseServiceModel.packModelArray()
			default:
				break
			}
            return model
        }
        return modelArray
    }
}
