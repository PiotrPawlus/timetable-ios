//
//  UITextField+Extension.swift
//  TimeTable
//
//  Created by Piotr Pawluś on 26/10/2018.
//  Copyright © 2018 Railwaymen. All rights reserved.
//

import UIKit

extension UITextField: UIElementLocalizedType {
    
    @IBInspectable var localizedStringKey: String? {
        set (newKey) {
            placeholder = newKey?.localized
        } get {
            return placeholder
        }
    }
}
