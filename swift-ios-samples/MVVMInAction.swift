//
//  MVVMInAction.swift
//

import UIKit

/// ViewModel for ConfirmWithdrawController
class ConfirmWithdrawModel {
    
    var withdrawRequest: WithdrawModel.WithdrawRequest // contains information about the withdraw
    let titles: [String]
    let subtitles = ["Current balance", "Withdrawal amount", "PayPal email"]
    var actionSheetTitle: String { return "Withdraw $\(String.init(format: "%.2f", arguments: [withdrawRequest.amount])) from your account?" }
    
    init(request: WithdrawModel.WithdrawRequest) {
        withdrawRequest = request
        let balance = "$" + String.init(format: "%.2f", arguments: [request.balance])
        let amount = "$" + String.init(format: "%.2f", arguments: [request.amount])
        let email = request.email
        titles = [balance, amount, email]
    }
    
    /// withdraw calls the network layer of the app, contained in a class called Lambda
    func withdraw(completion: @escaping(Bool) -> Void) {
        Lambda.withdraw(request: withdrawRequest) { (isSuccess) in
            DispatchQueue.main.async {
                completion(isSuccess)
            }
        }
    }
}

class ConfirmWithdrawController: UITableViewController {
    
    private let viewModel: ConfirmWithdrawModel
    
    // dependency injection at initilization
    init(viewModel: ConfirmWithdrawModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.configure(register: [:], seperatorStyle: .singleLine, allowsSelection: false, isScrollEnabled: false)
        navigationItem.title = "Review"
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Withdraw", style: .plain, target: self, action: #selector(promptConfirmationWithdraw)), animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// Prompt an action sheet to make sure user really wants to withdraw
    @objc private func promptConfirmationWithdraw() {
        navigationItem.rightBarButtonItem?.isEnabled = false
        self.presentActionSheet(title: viewModel.actionSheetTitle, message: nil, actionTitle: "Withdraw") {
            self.withdraw()
        }
    }
    
    /// Actually withdraw
    private func withdraw() {
        navigationController?.navigationBarUserInteraction(enabled: false)
        self.viewModel.withdraw(completion: { (isSuccess) in
            let title = isSuccess ? "Withdraw submitted" : "Error"
            let message = isSuccess ? "Note: It can take 2-5 business days to process your withdrawal" : "There was an error in your withdrawal"
            isSuccess ? DCFeedbackGenerator.notification(type: .success) : DCFeedbackGenerator.notification(type: .error)
            self.presentAlert(title: title, message: message, completion: {
                self.navigationController?.popToRootViewController(animated: true)
            })
        })
    }
}

// MARK: - tableView methods
extension ConfirmWithdrawController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .subtitle, identifier: nil, text: viewModel.titles[indexPath.row], detailText: viewModel.subtitles[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return DCSectionHeaderView(leftTitle: "Review the details", rightTitle: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return DCSectionHeaderView.standardHeight
    }
}


























