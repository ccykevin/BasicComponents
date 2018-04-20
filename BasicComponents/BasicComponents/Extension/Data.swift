//
//  Data.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension Data {
  // APNs Token converter
  var hexString: String {
    return map { String(format: "%02.2hhx", arguments: [$0]) }.joined();
  }
}
