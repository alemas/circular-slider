//
//  CircularSliderView.swift
//  Circular Slider
//
//  Created by Mateus Reckziegel on 18/09/2023.
//

import Foundation
import UIKit

class CircularSliderView: UIControl {
   
    private var circleLayer: CAShapeLayer = CAShapeLayer()
    private var handleLayer: CAShapeLayer = CAShapeLayer()
    
    private var startAngle: CGFloat = 0
    private var endAngle: CGFloat = .pi * 2
    private var radius: CGFloat { min(bounds.width, bounds.height)/2 - circleLineWidth/2 }
    private let circleLineWidth: CGFloat = 100.0
    
    private var value: Double = 0
    private var mainTouch: UITouch?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red.withAlphaComponent(0.5)
        setupLayers()
    }
    
    // MARK: Drawing
    
    private func setupLayers() {
        circleLayer.strokeColor = UIColor.systemBlue.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = circleLineWidth
        
        handleLayer.strokeColor = UIColor.darkGray.cgColor
        handleLayer.fillColor = UIColor.systemYellow.cgColor
        handleLayer.lineWidth = 1.0
        let handleRadius = circleLineWidth
        let handlePath = CGPath(ellipseIn: CGRect(origin: .zero, size: CGSize(width: handleRadius, height: handleRadius)), transform: nil)
        handleLayer.path = handlePath
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(handleLayer)
    }
    
    private func updateHandlePosition() {
        var angle: CGFloat
        
        if let mainTouch {
            var touchPosition = mainTouch.location(in: self)
            angle = bounds.center.angleTo(touchPosition)
        } else {
            angle = startAngle
        }
            
        let unitVector = CGPoint(x: cos(angle), y: sin(angle))
        var newPosition = (bounds.center + unitVector * radius)
        
        newPosition.x -= circleLineWidth/2
        newPosition.y -= circleLineWidth/2
            
        
        CATransaction.commitWithoutAnimation {
            handleLayer.position = newPosition
        }
    }
    
    override func draw(_ rect: CGRect) {
        let center = rect.center
        let circlePath = CGMutablePath()
        circlePath.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        circleLayer.path = circlePath
        updateHandlePosition()
    }
    
    // MARK: User Interaction
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, mainTouch == nil else { return }
        mainTouch = touch
        updateHandlePosition()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let mainTouch, touches.contains(mainTouch) else { return }
        updateHandlePosition()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard mainTouch != nil else { return }
        mainTouch = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard mainTouch != nil else { return }
        mainTouch = nil
    }
}
