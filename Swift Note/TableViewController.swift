import UIKit

class TableViewController: UITableViewController {
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.title = "Swift Notes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(navigateToNote)
        )
    }
    
    @objc func navigateToNote() {
        navigationController?.pushViewController(NoteViewController(), animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
