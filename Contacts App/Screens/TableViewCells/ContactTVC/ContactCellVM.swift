//
//  ContactCellVM.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ContactCellVM {
    var cellSelectedCompletion: completionHandler = nil
    
    init() {}
}

extension ContactCellVM : CellRepresentable {
    static func registerCell(tableview: UITableView) {
        tableview.register(UINib(nibName: "ContactTVC", bundle: nil), forCellReuseIdentifier: "ContactTVC")
    }
    
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell : ContactTVC = tableview.dequeueReusableCell(withIdentifier: "ContactTVC", for: indexPath) as! ContactTVC
        cell.selectionStyle = .none
        return cell
    }
    
    func cellSelected(tableview _: UITableView, indexPath _: IndexPath) {
        cellSelectedCompletion?()
    }
}
