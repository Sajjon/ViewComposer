//
//  CollectionViewStyleTests.swift
//  ViewComposer
//
//  Created by Alexander Cyon on 2018-04-27.
//

import Foundation
import XCTest
@testable import ViewComposer



class CollectionViewStyleTests: XCTestCase {
    func testMakingCollectionView() {
        let dataSource = ColllectionViewDataSource()
        let collectionView: UICollectionView = [.dataSource(dataSource)]
        assertIs(collectionView.dataSource as? ColllectionViewDataSource, is: dataSource)
    }
}

private class ColllectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        abstract
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        abstract
    }

    fileprivate override init() {}
}
