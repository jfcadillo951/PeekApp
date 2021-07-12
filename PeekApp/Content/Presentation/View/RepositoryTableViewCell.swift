//
//  RepositoryTableViewCell.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

final class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var ownerNameLabel: UILabel!
    @IBOutlet private var starsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        cleanCell()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cleanCell()
    }

    var item: UiRepositoryItem? {
        didSet {
            guard let item = item else {
                return
            }
            nameLabel.text = item.name
            ownerNameLabel.text = item.ownerName
            starsLabel.text = item.numberOfStars
            if let url = URL(string: item.ownerAvatar) {
                iconImageView.setImage(from: url)
            }
        }
    }
}

private extension RepositoryTableViewCell {
    func setupUI() {
        self.selectionStyle = .none
    }
    func cleanCell() {
        iconImageView.image = nil
        nameLabel.text = ""
        ownerNameLabel.text = ""
        starsLabel.text = ""
    }
}
