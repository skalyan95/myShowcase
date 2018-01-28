//
//  TableViewExtension.swift
//

// MARK: - Extensions related to UITableViewController
extension UITableViewController {
    
    /// Method dependency injection for quick customization of UITableView
    ///
    /// - Parameters:
    ///   - register: Dictionary mapping cell identifiers to cell classes
    ///   - seperatorStyle: Style of seperation between cells (line or no line)
    ///   - allowsSelection: Allow any cell to be selected
    ///   - isScrollEnabled: Enable tableView to be scrolled
    func configure(register: [String: AnyClass], seperatorStyle: UITableViewCellSeparatorStyle, allowsSelection: Bool, isScrollEnabled: Bool) {
        self.tableView.tableFooterView = UIView()
        self.tableView.allowsSelection = allowsSelection
        self.tableView.isScrollEnabled = isScrollEnabled
        self.tableView.separatorStyle = seperatorStyle
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.backgroundColor = DCColors.standardBackground
        for (id, cellClass) in register {
            self.tableView.register(cellClass, forCellReuseIdentifier: id)
        }
    }
}
