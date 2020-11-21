import UIKit

class NotesTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
  private let dataService = DataService.shared
  weak private var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    dataService.data.count
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(
        withIdentifier: NotesTableViewCell.id,
        for: indexPath) as? NotesTableViewCell {
      cell.selectionStyle = .none
      cell.setup(data: dataService.data[indexPath.row])

      return cell
    } else {
      return makeMockCell(for: tableView, indexPath)
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let noteData = dataService.data[indexPath.row] else { return }
    let noteViewController = NoteViewController(data: noteData)
    navigationController?.pushViewController(noteViewController, animated: true)
  }
}

private extension NotesTableDataSource {
  func makeMockCell(for tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
    tableView.dequeueReusableCell(
        withIdentifier: NotesTableViewCell.id,
        for: indexPath
    )
  }
}
