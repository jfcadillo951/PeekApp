//
//  ListRepositoryViewController.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit
import RxSwift

final class ListRepositoryViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private let viewModel: ListRepositoryViewModel
    private let disposeBag = DisposeBag()
    private var items: [UiRepositoryItem] = []
    private let hasNext = false
    init(viewModel: ListRepositoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.onViewDidLoad()
    }
}

private extension ListRepositoryViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    func bindViewModel() {
        viewModel.nextArgsObserver.subscribe(onNext: { [weak self] value in
            self?.addElements(args: value)
        }).disposed(by: disposeBag)
    }

    func addElements(args: UiRepositoryArgs) {
        var indexPaths: [IndexPath] = []
        let count = items.count
        for (i,_) in args.items.enumerated() {
            indexPaths.append(.init(row: count + i, section: 0))
        }
        if args.hasNext != hasNext {
            indexPaths.append(.init(row: count + indexPaths.count, section: 0))
        }
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: indexPaths, with: .automatic)
        }
    }
}

extension ListRepositoryViewController: UITableViewDelegate {
}

extension ListRepositoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        .init()
    }
}
