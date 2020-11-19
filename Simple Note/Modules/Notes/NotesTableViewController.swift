import UIKit

class NotesTableViewController: UITableViewController {
  private lazy var noteCreatingViewController =
    makeNoteCreatingViewController()
  private lazy var notesDataSource = makeNotesDataSource()
  private lazy var dataService = DataService.shared

  override init(style: UITableView.Style) { // работа с данными
    super.init(style: style)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func navigateToNoteCreating() {
    navigationController?.pushViewController(
      noteCreatingViewController,
      animated: true
    )
  }
  
  override func loadView() { // настройка фона
    super.loadView()
    configureLayout()
    if (dataService.data.count == 0) {
      configureEmpty()
    } else {
      tableView.backgroundView = nil
    }
  }
  
  override func viewDidLoad() { // настройка UI
    super.viewDidLoad()
    configureNavBar()
    configureView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

  func makeNotesDataSource() -> NotesTableDataSource {
    NotesTableDataSource(navigationController: navigationController)
  }
  
  func makeNoteCreatingViewController() -> NoteCreatingViewController {
    NoteCreatingViewController()
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
      action: #selector(navigateToNoteCreating)
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
    
    tableView.register(
      NotesTableViewCell.self,
      forCellReuseIdentifier: "TableViewCell"
    )
  }
}
