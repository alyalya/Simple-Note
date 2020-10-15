import UIKit

class NotesTableViewCell: UITableViewCell {
  private lazy var label = makeLabel()
  
  override func prepareForReuse() {
    super.prepareForReuse()
    accessoryType = .none
  }
  
  func setup(data: NoteData?) {
    label.text = data?.title
    configure()
  }
  
  func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 25)
    return label
  }
  
  func configure() {
    label.translatesAutoresizingMaskIntoConstraints = false
    addSubview(label)
    NSLayoutConstraint.activate([
      label.heightAnchor.constraint(equalToConstant: 30),
      label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    ])
  }
}
