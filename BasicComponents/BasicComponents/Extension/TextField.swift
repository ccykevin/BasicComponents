//
//  TextField.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public enum ResponderStandardEditActions {
  case cut, copy, paste, select, selectAll, delete;
  case makeTextWritingDirectionLeftToRight, makeTextWritingDirectionRightToLeft;
  case toggleBoldface, toggleItalics, toggleUnderline;
  case increaseSize, decreaseSize;
  
  public var selector: Selector {
    switch self {
    case .cut:
      return #selector(UIResponderStandardEditActions.cut);
    case .copy:
      return #selector(UIResponderStandardEditActions.copy);
    case .paste:
      return #selector(UIResponderStandardEditActions.paste);
    case .select:
      return #selector(UIResponderStandardEditActions.select);
    case .selectAll:
      return #selector(UIResponderStandardEditActions.selectAll);
    case .delete:
      return #selector(UIResponderStandardEditActions.delete);
    case .makeTextWritingDirectionLeftToRight:
      return #selector(UIResponderStandardEditActions.makeTextWritingDirectionLeftToRight);
    case .makeTextWritingDirectionRightToLeft:
      return #selector(UIResponderStandardEditActions.makeTextWritingDirectionRightToLeft);
    case .toggleBoldface:
      return #selector(UIResponderStandardEditActions.toggleBoldface);
    case .toggleItalics:
      return #selector(UIResponderStandardEditActions.toggleItalics);
    case .toggleUnderline:
      return #selector(UIResponderStandardEditActions.toggleUnderline);
    case .increaseSize:
      return #selector(UIResponderStandardEditActions.increaseSize);
    case .decreaseSize:
      return #selector(UIResponderStandardEditActions.decreaseSize);
    }
  }
}
