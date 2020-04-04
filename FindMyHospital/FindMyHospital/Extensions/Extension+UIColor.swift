//
//  Extension+UIColor.swift
//  WOVO
//
//  Created by Esa Sengupta on 21/05/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    static var appNavBlue: UIColor {
        return UIColorRGB(red: 22, green: 88, blue: 139)
    }
    static var appNavStatusBar: UIColor {
        return UIColorRGB(red: 55, green: 111, blue: 155)
    }
    
    static var appBlue: UIColor {
        return UIColorRGB(red: 0, green: 146, blue: 211)
    }
    
    static var appDarkGray: UIColor {
        return UIColorRGB(red: 60, green: 60, blue: 60)
    }
    
    static var appBorderGray: UIColor {
        return UIColorRGB(red: 200, green: 200, blue: 200)
    }
    
    static var appBorderDarkGray: UIColor {
        return UIColorRGB(red: 186, green: 186, blue: 186)
    }
    
    static var appTextGray: UIColor {
        return UIColorRGB(red: 178, green: 178, blue: 178)
    }
    
    static var appPlaceholderGray: UIColor {
        return UIColorRGB(red: 170, green: 170, blue: 170)
    }
    
    static var appDeselectGray: UIColor {
        return UIColorRGB(red: 70, green: 71, blue: 70)
    }
    static var appTabBarGray: UIColor {
        return UIColorRGB(red: 106, green: 106, blue: 106)
    }
    static var appTabBarBlack: UIColor {
        return UIColorRGB(red: 0, green: 0, blue: 0)
    }
    
    static var chatSenderBubble: UIColor {
        return UIColorRGB(red: 162, green: 197, blue: 41)
    }
    static var chatReceiverBubble: UIColor {
        return UIColorRGB(red: 3, green: 173, blue: 239)
    }
    static var rsvpAccepted: UIColor {
        return UIColor(red:0.28, green:0.96, blue:0.09, alpha:1.0)
    }
    static var rsvpDecline: UIColor {
        return UIColor(red:0.96, green:0.13, blue:0.09, alpha:1.0)
    }
    static var rsvpTentive: UIColor {
        return UIColor(red:0.77, green:0.46, blue:0.64, alpha:1.0)
    }
    static var rsvpNone: UIColor {
        return UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    }
    
    private static func addColor(_ color1: UIColor, with color2: UIColor) -> UIColor {
        var (red1, green1, blue1, alpha1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (red2, green2, blue2, alpha2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        
        color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        // add the components, but don't let them go above 1.0
        return UIColor(red: min(red1 + red2, 1), green: min(green1 + green2, 1), blue: min(blue1 + blue2, 1), alpha: (alpha1 + alpha2) / 2)
    }
    
    private static func multiplyColor(_ color: UIColor, by multiplier: CGFloat) -> UIColor {
        var (red, green, blue, alpha) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * multiplier, green: green * multiplier, blue: blue * multiplier, alpha: alpha)
    }
    
    static func + (color1: UIColor, color2: UIColor) -> UIColor {
        return addColor(color1, with: color2)
    }
    
    static func * (color: UIColor, multiplier: Double) -> UIColor {
        return multiplyColor(color, by: CGFloat(multiplier))
    }
    
}
