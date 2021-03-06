//
//  Bundle.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension Bundle {
  public var releaseVersionNumber: String {
    return infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0";
  }
  public var buildVersionNumber: String {
    return infoDictionary?["CFBundleVersion"] as? String ?? "0";
  }
}
