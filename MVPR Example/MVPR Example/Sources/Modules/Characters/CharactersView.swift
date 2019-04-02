//  CharactersView.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class CharactersView: UIViewController {

    @IBOutlet var requestAlertView: UIView?
    
    @IBOutlet weak var tableView: UITableView? {
        didSet{
            tableView?.delegate = self
            tableView?.dataSource = self
            let nib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
            tableView?.register(nib, forCellReuseIdentifier: "CharacterTableViewCell")
            tableView?.rowHeight = UITableView.automaticDimension
            tableView?.estimatedRowHeight = 200
        }
    }

    var presenter: CharactersPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let alert = requestAlertView {
            let center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
            alert.center = center
            alert.removeFromSuperview()
            view.addSubview(alert)
            alert.makeRounded()
        }
    }
}

extension CharactersView: CharactersViewProtocol {

    func reloadTable() {
        tableView?.reloadData()
    }

    func requests(inRequest start: Bool) {
        UIView.animate(withDuration: 0.7, animations: {
            self.requestAlertView?.alpha = start ? 1 : 0
        }) { _ in
            self.requestAlertView?.isHidden = !start
        }
    }
}

extension CharactersView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as? CharacterTableViewCell else { return UITableViewCell() }

        cell.character = presenter?.character(forIndex: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(for: indexPath.row)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrolledRation = scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.frame.height)
        guard scrolledRation > 0.9 else { return }
        presenter?.loadMoreChars()
    }
}

extension CharactersView {

    static func create() -> CharactersView? {
        return UIStoryboard(name: "Main",
                            bundle: nil)
            .instantiateViewController(withIdentifier: "CharactersView") as? CharactersView
    }
}
