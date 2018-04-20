//
//  UINavigationController.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension UINavigationController {
  private func doAfterAnimatingTransition(animated: Bool, completion: @escaping (() -> Void)) {
    if let coordinator = transitionCoordinator, animated {
      coordinator.animate(alongsideTransition: nil, completion: { _ in
        completion();
      })
    } else {
      DispatchQueue.main.async {
        completion();
      }
    }
  }
  
  public func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping (() -> Void)) {
    pushViewController(viewController, animated: animated);
    doAfterAnimatingTransition(animated: animated, completion: completion);
  }
  
  public func popViewController(animated: Bool, completion: @escaping (() -> Void)) {
    popViewController(animated: animated);
    doAfterAnimatingTransition(animated: animated, completion: completion);
  }
  
  public func popToRootViewControllerAnimated(animated: Bool, completion: @escaping (() -> Void)) {
    popToRootViewController(animated: animated);
    doAfterAnimatingTransition(animated: animated, completion: completion);
  }
}
