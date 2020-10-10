import UIKit

class NotesTableViewController: UITableViewController {
    let data: Array<NoteData?> = [
        NoteData(title: "First Note", text: "About Swift"),
        NoteData(title: "Second Note", text: "About UIKit"),
    ]
    
    private lazy var noteViewController = NoteViewController()
    private lazy var notesDataSource = NotesTableDataSource()

    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    @objc func navigateToNote() {
        navigationController?.pushViewController(
            noteViewController,
            animated: true
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureStub()
        configureView()
    }
    
    override func loadView() {
        super.loadView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension NotesTableViewController {
    func configureStub() {
        if tableView.numberOfRows(inSection: 0) == 0 {
            // добавить ячейку со стабом
        }
    }
    
    func configureView() {
        title = "Simple Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .done,
            target: self,
            action: #selector(navigateToNote)
        )
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        tableView.dataSource = notesDataSource
        tableView.delegate = notesDataSource
        
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}
