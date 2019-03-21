//
//  Navigation.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

var activityIndicatorView = ActivityIndicator()
var activityIndicatorCoverView: UIView = UIView()

final class Navigation {
    
    fileprivate var window: UIWindow!
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        start()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        setupActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        activityIndicatorView.stopAnimating()
    }
    
    private func start() {
        let mainVC = ContactsVC()
        mainVC.viewModel.cellSelectedCompletion = {
            self.proceedToContactDetailsScreen()
        }
        navigationController = UINavigationController(rootViewController: mainVC)
    }
    
    private func proceedToContactDetailsScreen() {
        let contactDetailsVC = ContactDetailsVC()
        contactDetailsVC.editContactDetails = {
            self.proceedToEditContactDetailsScreen()
        }
        navigationController.pushViewController(contactDetailsVC, animated: true)
    }
    
    private func proceedToEditContactDetailsScreen() {
        let editContactDetailsVC = EditContactVC()
        editContactDetailsVC.postSaveCompletion = {
            self.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(editContactDetailsVC, animated: true)
    }

}
