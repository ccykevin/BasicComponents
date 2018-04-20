//
//  UIButton.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension UIButton {
  func setBackgroundColor(color: UIColor, forState: UIControlState) {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1));
    UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor);
    UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1));
    let colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.setBackgroundImage(colorImage, for: forState);
  }
}

public extension UIButton {
  // reference: https://www.ctolib.com/ButtonContentEdgeInsets.html
  enum ImagePositionType {
    case top, left, bottom, right;
  }
  
  func setImagePosition(to position: ImagePositionType, space: CGFloat = 0.0) {
    if #available(iOS 10.0, *) {
      self.superview?.layoutIfNeeded();
    } else {
      self.layoutIfNeeded();
    }
    
    guard let titleFrame = self.titleLabel?.frame, let imageFrame = self.imageView?.frame else { return; }
    let imageWidth = imageFrame.size.width;
    let imageHeight = imageFrame.size.height;
    
    let labelWidth = titleFrame.size.width;
    let labelHeight = titleFrame.size.height;
    
    var titleTop, titleLeft, titleBottom, titleRight: CGFloat;
    var imageTop, imageLeft, imageBottom, imageRight: CGFloat;
    
    switch position {
    case .top:
      imageTop = -(labelHeight / 2.0 + space / 2.0);
      imageBottom = (labelHeight / 2.0 + space / 2.0);
      imageLeft = labelWidth / 2.0;
      imageRight = -labelWidth / 2.0;
      
      titleLeft = -imageWidth / 2.0;
      titleRight = imageWidth / 2.0;
      titleTop = imageHeight / 2.0 + space / 2.0;
      titleBottom = -(imageHeight / 2.0 + space / 2.0);
    case .left:
      imageTop = 0;
      imageBottom = 0;
      imageLeft =  -space / 2.0;
      imageRight = space / 2.0;
      
      titleTop = 0;
      titleBottom = 0;
      titleLeft = space / 2;
      titleRight = -space / 2;
    case .bottom:
      imageLeft = (imageWidth + labelWidth) / 2.0 - imageWidth / 2.0;
      imageRight = -labelWidth / 2.0;
      imageBottom = -(labelHeight / 2.0 + space / 2.0);
      imageTop = labelHeight / 2.0 + space / 2.0;
      
      titleTop = -(imageHeight / 2.0 + space / 2.0);
      titleBottom = imageHeight / 2.0 + space / 2.0;
      titleLeft = -imageWidth / 2.0;
      titleRight = imageWidth / 2.0;
    case .right:
      imageTop = 0;
      imageBottom = 0;
      imageRight = -(labelWidth + space / 2.0);
      imageLeft = labelWidth + space / 2.0;
      
      titleTop = 0;
      titleLeft = -(imageWidth + space / 2.0);
      titleBottom = 0;
      titleRight = imageWidth + space / 2.0;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageTop, imageLeft, imageBottom, imageRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleTop, titleLeft, titleBottom, titleRight);
  }
}
