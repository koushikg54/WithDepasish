//
//  BaseView.swift
//  Guulpay
//
//  Created by Rupam Mitra on 06/09/18.
//  Copyright © 2018 Q-Express Online. All rights reserved.
//

import UIKit

@IBDesignable
class BaseView: UIView {
    
    @IBInspectable var isRoundCorner: Bool = false
    @IBInspectable var isTotalRound: Bool = false
    @IBInspectable var haveBorder: Bool = false
    @IBInspectable var haveShadow: Bool = true
    @IBInspectable var haveGrayShadow: Bool = false
    @IBInspectable var borderWidth: CGFloat = isiPad() ? 1.0 : 0.5
    @IBInspectable var borderColor: UIColor = .appBorderGray
    
    private var shadowLayer: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
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
        if haveShadow {
            if shadowLayer == nil {
                shadowLayer = CAShapeLayer()
                layoutIfNeeded()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
                shadowLayer.fillColor = backgroundColor?.cgColor
                
                shadowLayer.shadowColor = UIColor.appBorderGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize.zero
                shadowLayer.shadowOpacity = 0.6
                shadowLayer.shadowRadius = 2.0
                
                layer.insertSublayer(shadowLayer, at: 0)
            }
        }
        if haveGrayShadow {
            if shadowLayer == nil {
                layer.masksToBounds = false
                layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                layer.shadowOpacity = 0.5
                layer.shadowOffset = .zero
                layer.shadowRadius = 2
                self.layer.cornerRadius = 8
            }
            
        }
    }
}

@IBDesignable
class BaseImageView: UIImageView {
    
    @IBInspectable var isRoundCorner: Bool = false
    @IBInspectable var isTotalRound: Bool = false
    @IBInspectable var haveBorder: Bool = false
    @IBInspectable var haveShadow: Bool = false
    @IBInspectable var borderWidth: CGFloat = isiPad() ? 1.0 : 0.5
    @IBInspectable var borderColor: UIColor = .appBorderGray
    
    private var shadowLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
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
        if haveShadow {
            if shadowLayer == nil {
                shadowLayer = CAShapeLayer()
                layoutIfNeeded()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
                shadowLayer.fillColor = backgroundColor?.cgColor
                
                shadowLayer.shadowColor = UIColor.appBorderGray.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize.zero
                shadowLayer.shadowOpacity = 0.6
                shadowLayer.shadowRadius = 2.0
                
                layer.insertSublayer(shadowLayer, at: 0)
            }
        }
    }
}
