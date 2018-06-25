//
//  Collection.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension Collection {
  public subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index]: nil;
  }
}
