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
        
//        semanticContentAttribute = .forceRightToLeft
//               contentHorizontalAlignment = .right
              
        layer.borderWidth = 1
      
    }
    
    func customize(tittle: String) {
        setTitle(tittle, for: .normal)

        
       transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
           

           
//           layer.borderWidth = 1

       }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }

}



