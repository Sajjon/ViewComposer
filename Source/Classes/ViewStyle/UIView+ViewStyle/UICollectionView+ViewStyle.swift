//
//  UICollectionView+ViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2017-06-15.
//
//

import Foundation

internal extension UICollectionView {
    func apply(_ style: ViewStyle) {
        style.attributes.forEach {
            switch $0 {
            case .itemSize(let itemSize):
                guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { break }
                flowLayout.itemSize = itemSize
            default:
                break
            }
        }
    }
}
