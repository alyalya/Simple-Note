import UIKit

class NotesTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
  private let dataService = DataService.shared
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int { dataService.data.count }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let createMockCell: () -> UITableViewCell = {
      tableView.dequeueReusableCell(
        withIdentifier: "TableViewCell",
        for: indexPath
      )
    }
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "TableViewCell",
      for: indexPath
    ) as? NotesTableViewCell else { return createMockCell() }
    cell.selectionStyle = .none
    cell.setup(data: dataService.data[indexPath.row])
    
    return cell
  }
}
