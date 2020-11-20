import UIKit

class CustomButton: UIButton {
  override var isHighlighted: Bool {
    willSet(state) {
      backgroundColor =
      state ? UIColor.systemGreen.withAlphaComponent(0.75)
      : .systemGreen
    }
  }
}
