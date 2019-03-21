//
//  ContactDetailsVC.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 21/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

class ContactDetailsVC: UIViewController {

    var viewModel = ContactDetailsVM()
    
    var editContactDetails: completionHandler = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Helper.setNavigationBar(controller: self, rightButtonTitles: ["Edit"], rightButtonAction: [#selector(barButtonTitle)])
        createTopView()
    }
    
    func createTopView() {
        let navigationHeight = navigationController?.navigationBar.frame.maxY ?? 44
        let topViewHeight = UIScreen.main.bounds.height * 0.5
        
        let topView = UIView(frame: CGRect(x: 0, y: navigationHeight, width: UIScreen.main.bounds.width, height: topViewHeight))
        view.addSubview(topView)
        
        let topImageView = UIImageView(frame: topView.bounds)
        topImageView.image = Helper.getImage(fromLayer: Helper.getGradient(frame: topView.bounds))
        topImageView.alpha = 0.4
        topView.addSubview(topImageView)
        
        let halfWidth = topImageView.bounds.height * 0.6
        let halfOfScreen = UIScreen.main.bounds.width * 0.5
        
        let circularImage = CircleImageLabelView.init(frame: CGRect(x: halfOfScreen - (halfWidth / 2),
                                                                    y: topImageView.bounds.height * 0.1,
                                                                    width: halfWidth,
                                                                    height: halfWidth))
        topView.addSubview(circularImage)
        
        let optionsViewWidth = topImageView.bounds.width * 0.85
        let options = UIStackView(frame: CGRect(x: topImageView.bounds.width * 0.075, y: topImageView.bounds.height - (optionsViewWidth / 4), width: optionsViewWidth, height: optionsViewWidth / 5))
        options.axis = .horizontal
        options.distribution = .fillEqually
        let xOffset = (optionsViewWidth/4) - (optionsViewWidth / 5)
        options.spacing = xOffset
        let optionsStrings = ["call", "email", "message", "favourite"]
        let optionsImageStrings = ["call_button", "email_button", "message_button", "favourite_button"]
        for i in 0..<optionsStrings.count {
            let option = CircleImageLabelView.init(frame: CGRect(x: 0,
                                                                 y: 0,
                                                                 width: optionsViewWidth / 5,
                                                                 height: optionsViewWidth / 5))
            option.titleString = NSMutableAttributedString.stringAttributes(string: optionsStrings[i], color: .black, font: .systemFont(ofSize: 11))
            option.circleImage = UIImage(named: optionsImageStrings[i]) ?? UIImage(named: "placeholder_photo")!
            options.addArrangedSubview(option)
        }
        topView.addSubview(options)
        
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: topView.frame.maxY,
                                                  width: UIScreen.main.bounds.width,
                                                  height: topViewHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.whiteGrey
        tableView.bounces = false
        viewModel.tableItemTypes.forEach { (cellTypes) in
            cellTypes.registerCell(tableview: tableView)
        }
        viewModel.reloadTable = {
            tableView.reloadData()
        }
        viewModel.setup()
        view.addSubview(tableView)
    }
    
    
    @objc func barButtonTitle() {
        print("Bar button tapped!")
        editContactDetails?()
    }
}

extension ContactDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.tableItems[indexPath.row].cellInstanatiate(tableview: tableView, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
