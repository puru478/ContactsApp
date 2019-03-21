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
    
    static func setNavigationBar(controller: UIViewController, rightButtonTitles: [String]? = nil, rightButtonAction: [Selector]? = nil) {
        // Remove any previous items
        controller.navigationItem.rightBarButtonItem = nil
        controller.navigationItem.rightBarButtonItems = nil
        
        // Set basic properties
        controller.navigationController?.isNavigationBarHidden = false
        controller.navigationController?.navigationBar.isTranslucent = true
        controller.navigationController?.navigationBar.isOpaque = true
        
        controller.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.teal]
        controller.navigationController?.navigationBar.tintColor = UIColor.teal
        
        // Set right button if not nil
        if rightButtonTitles != nil && rightButtonAction != nil {
            
            var buttons = [UIBarButtonItem]()
            var i = 0
            for title in rightButtonTitles! {
                let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
                button.addTarget(controller, action: rightButtonAction![i], for: UIControl.Event.touchUpInside)
                button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
                let widthConstraint = button.widthAnchor.constraint(equalToConstant: 50)
                let heightConstraint = button.heightAnchor.constraint(equalToConstant: 30)
                heightConstraint.isActive = true
                widthConstraint.isActive = true
                button.setTitle(title, for: .normal)
                button.setTitleColor(.teal, for: .normal)
                let barButton = UIBarButtonItem(customView: button)
                buttons.append(barButton)
                i += 1
            }
            
            controller.navigationItem.rightBarButtonItems = buttons
        }
    }
    
    static func getImage(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
    
    static func getGradient(frame: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        let baseColour = UIColor.teal
        gradient.colors = [UIColor.white.cgColor, baseColour.cgColor]
        return gradient
    }
}
