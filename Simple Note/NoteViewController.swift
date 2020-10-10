import UIKit

class NoteViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
