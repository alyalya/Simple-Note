//
// Created by Anaruska on 20.11.2020.
//

import UIKit

@_functionBuilder
struct ConstraintBuilder {
	static func buildBlock(_ attributes: NSLayoutConstraint...) -> [NSLayoutConstraint] {
		attributes
	}
}

extension NSLayoutConstraint {
	static func activate(@ConstraintBuilder _ constraints: () -> [NSLayoutConstraint]) {
		activate(constraints())
	}
}