import UIKit

class CustomTextField: UITextField {
  let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    super.textRect(forBounds: bounds.inset(by: padding))
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    super.editingRect(forBounds: bounds.inset(by: padding))
  }
}
