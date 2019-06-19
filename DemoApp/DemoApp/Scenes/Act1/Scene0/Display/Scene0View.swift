import Anchorage
import Shared
import UIKit

/**
 The scene's root view.
 The root view is responsible for creating the view hierarchy and holds all subview references.
 */
final class Scene0View: BaseView {
	override func configureView() {
		super.configureView()
		accessibilityIdentifier = Const.Scene0Tests.mainView

		// Put the title in the center.
		addSubview(titleLabel)
		titleLabel.centerAnchors == centerAnchors
		titleLabel.topAnchor >= layoutMarginsGuide.topAnchor
		titleLabel.bottomAnchor <= layoutMarginsGuide.bottomAnchor
		titleLabel.leadingAnchor >= layoutMarginsGuide.leadingAnchor
		titleLabel.trailingAnchor <= layoutMarginsGuide.trailingAnchor

		// Set default styles.
		backgroundColor = R.color.defaultBackground()
		directionalLayoutMargins = Const.Margin.default.directional
	}

	// MARK: - Subviews

	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = R.string.scene0.title()
		label.alpha = 0
		return label
	}()

	// MARK: - Interface Builder

	@IBInspectable private lazy var ibBackgroundColor: UIColor = .white

	override func prepareForInterfaceBuilder() {
		// For crash reports look at '~/Library/Logs/DiagnosticReports/'.
		super.prepareForInterfaceBuilder()
		backgroundColor = ibBackgroundColor
	}
}