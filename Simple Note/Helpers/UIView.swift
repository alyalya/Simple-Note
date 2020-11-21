//
// Created by Anarushka on 20.11.2020.
//

import UIKit

extension UIView {
	func removeSubviewsNativeConstraints() {
		subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
	}
}
