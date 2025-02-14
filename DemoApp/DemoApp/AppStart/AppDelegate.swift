import AppFolder
import ServerWorker
import Shared
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
	/// The reference to the window.
	var window: UIWindow?
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Setup logger.
		Log.setup()
		Log.debug("App's home directory:\n\n\(AppFolder.baseURL.path)\n\n------")

		// Create window.
		let window = UIWindow(frame: UIScreen.main.bounds)
		self.window = window
		window.backgroundColor = R.color.defaultBackground()

		// Load config file.
		let configName = ConfigLoader.getConfigName(forCommandLineArguments: CommandLine.arguments)
		let config = ConfigLoader.getConfig(named: configName)
		Log.debug("Config: \(config)\n\n------")

		// Prepare initial act & scene.
		let setupModel = SetupModel.Scene0()
		let sceneType = Act1Scene.scene0(setupModel)
		let dependencies = Act1DC(
			configuration: config,
			settings: InternalSettings(),
			serverWorker: ServerWorker(baseUrl: config.backendUrl)
		)
		let scene = dependencies.factory.scene(sceneType)

		// Show the scene.
		window.rootViewController = scene
		window.makeKeyAndVisible()

		// Make sure device orientation changes are broadcasted.
		UIDevice.current.beginGeneratingDeviceOrientationNotifications()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {}

	func applicationDidEnterBackground(_ application: UIApplication) {}

	func applicationWillEnterForeground(_ application: UIApplication) {}

	func applicationDidBecomeActive(_ application: UIApplication) {}

	func applicationWillTerminate(_ application: UIApplication) {}
}
