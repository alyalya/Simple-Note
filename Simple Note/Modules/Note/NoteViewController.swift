import UIKit

class NoteViewController: UIViewController {
	private let data: NoteData
	private lazy var titleLabel = makeTitleLabel()
	private lazy var textLabel = makeTextLabel()

	init(data: NoteData) {
		self.data = data
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		super.loadView()
		view.backgroundColor = .white
	}
}

private extension NoteViewController {
	func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.text = data.title
		return label
	}

	func makeTextLabel() -> UILabel {
		let label = UILabel()
		label.text = data.text
		return label
	}
}
