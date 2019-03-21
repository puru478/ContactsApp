//
//  CircleImageLabelView.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 20/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

@IBDesignable class CircleImageLabelView: BaseView {

    @IBInspectable var circleImage : UIImage = UIImage(named: "placeholder_photo")! {
        didSet {
            if let _ = circleImageView {
                circleImageView?.image = circleImage
            }
        }
    }
    @IBInspectable var titleString : NSMutableAttributedString = NSMutableAttributedString.stringAttributes(string: "Jon Doe", color: .black, font: .boldSystemFont(ofSize: 18)) {
        didSet {
            if let _ = labelText {
                labelText?.attributedText = titleString
            }
        }
    }
    
    @IBInspectable var isCameraOptionHidden: Bool = true {
        didSet {
            if let _ = cameraImageView {
                cameraImageView?.isHidden = isCameraOptionHidden
                circleImageView?.isUserInteractionEnabled = !isCameraOptionHidden
            }
        }
    }
    
    var labelText: UILabel?
    var circleImageView: UIImageView?
    var cameraImageView: UIImageView?
    
    override func setup() {
        let padding = bounds.size.width * 0.1
        circleImageView = UIImageView(frame: CGRect(x: padding, y: 0,
                                                        width: bounds.size.width - (padding * 2),
                                                        height: bounds.size.width - (padding * 2)))
        circleImageView?.image = circleImage
        addSubview(circleImageView ?? UIImageView())
        
        cameraImageView = UIImageView(frame: CGRect(x: circleImageView!.bounds.width * 0.7, y: circleImageView!.bounds.width * 0.7, width: circleImageView!.bounds.width * 0.3, height: circleImageView!.bounds.width * 0.3))
        cameraImageView?.image = UIImage(named: "camera_button")
        cameraImageView?.isHidden = isCameraOptionHidden
        circleImageView?.addSubview(cameraImageView ?? UIImageView())
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cameraActiong))
        circleImageView?.isUserInteractionEnabled = !isCameraOptionHidden
        circleImageView?.addGestureRecognizer(tapGesture)
        
        labelText = UILabel(frame: CGRect(x: 0, y: bounds.size.width - bounds.size.width * 0.2,
                                              width: bounds.size.width, height: bounds.size.width * 0.2))
        labelText?.attributedText = titleString
        labelText?.textAlignment = .center
        addSubview(labelText ?? UILabel())
    }
    
    @objc func cameraActiong() {
        print(" camera clicked!! ")
    }
}
