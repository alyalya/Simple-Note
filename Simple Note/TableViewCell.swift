import UIKit

class TableViewCell: UITableViewCell {
    private lazy var emptyTitle = makeEmptyTitle()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
    
    func makeEmptyTitle() -> UILabel {
        let title = UILabel()
        title.text = "Add your first note"
        return title
    }
    
    func configure() {
        emptyTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emptyTitle)
        NSLayoutConstraint.activate([
            emptyTitle.heightAnchor.constraint(equalToConstant: 20),
            emptyTitle.topAnchor.constraint(equalTo: topAnchor),
            emptyTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
}
