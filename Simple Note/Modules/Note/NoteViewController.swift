import UIKit

class NoteViewController: UIViewController {
  private lazy var titleField = makeTitleField()
  private lazy var textView = makeTextView()
  private lazy var buttonView = makeButtonView()
  private lazy var dataService = DataService.shared
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setupLayout()
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    buttonView.addTarget(
      self,
      action: #selector(handleButtonPress),
      for: .touchUpInside
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMove(toParent parent: UIViewController?) {
    let parentView = parent as? NotesTableViewController
    parentView?.data = dataService.data
    parentView?.tableView.reloadData()
  }
  
  func makeTitleField() -> CustomTextField {
    let input = CustomTextField()
    input.layer.borderWidth = 1
    input.layer.borderColor = UIColor.gray.cgColor
    input.placeholder = "Title"
    input.layer.cornerRadius = 5
    input.font = .systemFont(ofSize: 25)
    return input
  }
  
  func makeTextView() -> UITextView {
    let textArea = UITextView()
    textArea.layer.borderWidth = 1
    textArea.layer.borderColor = UIColor.gray.cgColor
    textArea.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    textArea.font = .systemFont(ofSize: 25)
    textArea.layer.cornerRadius = 5
    return textArea
  }
  
  func makeButtonView() -> CustomButton {
    let button = CustomButton()
    button.layer.cornerRadius = 5
    button.backgroundColor = .systemGreen
    button.setTitle("Save", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20)
    return button
  }
  
  @objc func handleButtonPress() {
    guard let titleFieldText = titleField.text,
          let textViewText = textView.text else {
      return
    }
    dataService.data.append(NoteData(title: titleFieldText, text: textViewText))
  }
}

private extension NoteViewController {
  func setupLayout() {
    view.addSubview(titleField)
    view.addSubview(textView)
    view.addSubview(buttonView)
    
    textView.translatesAutoresizingMaskIntoConstraints = false
    titleField.translatesAutoresizingMaskIntoConstraints = false
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      titleField.heightAnchor.constraint(equalToConstant: 40),
      
      textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10),
      textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      textView.heightAnchor.constraint(equalToConstant: 140),
      
      buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
      buttonView.widthAnchor.constraint(equalToConstant: 100),
      buttonView.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
