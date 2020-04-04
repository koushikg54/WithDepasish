//
//  Extension+String.swift
//  WOVO
//
//  Created by Esa Sengupta on 22/05/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit

extension String {
    
//    static func formAttributedString(strings: [String], textAttributes: [TextAttributes]) -> NSAttributedString {
//        let attributedString = NSMutableAttributedString(string: strings.first!, attributes: textAttributes.first!)
//        let droppedStrings = strings.dropFirst()
//        let droppedAttributes = textAttributes.dropFirst()
//        for (index, string) in droppedStrings.enumerated() {
//            attributedString.append(NSAttributedString(string: string, attributes: droppedAttributes[index + 1]))
//        }
//        return attributedString
//    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    func toDate(forFormat dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
    
    func localToUTC(fromDateFormat: String, toDateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromDateFormat
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let date = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = toDateFormat
        
        return dateFormatter.string(from: date!)
    }
    
    func UTCToLocal(fromDateFormat: String, toDateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromDateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let date = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = toDateFormat
        
        return dateFormatter.string(from: date!)
    }
    
    func to12HRFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: date!)
    }
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with:
                NSRange(
                    location: 0,
                    length: nsString.length > length ? length : nsString.length)
            )
        }
        return  str
    }
}


