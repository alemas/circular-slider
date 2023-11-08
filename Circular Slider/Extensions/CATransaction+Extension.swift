//
//  CATransaction+Extension.swift
//  Circular Slider
//
//  Created by Mateus Reckziegel on 06/10/2023.
//

import Foundation
import UIKit

extension CATransaction {
    
    static func commitWithoutAnimation(_ action: () -> ()) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        action()
        CATransaction.commit()
    }
    
}
