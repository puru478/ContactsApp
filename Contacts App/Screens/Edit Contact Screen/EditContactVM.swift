//
//  EditContactVM.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 21/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class EditContactVM: TableViewModelProtocol {
    var tableItemTypes: [CellRepresentable.Type] = [EditContactCellVM.self]

    var tableItems: [CellRepresentable] = []
    
    var reloadTable: completionHandler = nil
    
    init() {
        
    }
    
    func setup() {
        var viewModel = [CellRepresentable]()
        viewModel.append(EditContactCellVM(text: "First Name"))
        viewModel.append(EditContactCellVM(text: "Last Name"))

        viewModel.append(EditContactCellVM(text: "mobile"))
        viewModel.append(EditContactCellVM(text: "email"))
        tableItems = viewModel
        reloadTable?()
    }
    
    
}
