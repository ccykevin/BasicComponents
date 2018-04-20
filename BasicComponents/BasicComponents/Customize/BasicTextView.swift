//
//  BasicTextView.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

/**
 Reference: https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview
 **/
@IBDesignable open class BasicTextView: UITextView {
  override open func layoutSubviews() {
    super.layoutSubviews();
    setup();
  }
  private func setup() {
    textContainerInset = UIEdgeInsets.zero;
    textContainer.lineFragmentPadding = 0;
    contentInset = UIEdgeInsets.zero;
  }
}
