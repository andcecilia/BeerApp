//
//  ReusableView.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 23/05/22.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {}
public extension ReusableView where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

public protocol NibLoadableView: AnyObject {
    static var bundle: Bundle { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(
            nibName: nibName,
            bundle: bundle
        )
    }
    
    static func loadFromBundle() -> Self? {
        guard let view = bundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?[0] as? Self else {
            return nil
        }
        
        return view
    }
}
