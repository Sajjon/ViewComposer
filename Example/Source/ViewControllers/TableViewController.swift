//
//  TableViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-02.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//

import UIKit

private let cellIdentifier = "cell"
final class TableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = titleForRow(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(at: indexPath)
    }
    
}


private extension TableViewController {
    func setupViews() {
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let alert = UIAlertController()
        alert.addAction(actionForRow(at: indexPath, vanilla: true))
        alert.addAction(actionForRow(at: indexPath, vanilla: false))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func actionForRow(at indexPath: IndexPath, vanilla: Bool) -> UIAlertAction {
        let title = vanilla ? "Vanilla" : "ViewComposer"
        let action = UIAlertAction(title: title, style: .default) { _ in
            let router = self.routerForRow(at: indexPath, vanilla: vanilla)
            router.push(onto: self.navigationController)
        }
        return action
    }
    
    func routerForRow(at indexPath: IndexPath, vanilla: Bool) -> NavigationRouter {
        let row = indexPath.row
        let viewControllerType: UIViewController.Type
        switch row {
        case 0:
            viewControllerType = vanilla ? VanillaNestedStackViewsViewController.self : NestedStackViewsViewController.self
        case 1:
            viewControllerType = vanilla ? VanillaLabelsViewController.self : LabelsViewController.self
        default:
            fatalError("oh no")
        }
        return NavigationRouter(viewControllerType: viewControllerType)
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        let row = indexPath.row
        switch row {
        case 0:
            return "Buttons"
        case 1:
            return "Labels"
        default:
            fatalError("oh no")
        }
    }
}

struct NavigationRouter {
    
    let viewControllerType: UIViewController.Type
    
    func push(onto navigationController: UINavigationController?) {
        guard let navigationController = navigationController else { return }
        let viewController = viewControllerType.init()
        navigationController.pushViewController(viewController, animated: true)
    }
}
