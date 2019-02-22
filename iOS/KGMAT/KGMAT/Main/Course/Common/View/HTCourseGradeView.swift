//
//  HTCourseGradeView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseGradeView: UITableViewCell, ReuseCell {
    
    var modelArray = [HTCourseGradeModel]()
    
    lazy var fullGradeView: HTCourseGradeCell = {
        let gradeView = HTCourseGradeCell.init(frame: CGRect.zero, .full)
        return gradeView
    }()
    
    lazy var leftGradeView: HTCourseGradeCell = {
        let gradeView = HTCourseGradeCell.init(frame: CGRect.zero, .left)
        return gradeView
    }()
    
    lazy var rightGradeView: HTCourseGradeCell = {
        let gradeView = HTCourseGradeCell.init(frame: CGRect.zero, .right)
        return gradeView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        contentView.addSubview(fullGradeView)
        contentView.addSubview(leftGradeView)
        contentView.addSubview(rightGradeView)
        fullGradeView.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
            maker.right.equalTo(-15)
            maker.top.equalTo(10)
            maker.height.equalTo(contentView).multipliedBy(0.4)
        }
        leftGradeView.snp.makeConstraints { (maker) in
            maker.top.equalTo(fullGradeView.snp.bottom).offset(10)
            maker.left.equalTo(fullGradeView)
            maker.bottom.equalTo(-20)
        }
        rightGradeView.snp.makeConstraints { (maker) in
            maker.top.bottom.equalTo(leftGradeView)
            maker.right.equalTo(fullGradeView)
            maker.left.equalTo(leftGradeView.snp.right).offset(10)
            maker.width.equalTo(leftGradeView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? [HTCourseGradeModel], model != modelArray else {
            return
        }
        modelArray = model
        fullGradeView.setModel(modelArray.first, for: indexPath)
        leftGradeView.setModel(modelArray[1], for: indexPath)
        rightGradeView.setModel(modelArray.last, for: indexPath)
    }

}
