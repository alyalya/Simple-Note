import UIKit

class NoteViewController: UIViewController {
    private lazy var titleField = makeTitleField()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}

private extension NoteViewController {
    func setupLayout() {
        view.addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
