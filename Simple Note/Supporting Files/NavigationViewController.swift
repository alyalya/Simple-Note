import UIKit

class NavigationViewController: UINavigationController {
  override var navigationBar: UINavigationBar {
    super.navigationBar.prefersLargeTitles = true
    return super.navigationBar
  }
}

