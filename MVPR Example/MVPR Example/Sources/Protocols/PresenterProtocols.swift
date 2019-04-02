//  MVPC Presenter Protocols
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import Foundation
import UIKit

protocol Presenter: class {

    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisapear()
}

extension Presenter {

    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDisapear() {}
}

typealias TableViewPresenter = (Presenter, UITableViewDelegate, UITableViewDataSource)

typealias CollectionViewPresenter = (Presenter, UICollectionViewDelegate, UICollectionViewDataSource)
