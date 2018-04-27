//
//  UICollectionView+EmptyInitializableByProxy.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation

extension MakeableByProxy {
    public static func makeProxy<A>(_ attributes: [A]) -> Proxy where A: BaseAttribute {
        return Proxy()
    }
}

extension UICollectionView: ComposableByProxy {
    public typealias Style = CollectionViewStyle
    public typealias Proxy = CollectionView
}
