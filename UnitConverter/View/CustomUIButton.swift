//
//  CustomUIButton.swift
//  UnitConverter
//
//  Created by Ezequiel Parada Beltran on 18/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUIButton: UIButton {
    
    
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    
    
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 0.7554506617, green: 0.7554506617, blue: 0.7554506617, alpha: 0.7977579195)
        
        semanticContentAttribute = .forceRightToLeft
               contentHorizontalAlignment = .right
               let availableSpace = bounds.inset(by: contentEdgeInsets)
               let availableWidth = availableSpace.width - imageEdgeInsets.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
               titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: availableWidth - 5 )
        

        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        layer.borderWidth = 1

    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }

}



