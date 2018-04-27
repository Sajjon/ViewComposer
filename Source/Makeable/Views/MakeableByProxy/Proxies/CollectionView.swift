//
//  CollectionView.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import UIKit

public final class CollectionView: UICollectionView, EmptyInitializable {
    public required convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
}
