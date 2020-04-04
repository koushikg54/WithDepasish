//
//  BaseButton.swift
//  Guulpay
//
//  Created by Rupam Mitra on 06/09/18.
//  Copyright © 2018 Q-Express Online. All rights reserved.
//

import UIKit

@IBDesignable
class BaseButton: UIButton {
    
    @IBInspectable var isRoundCorner: Bool = false
    @IBInspectable var isTotalRound: Bool = false
    @IBInspectable var haveBorder: Bool = false
    @IBInspectable var haveShadow: Bool = false
    @IBInspectable var borderWidth: CGFloat = isiPad() ? 1.0 : 0.5
    @IBInspectable var borderColor: UIColor = .appBorderGray
    @IBInspectable var toIncreaseHitArea: Bool = false
    @IBInspectable var errorMargin: Int = 20
    
    private var shadowLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        self.isExclusiveTouch = true
        if isRoundCorner {
            if isTotalRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                self.layer.cornerRadius = 8.0
            }
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
    
    /// Hit Test check.
    ///
    /// - Parameters:
    ///   - point: point description
    ///   - event: event description
    /// - Returns: return value description
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // if the button is hidden/disabled/transparent it can't be hit
        if self.isHidden || !self.isUserInteractionEnabled || self.alpha < 0.01 { return nil }
        if toIncreaseHitArea {
            let minimumHitArea = CGSize(width: errorMargin, height: errorMargin)
            // increase the hit frame to be at least as big as `minimumHitArea`
            let buttonSize = self.bounds.size
            let widthToAdd = max(minimumHitArea.width - buttonSize.width, 0)
            let heightToAdd = max(minimumHitArea.height - buttonSize.height, 0)
            let largerFrame = self.bounds.insetBy(dx: -widthToAdd / 2, dy: -heightToAdd / 2)
            // perform hit test on larger frame
            return (largerFrame.contains(point)) ? self : nil
        } else {
            let largerFrame = self.bounds.insetBy(dx: 0, dy: 0)
            return (largerFrame.contains(point)) ? self : nil
        }
    }
}

@IBDesignable
class BaseButtonView: UIView {
    
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
