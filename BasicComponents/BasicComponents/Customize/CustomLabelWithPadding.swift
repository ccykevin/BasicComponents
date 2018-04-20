//
//  CustomLabelWithPadding.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

open class CustomLabelWithPadding: UILabel {
  
  let padding: UIEdgeInsets;
  
  // Create a new PaddingLabel instance programamtically with the desired insets
  required public init(padding: UIEdgeInsets = UIEdgeInsets.zero) {
    self.padding = padding;
    super.init(frame: CGRect.zero);
  }
  
  // Create a new PaddingLabel instance programamtically with default insets
  override init(frame: CGRect) {
    padding = UIEdgeInsets.zero; // set desired insets value according to your needs
    super.init(frame: frame);
  }
  
  // Create a new PaddingLabel instance from Storyboard with default insets
  required public init?(coder aDecoder: NSCoder) {
    padding = UIEdgeInsets.zero; // set desired insets value according to your needs
    super.init(coder: aDecoder);
  }
  
  override open func drawText(in rect: CGRect) {
    super.drawText(in: UIEdgeInsetsInsetRect(rect, padding));
  }
  
  // Override `intrinsicContentSize` property for Auto layout code
  override open var intrinsicContentSize: CGSize {
    let superContentSize = super.intrinsicContentSize;
    let width = superContentSize.width + padding.left + padding.right;
    let heigth = superContentSize.height + padding.top + padding.bottom;
    return CGSize(width: width, height: heigth);
  }
  
  // Override `sizeThatFits(_:)` method for Springs & Struts code
  override open func sizeThatFits(_ size: CGSize) -> CGSize {
    let superSizeThatFits = super.sizeThatFits(size);
    let width = superSizeThatFits.width + padding.left + padding.right;
    let heigth = superSizeThatFits.height + padding.top + padding.bottom;
    return CGSize(width: width, height: heigth);
  }
}
