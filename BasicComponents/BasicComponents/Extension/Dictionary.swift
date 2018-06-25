//
//  Dictionary.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension Dictionary where Key == String {
  public subscript(caseInsensitive key: Key) -> Value? {
    get {
      guard let exists = keys.first(where: { $0.caseInsensitiveCompare(key) == .orderedSame }) else { return nil; }
      return self[exists];
    }
    set {
      if let exists = keys.first(where: { $0.caseInsensitiveCompare(key) == .orderedSame }) {
        self[exists] = newValue;
      } else {
        self[key] = newValue;
      }
    }
  }
}

