//
//  UITableView+Extensions.swift
//  BeerApp
//
//  Created by Cecilia Andrea Pesce on 23/05/22.
//

import Foundation
import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_ :T.Type) where T:ReusableView {
        register(T.self, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func register<T: UITableViewCell>(_ :T.Type) where T:ReusableView, T:NibLoadableView {
        register(T.nib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_ :T.Type) where T:ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reusableIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_ :T.Type) where T:ReusableView, T:NibLoadableView {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T:ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Could not possible to dequeue \(T.reusableIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T:ReusableView {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reusableIdentifier) as? T else {
            fatalError("Could not possible to dequeue \(T.reusableIdentifier)")
        }
        
        return headerFooterView
    }
    
    func isLastSection(section: Int) -> Bool {
        return self.numberOfSections - 1 == section
    }
    
    func oldIsLastSection(section: Int) -> Bool {
        return self.numberOfSections  == section
    }
    
    func isLastRow(_ indexPath: IndexPath) -> Bool {
        return self.numberOfRows(inSection: indexPath.section) - 1 == indexPath.row
    }
    
    func setTableViewBackgroundGradient(with colors: [CGColor]) {
        let gradientBackgroundColors = colors
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = [0.0, 1.0]
        
        gradientLayer.frame = self.bounds
        let backgroundView = UIView(frame: self.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundView = backgroundView
    }
    
    @discardableResult func insertBackgroundView(withColor color: UIColor) -> UIView {
        // Creating view for extending background color
        var frame = self.bounds
        frame.origin.y = -frame.size.height
        let backgroundView = UIView(frame: frame)
        backgroundView.autoresizingMask = .flexibleWidth
        backgroundView.backgroundColor = color
        
        // Insert at first position
        self.insertSubview(backgroundView, at: 0)
        
        return backgroundView
    }
}



