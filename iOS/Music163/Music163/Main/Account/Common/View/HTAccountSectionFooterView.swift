//
//  HTAccountSectionFooterView.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTAccountSectionFooterView: UITableViewHeaderFooterView, ReuseCell {

	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		contentView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.08)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		
	}

}
