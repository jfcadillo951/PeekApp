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
    private lazy var refreshControl: UIRefreshControl = {
        .init()
    }()
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
        navigationItem.title = "List of Repositories"
        refreshControl.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        tableView.register(RepositoryTableViewCell.self)
        tableView.register(LoadingTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    func bindViewModel() {
        viewModel.nextArgsObserver.subscribe(onNext: { [weak self] value in
            if value.refreshData {
                self?.reload(args: value)
            } else {
                self?.addElements(args: value)
            }
        }).disposed(by: disposeBag)
        viewModel.errorObserver.subscribe(onNext: { [weak self] value in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.showAlert(message: value)
            }
        }).disposed(by: disposeBag)
    }

    @objc func onRefresh(_ sender: Any) {
        viewModel.onPullToRefresh()
    }

    func reload(args: UiRepositoryArgs) {
        self.items = args.items
        self.hasNext = args.hasNext
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    func addElements(args: UiRepositoryArgs) {
        var insertIndexPaths: [IndexPath] = []
        let count = items.count
        for (i,_) in args.items.enumerated() {
            insertIndexPaths.append(.init(row: count + i, section: 0))
        }
        var reloadIndexPaths: [IndexPath] = []
        if args.hasNext != hasNext {
            reloadIndexPaths.append(.init(row: count + insertIndexPaths.count, section: 0))
        }
        self.items.append(contentsOf: args.items)
        self.hasNext = args.hasNext
        DispatchQueue.main.async {
            self.tableView.performBatchUpdates {
                self.tableView.insertRows(at: insertIndexPaths, with: .automatic)
            } completion: { _ in
                self.tableView.reloadRows(at: reloadIndexPaths, with: .automatic)
            }
            
        }
    }
}

extension ListRepositoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell as? LoadingTableViewCell != nil {
            viewModel.onLoadNext(hasNext: hasNext)
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
                cell.item = items[indexPath.row]
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
