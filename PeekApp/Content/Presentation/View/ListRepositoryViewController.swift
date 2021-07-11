//
//  ListRepositoryViewController.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

final class ListRepositoryViewController: UIViewController {

    private let viewModel: ListRepositoryViewModel
    init(viewModel: ListRepositoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
