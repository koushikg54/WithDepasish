//
//  SwitchView.swift
//  Streamtree
//
//  Created by Rupam Mitra on 02/01/18.
//  Copyright © 2018 EDIFY. All rights reserved.
//

import UIKit

class SwitchView: UIView {
    
    var buttonColor: UIColor?
    var selectedTextColor: UIColor?
    var deselectedTextColor: UIColor?
    var firstButtonText: String?
    var secondButtonText: String?
    var borderColor: UIColor?
    var borderWidth: CGFloat = 0.0
    var font: UIFont?
    
    var didSwitch: ((_ index: Int) -> Void)?
    private var buttonBackgroundView: UIView?
    private var buttonLeft: UIButton?
    private var buttonRight: UIButton?
    private var selectedIndex = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        removeAll()
        
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        
        buttonBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: self.bounds.height))
        
        buttonBackgroundView!.backgroundColor = buttonColor
        buttonBackgroundView!.layer.cornerRadius = self.bounds.height / 2
        
        buttonBackgroundView!.layer.shadowColor = UIColor.black.cgColor
        buttonBackgroundView!.layer.shadowRadius = 8.0
        buttonBackgroundView!.layer.shadowOpacity = 0.5
        buttonBackgroundView!.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        buttonLeft = UIButton(frame: CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: self.bounds.height))
        buttonRight = UIButton(frame: CGRect(x: self.bounds.width / 2, y: 0, width: self.bounds.width / 2, height: self.bounds.height))
        
        buttonLeft!.imageView?.tag = 0
        buttonRight!.imageView?.tag = 1
        
        self.addSubview(buttonBackgroundView!)
        self.addSubview(buttonRight!)
        self.addSubview(buttonLeft!)
        
        buttonLeft!.setTitle(firstButtonText ?? "", for: .normal)
        buttonRight!.setTitle(secondButtonText ?? "", for: .normal)
        
        buttonLeft!.setTitleColor(selectedTextColor ?? .black, for: .selected)
        buttonRight!.setTitleColor(selectedTextColor ?? .black, for: .selected)
        
        buttonLeft!.setTitleColor(deselectedTextColor ?? .white, for: .normal)
        buttonRight!.setTitleColor(deselectedTextColor ?? .white, for: .normal)
        
        buttonLeft!.titleLabel?.font = font!
        buttonRight!.titleLabel?.font = font!
        
        buttonRight!.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        buttonLeft!.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        deselectAll()
        buttonLeft!.isSelected = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            printLog("Switch View Selected Index \(self.selectedIndex)")
            self.animateButton(toIndex: self.selectedIndex)
        }
    }
    
    private func deselectAll() {
        buttonLeft?.isSelected = false
        buttonRight?.isSelected = false
    }
    
    private func removeAll() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func animateButton(toIndex index: Int) {
        deselectAll()
        if index == 0 {
            buttonLeft?.isSelected = true
        } else {
            buttonRight?.isSelected = true
        }
        UIView.animate(withDuration: 0.2) {
            if index == 0 {
                self.buttonBackgroundView?.frame = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: self.bounds.height)
            } else {
                self.buttonBackgroundView?.frame = CGRect(x: self.bounds.width / 2, y: 0, width: self.bounds.width / 2, height: self.bounds.height)
            }
        }
    }
    
    @objc private func buttonAction(_ button: UIButton) {
        guard !button.isSelected else {
            return
        }
        self.animateButton(toIndex: button.imageView!.tag)
        didSwitch?(button.imageView!.tag)
    }
    
    func setIndex(_ index: Int) {
        self.selectedIndex = index
        self.animateButton(toIndex: index)
    }
}
