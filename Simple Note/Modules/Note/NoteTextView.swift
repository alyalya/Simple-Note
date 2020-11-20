import UIKit

class NoteTextView: UITextView {
	private var initialText: String?

	init(initialText: String?) {
		self.initialText = initialText
		super.init(frame: .zero, textContainer: nil)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure() {
		delegate = self
		layer.borderWidth = 1
		layer.borderColor = UIColor.gray.cgColor
		textContainerInset = UIEdgeInsets(
			top: 10,
			left: 10,
			bottom: 10,
			right: 10
		)
		font = .systemFont(ofSize: 25)
		layer.cornerRadius = 5
		text = "Add your note's text here"
		if initialText != nil {
			textColor = .black
		} else { textColor = UIColor.lightGray.withAlphaComponent(0.8) }
	}
}

extension NoteTextView: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		let isPlaceHolderText = textView.text == "Add your note's text here"
		if isPlaceHolderText {
			textView.text = ""
			textView.textColor = .black
		}
		textView.becomeFirstResponder()
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "Add your note's text here"
			textView.textColor = UIColor.lightGray.withAlphaComponent(0.7)
		}
		textView.resignFirstResponder()
	}
}
