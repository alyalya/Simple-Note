import UIKit

class NoteViewController: UIViewController {
	// Data
	private let data: NoteData

	// UI
	private lazy var titleLabel = makeTitleLabel()
	private lazy var textLabel = makeTextLabel()

	// Life Cycle
	init(data: NoteData) {
		self.data = data
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
		makeNavBarButton()
		makeNavBar()
	}
}

// UI
private extension NoteViewController {
	func makeNavBar() {
		navigationItem.largeTitleDisplayMode = .never
	}

	func makeNavBarButton() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			image: UIImage(systemName: "pencil.circle"),
			style: .done,
			target: self,
			action: #selector(editNote)
		)
	}

	@objc func editNote() {
		let editingViewController = NoteCreatingViewController(initialText: data.text)
		editingViewController.titleField.text = data.title
		editingViewController.textView.text = data.text
		navigationController?.pushViewController(
			editingViewController,
			animated: true
		)
	}

	func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.text = data.title
		label.font = UIFont.systemFont(ofSize: 25)
		return label
	}

	func makeTextLabel() -> UILabel {
		let label = UILabel()
		label.text = data.text
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 20)
		return label
	}

	func setupLayout() {
		view.addSubview(titleLabel)
		view.addSubview(textLabel)

		view.removeSubviewsNativeConstraints()

		NSLayoutConstraint.activate {
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
			titleLabel.heightAnchor.constraint(equalToConstant: 40)

			textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
			textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
			textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		}
	}
}
