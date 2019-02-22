//
//  HTQuestionBackgroundView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTQuestionNavigationDisplayType {
    case minHeight
    case maxHeight
}

class HTQuestionNavigationBar: UIView {
    
    var navigationType: HTQuestionNavigationDisplayType? {
        willSet {
            UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
                switch newValue {
                case .maxHeight?:
                    self.snp.updateConstraints { (maker) in
                        maker.height.equalTo(160)
                    }
                    self.textField.snp.updateConstraints { (maker) in
                        maker.height.equalTo(44)
                    }
                    self.titleLabel.alpha = 1
                    self.detailLabel.alpha = 1
                case .minHeight?:
                    self.snp.updateConstraints { (maker) in
                        maker.height.equalTo(55)
                    }
                    self.textField.snp.updateConstraints { (maker) in
                        maker.height.equalTo(28)
                    }
                    self.titleLabel.alpha = 0
                    self.detailLabel.alpha = 0
                default:
                    break
                }
                self.superview?.layoutIfNeeded()
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIDisplay-Medium", size: 24)
        label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        label.text = "考满分·GMAT 题库"
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFangSC-Light", size: 14)
        label.textColor = UIColor.init(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField.init(frame: CGRect.zero)
        
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        textField.keyboardType = .alphabet
        textField.returnKeyType = .search
        textField.enablesReturnKeyAutomatically = true
        textField.keyboardAppearance = .default
        
        let leftImage = UIImage.init(named: "8a9708fab36c16ae44acea990455b12d")?.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10))
        let leftImageView = UIImageView.init(image: leftImage)
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = "搜索题目"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.08)
        textField.layer.cornerRadius = 3
        textField.layer.masksToBounds = true
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(textField)
        textField.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(-15)
            maker.left.equalTo(20)
            maker.right.equalTo(-20)
            maker.height.equalTo(0)
        }
        detailLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(textField.snp.top).offset(-12)
            maker.left.right.equalTo(textField)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(detailLabel.snp.top).offset(-10)
            maker.left.right.equalTo(textField)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        detailLabel.text = "总收录题目 6440 道"
    }

}
