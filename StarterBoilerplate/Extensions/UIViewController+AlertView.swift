//
//  UIViewController+AlertView.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlertWithTitle(title: String = "", message: String, options: String..., completion: @escaping (Int) -> Void) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           for (index, option) in options.enumerated() {
               alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                   completion(index)
               }))
           }
           self.present(alertController, animated: true, completion: nil)
       }
}
