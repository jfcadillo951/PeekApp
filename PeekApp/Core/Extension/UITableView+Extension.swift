//
//  UITableView+Extensions.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(
            .init(nibName: T.identifier, bundle: Bundle.main),
            forCellReuseIdentifier: T.identifier)
    }

    func registerClass<T: UITableViewCell>(_ type: T.Type) {
        register(type.self, forCellReuseIdentifier: T.identifier)
    }

    func registerClass<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: Reusable {
        register(type.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    func reusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
                withIdentifier: T.identifier,
                for: indexPath
        ) as? T else {
            fatalError("Expected cell to be of type \(T.identifier)")
        }
        return cell
    }

    func reusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(
                withIdentifier: T.identifier)
                as? T else {
            fatalError("Expected view to be of type \(T.identifier)")
        }
        return view
    }
}

extension UITableViewCell: Reusable {
}
