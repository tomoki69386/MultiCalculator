//
//  MCButton.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/26.
//

import UIKit

public class MCButton: UIButton {
    
    public override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.darkGray
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.clipsToBounds = true
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 28, weight: .bold))
        self.backgroundColor = .darkGray
    }
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        self.layer.cornerRadius = frame.size.height / 2
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = rect.height / 2
    }
}
