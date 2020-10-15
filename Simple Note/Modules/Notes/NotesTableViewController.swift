import UIKit

class NotesTableViewController: UITableViewController {
  private lazy var noteViewController = makeNoteViewController()
  private lazy var notesDataSource = makeNotesDataSource()
  private lazy var dataService = DataService.shared
  
  override init(style: UITableView.Style) {
    super.init(style: style)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func navigateToNote() {
    navigationController?.pushViewController(
      noteViewController,
      animated: true
    )
  }
  
  override func loadView() {
    super.loadView()
    configureLayout()
    if (dataService.data.count == 0) {
      configureEmpty()
    } else {
      tableView.backgroundView = nil
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavBar()
    configureView()
  }
  
  func makeNotesDataSource() -> NotesTableDataSource {
    return NotesTableDataSource(data: dataService.data)
  }
  
  func makeNoteViewController() -> NoteViewController {
    return NoteViewController()
  }
}

// MARK: - UI Setup
extension NotesTableViewController {
  func configureView() {
    title = "Simple Note"
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "plus.square.on.square"),
      style: .done,
      target: self,
      action: #selector(navigateToNote)
    )
  }
  
  func configureEmpty() {
    let emptyTitle = UILabel()
    emptyTitle.text = "Add your first note"
    emptyTitle.textColor = .lightGray
    emptyTitle.font = UIFont.systemFont(ofSize: 35)
    emptyTitle.textAlignment = .center
    tableView.backgroundView = emptyTitle
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
