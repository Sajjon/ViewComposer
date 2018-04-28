//
//  CollectionView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

public final class CollectionView: UICollectionView, ProxyMade {
    public static func staticallyInitializeSinceLackOfEmptyInit(with style: CollectionViewStyle) -> CollectionView {
        let layout = style.attribute(named: .collectionViewLayout, as: UICollectionViewLayout.self) ?? UICollectionViewFlowLayout()
        return CollectionView(frame: .zero, collectionViewLayout: layout)
    }
}

extension CollectionView: SubKlass {
    public typealias SuperKlassType = UICollectionView
    public func asSuper() -> SuperKlassType { return self as SuperKlassType }
}
