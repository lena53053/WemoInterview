//
//  WemoCell.swift
//  WemoInterview
//
//  Created by Lena Lai on 4/7/20.
//  Copyright © 2020 Lena Lai. All rights reserved.
//

import Foundation
import UIKit

enum WemoCellType{
    case Success
    case Warning
    case Danger
    case Info
}

class WemoCell:UITableViewCell{
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var isSelectCell:Bool = false
    
    var type:WemoCellType = .Success{
        didSet{
            if isSelectCell{
                self.subTitleLabel.isHidden = false
            }else{
                self.subTitleLabel.isHidden = true
            }
            
            switch type {
            case .Success:
                self.title = "我是成功樣式"
                self.subtitle = ""
            case .Warning:
                self.title = "我是警告樣式"
                self.subtitle = "我被點了"
            case .Danger:
                self.title = "我是危險樣式"
                self.subtitle = ""
            case .Info:
                self.title = "我是資訊樣式"
                self.subtitle = ""
            }
        }
    }
    
    var title:String = ""{
        didSet{
            self.titleLabel.text = title
        }
    }
    
    var subtitle:String = ""{
        didSet{
            self.subTitleLabel.text = subtitle
        }
    }
    
    var isDisabled:Bool = false{
        didSet{
            if isDisabled{
                self.backgroundColor = UIColor.lightGray
                self.isUserInteractionEnabled = false
            }else{
                self.backgroundColor = UIColor.white
                self.isUserInteractionEnabled = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subTitleLabel.isHidden = true
    }
}
