//
//  ViewConfiguration.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public protocol ViewConfiguration: class {
  func configureViews()
  func buildViewHierarchy()
  func setupConstraints()
  func setupViewConfiguration()
}

public extension ViewConfiguration {
  func setupViewConfiguration() {
    configureViews();
    buildViewHierarchy();
    setupConstraints();
  }
}
