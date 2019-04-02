//
//  CharacterTableViewCell.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 14/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var charImageView: UIImageView?
    @IBOutlet weak var fisrtLabel: UILabel?
    @IBOutlet weak var secondLabel: UILabel?
    @IBOutlet weak var thirdLabel: UILabel?

    var character: Character? {
        didSet{
            fisrtLabel?.text = character?.name
            secondLabel?.text = character?.status
            thirdLabel?.text = character?.gender
            charImageView?.downloaded(from: character?.image ?? "")
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backView.makeRounded()
        charImageView?.makeRounded()
        backgroundColor = .clear
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        charImageView?.image = nil
    }
}
