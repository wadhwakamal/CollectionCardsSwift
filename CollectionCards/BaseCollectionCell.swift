//
//  BaseCollectionCell.swift
//  CollectionCards
//
//  Created by Kamal Wadhwa on 03/01/18.
//  Copyright © 2018 Kamal Wadhwa. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    class var nibName: String { return String(describing: self) }
    class var identifier: String { return String(describing: self) }
    func configureWithItem(_ item: Any) {}
}
