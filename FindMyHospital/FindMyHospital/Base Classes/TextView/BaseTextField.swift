//
//  BaseTextField.swift
//  Guulpay
//
//  Created by Rupam Mitra on 06/09/18.
//  Copyright © 2018 Q-Express Online. All rights reserved.
//

import UIKit

@IBDesignable class BaseTextField: UITextField {
    
    @IBInspectable var isRoundCorner: Bool = false
    @IBInspectable var isTotalRound: Bool = false
    @IBInspectable var haveBorder: Bool = false
    @IBInspectable var borderWidth: CGFloat = isiPad() ? 1.0 : 0.5
    @IBInspectable var borderColor: UIColor = .appBorderGray
    
    fileprivate var imgIcon: UIImageView?
    
    @IBInspectable var errorEntry: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var leftTextPedding: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var lineColor: UIColor = .clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var placeholderColor: UIColor = .appPlaceholderGray {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var errorColor: UIColor = .red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var imageWidth: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var txtImage: UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    fileprivate func newBounds(_ bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += CGFloat(leftTextPedding) + CGFloat(imageWidth)
        return newBounds
    }
    
    var errorMessage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setting left image
        if txtImage != nil {
            let imgView = UIImageView(image: txtImage)
            imgView.frame = CGRect(x: 0, y: 0, width: CGFloat(imageWidth), height: self.frame.height)
            imgView.contentMode = .center
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = imgView
        }
    }
    
    override func draw(_ rect: CGRect) {
        let height = self.bounds.height
        
        // get the current drawing context
        let context = UIGraphicsGetCurrentContext()
        
        // set the line color and width
        if errorEntry {
            context?.setStrokeColor(errorColor.cgColor)
            context?.setLineWidth(1.0)
        } else {
            context?.setStrokeColor(lineColor.cgColor)
            context?.setLineWidth(1.0)
        }
        
        // start a new Path
        context?.beginPath()
        
        context!.move(to: CGPoint(x: self.bounds.origin.x, y: height - (isiPad() ? 1.0 : 0.5)))
        context!.addLine(to: CGPoint(x: self.bounds.size.width, y: height - (isiPad() ? 1.0 : 0.5)))
        // close and stroke (draw) it
        context?.closePath()
        context?.strokePath()
        
        //Setting custom placeholder color
        if let strPlaceHolder: String = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: strPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: self.font!])
        }
        
        //setting left image
        if txtImage != nil {
            let imgView = UIImageView(image: txtImage)
            imgView.frame = CGRect(x: 0, y: 0, width: CGFloat(imageWidth), height: self.frame.height)
            imgView.contentMode = .center
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = imgView
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: CGFloat(imageWidth), height: self.frame.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        if isRoundCorner {
            if isTotalRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                self.layer.cornerRadius = 8.0
            }
            self.layer.masksToBounds = true
        }
        if haveBorder {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
