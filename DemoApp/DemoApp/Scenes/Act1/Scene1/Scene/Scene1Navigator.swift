import UIKit

/// The navigator for this scene.
final class Scene1Navigator {
	/// A weak reference to the scene's view controller this router performs transitions on.
	/// Has to be assigned via property injection after initialization.
	weak var viewController: UIViewController?

	/// A reference to the dependecy resolver.
	private let dependencies: Act1DependenciesInterface

	init(dependencies: Act1DependenciesInterface) {
		self.dependencies = dependencies
	}
}

// MARK: - Scene1NavigatorInterface

extension Scene1Navigator: Scene1NavigatorInterface {
	func scene2(setupModel: SetupModel.Scene2, user: User) {
		guard let source = viewController,
			let navController = source.navigationController
		else {
			fatalError("Source for navigation not provided")
		}

		let act2Dependencies = dependencies.createAct2Dependencies(user: user)
		let destination = act2Dependencies.scene(Act2Scene.scene2(setupModel))
		navController.pushViewController(destination, animated: true)
	}
}
