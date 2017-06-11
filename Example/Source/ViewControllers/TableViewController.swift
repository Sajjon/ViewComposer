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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = titleForRow(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Comparison"
        case 1:
            return "ViewComposer only"
        default:
            return nil
        }
    }
}

private extension TableViewController {
    func setupViews() {
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let router = self.routerForRow(at: indexPath)
        router.push(onto: navigationController)
    }

    func routerForRow(at indexPath: IndexPath) -> NavigationRouter {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return NavigationRouter(NestedStackViewsViewController.self, vanilla: VanillaNestedStackViewsViewController.self)
            case 1:
                return NavigationRouter(LabelsViewController.self, vanilla: VanillaLabelsViewController.self)
            case 2:
                return NavigationRouter(LoginViewController.self, vanilla: VanillaLoginViewController.self)
            default:
                fatalError("oh no")
            }
        case 1:
            switch indexPath.row {
            case 0:
                return NavigationRouter(SimpleCustomAttributeViewController.self)
            case 1:
                return NavigationRouter(TriangleViewController.self)
            case 2:
                return NavigationRouter(MixedViewsViewController.self)
            case 3:
                return NavigationRouter(MakeableTableViewController.self)
            case 4:
                return NavigationRouter(MakeableCollectionViewController.self)
            default:
                fatalError("oh no")
            }
        default:
            fatalError("oh no")
        }
    }
    
    func titleForRow(at indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return "Nested Stackviews"
            case 1:
                return "Labels"
            case 2:
                return "LoginViewController"
            default:
                fatalError("oh no")
            }
        case 1:
            switch indexPath.row {
            case 0:
                return "Custom attribute: FooLabel (simple)"
            case 1:
                return "Custom attribute: TriangleView (advanced)"
            case 2:
                return "Mixed Views"
            case 3:
                return "TableView"
            case 4:
                return "CollectionView"
            default:
                fatalError("oh no")
            }
        default:
            fatalError("oh no")
        }
    }
}

struct NavigationRouter {
    
    let vanillaViewControllerType: UIViewController.Type?
    let viewComposerViewControllerType: UIViewController.Type
    
    init(_ viewComposer: UIViewController.Type, vanilla: UIViewController.Type? = nil) {
        self.viewComposerViewControllerType = viewComposer
        self.vanillaViewControllerType = vanilla
    }
    
    func push(onto navigationController: UINavigationController?) {
        guard let navigationController = navigationController else { return }
        let viewComposerViewController = viewComposerViewControllerType.init()
        if let vanilla = vanillaViewControllerType {
            let alert = UIAlertController()
            alert.addAction(actionForVanilla(true, viewController: vanilla.init(), navigationController: navigationController))
            alert.addAction(actionForVanilla(false, viewController: viewComposerViewController, navigationController: navigationController))
            navigationController.present(alert, animated: true, completion: nil)
        } else {
            navigationController.pushViewController(viewComposerViewController, animated: true)
        }
    }
    
    
    func actionForVanilla(_ vanilla: Bool, viewController: UIViewController, navigationController: UINavigationController) -> UIAlertAction {
        let title = vanilla ? "Vanilla" : "ViewComposer"
        let action = UIAlertAction(title: title, style: .default) { _ in
            navigationController.pushViewController(viewController, animated: true)
        }
        return action
    }
    
}
