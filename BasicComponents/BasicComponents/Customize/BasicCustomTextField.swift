//
//  BasicCustomTextField.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

open class BasicCustomTextField: UITextField {
  
  var _allowedActions: [ResponderStandardEditActions]?;
  
  override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    
    if let actions = _allowedActions {
      return actions.map{ $0.selector }.contains(action);
    }
    
    return super.canPerformAction(action, withSender: sender);
  }
}
