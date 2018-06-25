//
//  UIApplication.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public extension UIApplication {
  public class var statusBarBackgroundColor: UIColor? {
    get {
      return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor;
    } set {
      (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue;
    }
  }
  
  public static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topViewController(controller: selected);
      }
    } else if let navigationController = controller as? UINavigationController {
      return topViewController(controller: navigationController.visibleViewController);
    } else if let presented = controller?.presentedViewController {
      return topViewController(controller: presented);
    }
    return controller;
  }
}
