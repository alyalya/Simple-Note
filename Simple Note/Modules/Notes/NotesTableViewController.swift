import UIKit

class NotesTableViewController: UITableViewController {
  // UI
  private lazy var noteCreatingViewController =
      NoteCreatingViewController(initialText: nil)
  private lazy var notesDataSource =
      NotesTableDataSource(navigationController: navigationController)

  // Data
  private lazy var dataService = DataService.shared

  override func loadView() { // настройка фона
    // Если данных нет, то не создаем TableView

    if (dataService.data.count == 0) {
      view = UIView()
      configureEmpty()
    } else {
      super.loadView()
      configureLayout()
      tableView.backgroundView = nil
    }
  }

  override func viewDidLoad() { // настройка UI
    super.viewDidLoad()
    configureView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView?.reloadData()
  }
}

// UI
private extension NotesTableViewController {
  func configureView() {
    title = "Simple Note"
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "plus.circle"),
      style: .done,
      target: self,
      action: #selector(navigateToNoteCreating)
    )
  }

  @objc func navigateToNoteCreating() {
    navigationController?.pushViewController(
        noteCreatingViewController,
        animated: true
    )
  }

  func configureEmpty() {
    let emptyTitle = UILabel()
    emptyTitle.text = "Add your first note"
    emptyTitle.textColor = .lightGray
    emptyTitle.font = UIFont.systemFont(ofSize: 35)
    emptyTitle.textAlignment = .center

    view.addSubview(emptyTitle)

    emptyTitle.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate {
      emptyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      emptyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }
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
