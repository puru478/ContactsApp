//
//  EditContactCellVM.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 21/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class EditContactCellVM {
    
    var textString: String
    
    init(text: String) {
        textString = text
    }
}

extension EditContactCellVM : CellRepresentable {
    static func registerCell(tableview: UITableView) {
        tableview.register(EditContactTVC.self, forCellReuseIdentifier: "EditContactTVC")
    }
    
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell : EditContactTVC = tableview.dequeueReusableCell(withIdentifier: "EditContactTVC", for: indexPath) as! EditContactTVC
        cell.prepare(vm: self)
        cell.selectionStyle = .none
        return cell
    }
}
