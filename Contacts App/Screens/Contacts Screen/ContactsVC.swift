//
//  ContactsVC.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {

    var tableView: UITableView!
    var viewModel: ContactsVM = ContactsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        Helper.setNavigationBar(controller: self, rightButtonTitles: ["+"], rightButtonAction: [#selector(barButtonTitle)])
        title = "Contact"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 10, y: 10,
                                              width: UIScreen.main.bounds.width - 20,
                                              height: UIScreen.main.bounds.height - 20))
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        viewModel.tableItemTypes.forEach { (cellVM) in cellVM.registerCell(tableview: tableView)}
        viewModel.reloadTable = {
            self.tableView.reloadData()
        }
        viewModel.setup()
    }
    
    @objc func barButtonTitle() {
        
    }
}

extension ContactsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.tableItems[indexPath.row].cellInstanatiate(tableview: tableView, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = viewModel.tableItems[indexPath.row]
        cell.cellSelected(tableview: tableView, indexPath: indexPath)
    }
}
