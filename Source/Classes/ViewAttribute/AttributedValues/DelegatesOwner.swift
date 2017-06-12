//
//  DelegatesOwner.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-10.
//
//

import Foundation

protocol DelegatesOwner: class {
    var delegateProxy: NSObjectProtocol? { get set }
}

extension DelegatesOwner {
    func setDelegate(_ delegate: NSObjectProtocol?) {
        delegateProxy = delegate
    }
}

extension UITextField: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UITextFieldDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}

extension UITextView: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UITextViewDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}

extension UITableView: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UITableViewDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}

extension UICollectionView: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UICollectionViewDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}

extension UIPickerView: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UIPickerViewDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}

extension UISearchBar: DelegatesOwner {
    var delegateProxy: NSObjectProtocol? {
        get { return self.delegate }
        set {
            guard let specificDelegate = newValue as? UISearchBarDelegate else { return }
            self.delegate = specificDelegate
        }
    }
}
