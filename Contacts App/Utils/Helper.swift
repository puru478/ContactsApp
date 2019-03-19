//
//  Helper.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

struct Helper {
    static func showActivityIndicator() {
        UIApplication.shared.keyWindow?.addSubview(activityIndicatorCoverView)
        UIApplication.shared.keyWindow?.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
    }
    
    static func hideActivityIndicator() {
        activityIndicatorCoverView.removeFromSuperview()
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
    }
}
