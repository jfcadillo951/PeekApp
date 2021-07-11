//
//  UIImageView+Extension.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(from URL: URL) {
        self.sd_setImage(with: URL,
                         placeholderImage: nil,
                         options: [.continueInBackground, .highPriority],
                         completed: nil)
    }
}
