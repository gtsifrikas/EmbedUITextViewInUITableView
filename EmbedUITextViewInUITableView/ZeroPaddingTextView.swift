//
//  ZeroPaddingTextView.swift
//  UI
//
//  Created by George Tsifrikas on 28/10/2018.
//  Copyright © 2018 George Tsifrikas. All rights reserved.
//

import UIKit

@IBDesignable class ZeroPaddingTextView: UITextView {

    override func layoutSubviews() {
        super.layoutSubviews()
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
    
}
