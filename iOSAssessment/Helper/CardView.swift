//
//  CardView.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 07/05/2024.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 8 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 2) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCardView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupCardView()
    }
    
    private func setupCardView() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        backgroundColor = .white
    }
}
