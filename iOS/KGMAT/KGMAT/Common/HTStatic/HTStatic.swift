//
//  HTStatic.swift
//  Tian
//
//  Created by hublot on 2018/11/29.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTStatic: NSObject {

    static let size = UIScreen.main.currentMode?.size ?? CGSize.zero
    
    static let isX = UIApplication.shared.statusBarFrame.size.height == 44
    
    static let statusHeight: CGFloat = isX ? 44 : 20
    
    static let navigationHeight: CGFloat = 44 + statusHeight
    
    static let tabbarHeight: CGFloat = isX ? 83 : 49
    
}
