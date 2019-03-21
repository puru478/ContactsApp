//
//  EditContactTVC.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 21/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class EditContactTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(vm: EditContactCellVM) {
        let label = UILabel(frame: CGRect(x: bounds.width * 0.1, y: 0, width: bounds.width * 0.3, height: bounds.height))
        label.textAlignment = .right
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = UIColor.whiteGrey

        addSubview(label)
        backgroundColor = .whiteGrey
        label.text = vm.textString
        
        let textfield = UITextField(frame: CGRect(x: bounds.width * 0.45, y: 0, width: bounds.width * 0.55, height: bounds.height))
        textfield.backgroundColor = .whiteGrey
        textfield.text = "9629770310"
        addSubview(textfield)
    }
    
}
