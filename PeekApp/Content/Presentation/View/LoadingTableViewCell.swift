//
//  LoadingTableViewCell.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    var hasNext: Bool = false{
        didSet {
            activityIndicator.isHidden = !hasNext
            setupUI()
        }
    }
}

private extension LoadingTableViewCell {
    func setupUI() {
        activityIndicator.startAnimating()
        
    }
}
