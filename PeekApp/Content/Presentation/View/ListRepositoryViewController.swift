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
    private var hasNext = true
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
    }
}

private extension ListRepositoryViewController {
    func setupUI() {
        tableView.register(RepositoryTableViewCell.self)
        tableView.register(LoadingTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
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
//        if args.hasNext != hasNext {
//            indexPaths.append(.init(row: count + indexPaths.count, section: 0))
//        }
        self.items.append(contentsOf: args.items)
        self.hasNext = args.hasNext
        DispatchQueue.main.async {
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}

extension ListRepositoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell as? LoadingTableViewCell != nil {
            viewModel.onNextPage(hasNext: hasNext)
        }
    }
}

extension ListRepositoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < items.count {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: RepositoryTableViewCell.identifier,
                for: indexPath) as? RepositoryTableViewCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: LoadingTableViewCell.identifier,
                for: indexPath) as? LoadingTableViewCell {
                cell.hasNext = hasNext
                return cell
            }
        }
        return .init()
    }
}
