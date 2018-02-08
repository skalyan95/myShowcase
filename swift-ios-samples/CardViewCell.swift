//
//  CardViewCell.swift
//

import UIKit

/// CardViewCell is a better looking alternative to the plain UITableViewCell
class CardViewCell: UITableViewCell {
    
    /// initializes a rounded rect with a white background and a colored border
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderColor = Colors.standardBorder
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        let metrics = ["LR": 10, "TB": 4] // Left-Right Margins, Top-Bottom Margins
        let views = ["c": cardView]
        displayCardView(views: views, metrics: metrics)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// display cardView to give it a "floating" feel
    /// progromatically display cardView with visual format language
    ///
    /// - Parameters:
    ///   - views: dictionary of views, generally from String to View
    ///   - metrics: dictionary of metrics, generally String to Integer
    private func displayCardView(views: [String: Any], metrics: [String: Any]?) {
        self.addSubview(cardView)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-LR-[c]-LR-|", options: [], metrics: metrics, views: views)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-TB-[c]-TB-|", options: [], metrics: metrics, views: views)
        self.addConstraints(hConstraints)
        self.addConstraints(vConstraints)
    }
}
