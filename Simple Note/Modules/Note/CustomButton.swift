import UIKit

class CustomButton: UIButton {
  override var isHighlighted: Bool {
    didSet {
      backgroundColor = isHighlighted ? UIColor.systemGreen.withAlphaComponent(0.75) : .systemGreen
    }
  }
}
