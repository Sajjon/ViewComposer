//
//  MixedViewsViewController.swift
//  Example
//
//  Created by Alexander Cyon on 2017-06-11.
//  Copyright © 2017 Alexander Cyon. All rights reserved.
//


import UIKit
import ViewComposer

private let max: Double = 8
final class MixedViewsViewController: UIViewController, StackViewOwner {

    lazy var slider: UISlider = [.sliderRange(0.0..<max), .sliderValue(max/4), .thumbTintColor(.red), .tintColor(.green)]
    lazy var `switch`: UISwitch = [.on(true), .thumbTintColor(.orange), .tintColor(.blue), .onTintColor(.yellow)]
    lazy var segmentedControl: UISegmentedControl = [.segments([.title("Foo"), .title("Bar")]), .height(44)]
    lazy var searchBar: UISearchBar = [.prompt("This is a prompt"), .placeholder("Type to search"), .searchBarStyle(.prominent), .delegate(self)]
    lazy var pickerView: UIPickerView = [.dataSourceDelegate(self)]
    
    private var views: [UIView] { return [slider, `switch`, segmentedControl, searchBar, pickerView] }
    lazy var stackView: UIStackView = [.arrangedSubviews(self.views), .axis(.vertical), .distribution(.fill), .spacing(20), .layoutMargins(all: 20), .marginsRelative(true)]

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "ViewComposer - MixedViews"
    }
}

extension MixedViewsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Item: \(component+1)-\(row+1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected \(component+1)-\(row+1)")
    }
}

extension MixedViewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching for: `\(searchText)`")
    }
}

