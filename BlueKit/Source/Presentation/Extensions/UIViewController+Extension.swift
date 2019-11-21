//
//  UIViewController+Extension.swift
//  BlueKit
//
//  Created by branderstudio on 7/16/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit

public extension UIViewController {
  
  func setStatusBarStyle(_ style: UIStatusBarStyle) {
    if #available(iOS 13.0, *) {
        let statusBar =  UIView()
        guard
            let frame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame else {
                return
        }
        statusBar.frame = frame
        statusBar.tintColor = style == .lightContent ? .white : .black
        UIApplication.shared.keyWindow?.addSubview(statusBar)
    } else {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
  }
  
  func hideNavigationBar(animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  func showNavigationBar(animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
}
