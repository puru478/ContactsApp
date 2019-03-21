//
//  ContactsVM.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

class ContactsVM : TableViewModelProtocol {
    var tableItemTypes: [CellRepresentable.Type] = [ContactCellVM.self]
    
    var tableItems: [CellRepresentable] = []
    
    var reloadTable: completionHandler = nil
    
    var cellSelectedCompletion: completionHandler = nil
    
    init() {

    }
    
    func setup() {
        var viewModel = [CellRepresentable]()
        (0..<10).forEach { (_) in
            let vm = ContactCellVM()
            vm.cellSelectedCompletion = cellSelectedCompletion
            viewModel.append(vm)
        }
        tableItems = viewModel
        reloadTable?()
    }
}
