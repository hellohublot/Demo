//
//  HTFriendNewsModel.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTFriendNewsType {
    case `default`
}

class HTFriendNewsModel: NSObject {
    
    var title: String?
    var type: HTFriendNewsType?
    var text: String?
    var controllerClass: UIViewController.Type?
    var image: String?
    var selectedImage: String?
    var selected: Bool?
    
    var userImage: String?
    var userTitle: String?
    var fansCount: String?
    var imageList = [String]()
    var songTitle: String?
    var songDetail: String?
    var songImage: String?
    var likeCount: String?
    var replyCount: String?
    var shareCount: String?
    
    
    class func packModelArray() -> [HTFriendNewsModel] {
        let titleKey = "titleKey"
        let typeKey = "typeKey"
        let textKey = "textKey"
        let controllerClassKey = "controllerClassKey"
        let imageKey = "imageKey"
        let selectedImageKey = "selectedImageKey"
        let selectedKey = "selectedKey"
        
        
        let userImageKey = "userImageKey"
        let userTitleKey = "userTitleKey"
        let fansCountKey = "fansCountKey"
        let imageListKey = "imageListKey"
        let songTitleKey = "songTitleKey"
        let songDetailKey = "songDetailKey"
        let songImageKey = "songImageKey"
        let likeCountKey = "likeCountKey"
        let replyCountKey = "replyCountKey"
        let shareCountKey = "shareCountKey"
        
        let keyValueArray = [
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
            [titleKey: "每当你发现自己和大多数人站在一边，\n你就该停下来反思一下。\n\n——马克吐温", typeKey: HTFriendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, userImageKey: "06b2bc9713843f953632e1fbe4574b5d", userTitleKey: "pure日月", fansCountKey: "42030粉丝", imageListKey: ["bf01bdaee367460c7ba1c228393e15fe", "b8a33780950bd071c73171ec7bb309a7", "cb9e4ede5ca1e7bc3d07997bfbe18550", "b09d1d22a47c672f1d31813f69ffffc1", "fdb0f3438c2f1b971948c54edfa6fc06", "51af1e659ef4941d64298b3aedaac4b5", "465879ddb49e4ebe2a0ff5e9d5d8285f", "e8c75525a0ae1037618e029c6db39e5c", "2cf78bbfa2bde18f14fefdd44a43a4f0"], songTitleKey: "Per il mio amore", songDetailKey: "Quadro Nuevo", songImageKey: "5dfdf471c8ab94f58d92954d18987053", likeCountKey: "109", replyCountKey: "9", shareCountKey: "23"],
        ]
        let modelArray = keyValueArray.map { dictionary -> HTFriendNewsModel in
            let model = HTFriendNewsModel()
            model.title = dictionary[titleKey] as? String
            model.type = dictionary[typeKey] as? HTFriendNewsType
            model.text = dictionary[textKey] as? String
            model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
            model.image = dictionary[imageKey] as? String
            model.selected = dictionary[selectedKey] as? Bool
            model.selectedImage = dictionary[selectedImageKey] as? String
            
            model.userImage = dictionary[userImageKey] as? String
            model.userTitle = dictionary[userTitleKey] as? String
            model.fansCount = dictionary[fansCountKey] as? String
            model.imageList = dictionary[imageListKey] as? [String] ?? [String]()
            model.songTitle = dictionary[songTitleKey] as? String
            model.songDetail = dictionary[songDetailKey] as? String
            model.songImage = dictionary[songImageKey] as? String
            model.likeCount = dictionary[likeCountKey] as? String
            model.replyCount = dictionary[replyCountKey] as? String
            model.shareCount = dictionary[shareCountKey] as? String

            
            return model
        }
        return modelArray
    }
}
