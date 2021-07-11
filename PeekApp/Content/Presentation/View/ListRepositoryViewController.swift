//
//  ListRepositoryViewController.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

final class ListRepositoryViewController: UIViewController {

    convenience init(viewModel: ListRepositoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle.main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
