//
//  SectionHeaderView.swift
//  ParallaxScroll
//
//  Created by m4c on 2020/04/05.
//  Copyright © 2020 cloudeleven. All rights reserved.
//

import UIKit

protocol SectionHeaderViewDelegate: class {
    func onButton1Tapped(button: UIButton)
    func onButton2Tapped(button: UIButton)
}

class SectionHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

    weak var delegate: SectionHeaderViewDelegate?
    
    @IBAction func onButton1Tapped(_ sender: UIButton) {
        print("button1")
        delegate?.onButton1Tapped(button: sender)
    }
    
    @IBAction func onButton2Tapped(_ sender: UIButton) {
        print("button2")
        delegate?.onButton2Tapped(button: sender)
    }
}
