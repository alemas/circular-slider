//
//  CGPoint+Extension.swift
//  Circular Slider
//
//  Created by Mateus Reckziegel on 06/10/2023.
//

import Foundation

extension CGPoint {
    
    static func + (_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func - (_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func * (_ lhs: CGPoint, _ rhs: CGFloat) -> CGPoint {
        CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    func angleTo(_ point: CGPoint) -> CGFloat {
        atan2(point.y - self.y, point.x - self.x)
    }
    
}
