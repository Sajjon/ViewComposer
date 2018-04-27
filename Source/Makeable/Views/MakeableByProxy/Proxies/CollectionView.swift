//
//  CollectionView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

public final class CollectionView: UICollectionView, ProxyMade {
    public typealias ProxyAttribute = CollectionViewAttribute

    public static func staticallyInitializeSinceLackOfEmptyInit(with attributes: [ProxyAttribute]) -> CollectionView {
        let layout = attributes.attribute(named: .collectionViewLayout, as: UICollectionViewLayout.self) ?? UICollectionViewFlowLayout()
        return CollectionView(frame: .zero, collectionViewLayout: layout)
    }
}
