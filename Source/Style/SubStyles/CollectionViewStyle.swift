//
//  CollectionViewStyle.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-25.
//  Copyright © 2018 cyon. All rights reserved.
//

import UIKit

public class CollectionViewStyle: ViewStyle<CollectionViewAttribute> {
    public override func install(on view: UIView) {
        super.install(on: view)
        guard let collectionView = view as? UICollectionView else { fatalError("not UICollectionView") }
        for (name, value) in attributes {
            let v = value
            switch name {
            case .collectionViewDataSource:
                if let v = v as? UICollectionViewDataSource { collectionView.dataSource = v }
            default:
                print("⚠️ WARNING Not yet supporting attribute with name: `\(name)`, having value: `\(value)`")
                continue
            }
        }
    }
}
