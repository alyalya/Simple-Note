import UIKit

class TableViewController: UITableViewController {
    private lazy var noteViewController = NoteViewController()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.title = "Simple Note"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .done,
            target: self,
            action: #selector(navigateToNote)
        )
    }
    
    @objc func navigateToNote() {
        navigationController?.pushViewController(noteViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureLayout()
        configureStub()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension TableViewController {
    func configureStub() {
        if tableView.numberOfRows(inSection: 0) == 0 {
            // добавить ячейку со стабом
        }
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        let dataSource = TableDataSource()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}
