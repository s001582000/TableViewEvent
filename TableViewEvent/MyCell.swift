//
//  MyCell.swift
//  TableViewEvent
//
//  Created by 梁雅軒 on 2017/2/25.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    typealias touchBlock = (_ index:Int) -> Void
    var mblock:touchBlock?
    @IBOutlet weak var cstAddViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnPush: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setInfo(info:MyInfo,block:@escaping (_ index:Int) -> Void) {
        if info.isSpecial {
            cstAddViewHeight.constant = info.isSelect ? 44 : 0
            mblock = block
            self.layoutIfNeeded()
        }else{
            lblMessage.text = info.title
        }
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        mblock?(self.tag)
    }
}
