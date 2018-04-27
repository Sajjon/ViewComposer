//
//  CollectionViewAttribute+Attributes.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

public extension CollectionViewAttribute {
    public static func dataSource<A>(_ value: UICollectionViewDataSource?) -> A where A: CollectionViewAttribute {
        return A(name: .collectionViewDataSource, value: value as Any)
    }

    public static func collectionViewLayout<A>(_ value: UICollectionViewLayout) -> A where A: CollectionViewAttribute {
        return A(name: .collectionViewLayout, value: value as Any)
    }
}
