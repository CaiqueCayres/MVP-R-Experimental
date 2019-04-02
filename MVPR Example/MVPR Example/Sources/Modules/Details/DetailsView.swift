//  DetailsView.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class DetailsView: UIViewController {

    @IBOutlet weak var charImageView: UIImageView?
    @IBOutlet weak var charLabel: UILabel?

    var presenter: DetailsPresenterProtocol?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

extension DetailsView: DetailsViewProtocol {

    func image(for url: String) {
        charImageView?.downloaded(from: url)
    }

    func infos(present name: String) {
        charLabel?.text = name
    }
}
