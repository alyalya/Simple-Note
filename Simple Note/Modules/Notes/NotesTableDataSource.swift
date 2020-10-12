import UIKit

class NotesTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let data: [NoteData?]
    
    init(data: [NoteData?]) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        cell.setup(data: data[indexPath.row])
        
        return cell
    }
}
