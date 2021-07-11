//
//  UiViewController+Extension.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "Peek App", message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

