import UIKit

class NotesTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let label = UILabel()
        label.text = "Add your first note"
        let createMockCell: () -> UITableViewCell = {
            return tableView.dequeueReusableCell(
                withIdentifier: "TableViewCell",
                for: indexPath
            )
        }
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TableViewCell",
                for: indexPath
        ) as? NotesTableViewCell else { return createMockCell() }
        cell.configure()
        
        return cell
    }
}
