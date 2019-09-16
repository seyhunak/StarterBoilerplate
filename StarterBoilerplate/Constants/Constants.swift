//
//  Constants.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import UIKit

let screenWidth  = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

enum Constants {
    enum Api {
        static let apiUrl = "https://api.github.com/"
        static let term = "term"
        static let limit = "limit"
        static let endpoint = "search/repositories"
    }
    
    enum String {
        static let alertMessageForItemRemoved = "This content will not be shown again."
        static let ok = "Ok"
        static let remove = "Remove"
        static let cancel = "Cancel"
        static let nothing = "Nothing to show :("
    }
    
    enum Storyboard {
        static let main = "Main"
    }
}
