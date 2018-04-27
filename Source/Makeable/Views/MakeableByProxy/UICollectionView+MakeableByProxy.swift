//
//  UICollectionView+EmptyInitializableByProxy.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation

extension UICollectionView: ComposableByProxy {
    public typealias SelfMakeable = UICollectionView
    public typealias Style = CollectionViewStyle
    public typealias Proxy = CollectionView
}
