//
//  BasicCustomCollectionView.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

open class BasicCustomCollectionView: UICollectionView {
  
  //Store a completion block as a property
  private var completion: (() -> Void)?;
  
  //Make a custom funciton to reload data with a completion handle
  open func reloadData(completion: @escaping() -> Void) {
    //Set the completion handle to the stored property
    self.completion = completion;
    //Call super
    super.reloadData();
  }
  
  //Override layoutSubviews
  override open func layoutSubviews() {
    super.layoutSubviews();
    //Call the completion
    self.completion?();
    //Set the completion to nil so it is reset and doesn't keep gettign called
    self.completion = nil;
  }
}
