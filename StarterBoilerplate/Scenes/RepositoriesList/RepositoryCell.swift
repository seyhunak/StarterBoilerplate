//
//  RepositoryCell.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 11/10/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import UIKit

//MARK - RepositoryCell
class RepositoryCell: UITableViewCell {
    @IBOutlet weak var title: UILabel?
    
    var item: Item? {
        didSet {
            if let item = item {
                configure(item: item)
            }
        }
    }
        
    func configure(item: Item) {
        title?.text = item.name
    }
}
