//
//  HTTabBar.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTTabBar: UITabBar {

	private var cachedSafeAreaInsets = UIEdgeInsets.zero
	
	override var safeAreaInsets: UIEdgeInsets {
		
		if #available(iOS 11.0, *) {
			let insets = super.safeAreaInsets
			if insets.bottom < bounds.height {
				cachedSafeAreaInsets = insets
			}
		}
		
		return cachedSafeAreaInsets
	}

}
