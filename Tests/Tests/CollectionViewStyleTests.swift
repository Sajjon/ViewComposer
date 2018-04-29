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
        let dataSource = TestCollectionViewDataSource()
        let layout = TestCollectionViewLayout()
        let collectionView: UICollectionView = [.dataSource(dataSource), .collectionViewLayout(layout)]
        assertIs(collectionView.collectionViewLayout as? TestCollectionViewLayout, is: layout)
        assertIs(collectionView.dataSource as? TestCollectionViewDataSource, is: dataSource)
    }
}

class TestCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        abstract
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        abstract
    }

    override init() {}
}

private class TestCollectionViewLayout: UICollectionViewLayout {
    override init() {
        super.init()
    }
    public required init?(coder: NSCoder) { abstract }
}
