//
//  UILabel+Ext.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(spacing: CGFloat){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        
        let attrString = NSMutableAttributedString(string: self.text ?? "")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))

        self.attributedText = attrString
    }
}

