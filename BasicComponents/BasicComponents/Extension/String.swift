//
//  String.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension String {
  var hasWhiteSpace: Bool {
    return self.contains(" ");
  }
  
  func removingWhitespaces() -> String {
    return components(separatedBy: .whitespaces).joined();
  }
  
  var htmlToAttributedString: NSAttributedString {
    guard let data = data(using: .utf8) else { return NSAttributedString() }
    do {
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                          .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil);
    } catch {
      return NSAttributedString();
    }
  }
  
  var htmlToString: String {
    return htmlToAttributedString.string;
  }
  
  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude);
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil);
    
    return ceil(boundingBox.height);
  }
  
  func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height);
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil);
    
    return ceil(boundingBox.width);
  }
}
