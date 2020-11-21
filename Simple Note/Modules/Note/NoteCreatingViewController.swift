import UIKit

class NoteCreatingViewController: UIViewController {
  // UI
  lazy var titleField = makeTitleField()
  lazy var textView = NoteTextView(initialText: initialText)
  private lazy var button = makeButton()

  // Services
  private let dataService = DataService.shared

  // Data
  private let initialText: String?

  // Life Cycle
  init(initialText: String?) {
    self.initialText = initialText
    super.init(nibName: nil, bundle: nil)
    setupLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    makeNavBar()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    clearScreen()
  }
}

// UI
private extension NoteCreatingViewController {
  func makeNavBar() {
    navigationItem.largeTitleDisplayMode = .never
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

  func makeButton() -> CustomButton {
    let button = CustomButton()
    button.layer.cornerRadius = 5
    button.backgroundColor = .systemGreen
    button.setTitle("Save", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20)

    button.addTarget(self,
                     action: #selector(handleButtonPress),
                     for: .touchUpInside)

    return button
  }

  @objc func handleButtonPress() {
    guard let titleFieldText = titleField.text,
          let textViewText = textView.text else { return }
    dataService.data.append(NoteData(title: titleFieldText, text: textViewText))
    showAlert()
    clearScreen()
    let id = dataService.data.count + 1
    if let initialText = initialText {
      let index = dataService.data.firstIndex(where: {
        guard let item = $0 else { return false }
        return item.text == initialText
      })
      guard let unwrappedIndex = index else { return }
      dataService.data[unwrappedIndex]?.title = titleFieldText
      dataService.data[unwrappedIndex]?.text = textViewText
    } else {
      dataService.data.append(
        NoteData(
          id: id,
          title: titleFieldText,
          text: textViewText
        )
      )
    }
  }

  func showAlert() {
    let alert = UIAlertController(title: "🥳", message: "Твоя заметка сохранена", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "🤝", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
    let id = dataService.data.count + 1
    if let initialText = initialText {
      let index = dataService.data.firstIndex(where: {
        guard let item = $0 else { return false }
        return item.text == initialText
      })
      guard let unwrappedIndex = index else { return }
      dataService.data[unwrappedIndex]?.title = titleFieldText
      dataService.data[unwrappedIndex]?.text = textViewText
    } else {
      dataService.data.append(
        NoteData(
          id: id,
          title: titleFieldText,
          text: textViewText
        )
      )
    }
  }

  func clearScreen() {
    titleField.text?.removeAll()
    textView.text.removeAll()
    titleField.becomeFirstResponder()
    textView.textViewDidEndEditing(textView)
  }

  func setupLayout() {
    view.addSubview(titleField)
    view.addSubview(textView)
    view.addSubview(button)

    view.removeSubviewsNativeConstraints()

    NSLayoutConstraint.activate {
      titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
      titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
      titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      titleField.heightAnchor.constraint(equalToConstant: 40)

      textView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10)
      textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
      textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      textView.heightAnchor.constraint(equalToConstant: 140)

      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      button.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10)
      button.widthAnchor.constraint(equalToConstant: 100)
      button.heightAnchor.constraint(equalToConstant: 40)
    }
  }
}
