//
//  UIColour+Extension.swift
//  Base Project Setup
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func colorFromHexString(_ hexString: String) -> UIColor {
        let hexString: NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        return self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    static var strongBlue: UIColor {
        return colorFromHexString("25499e")
    }
    
    static var lightBlue: UIColor {
        return colorFromHexString("24a7e3")
    }
    
    static var whiteGrey: UIColor {
        return colorFromHexString("F2F3F6")
    }
}
