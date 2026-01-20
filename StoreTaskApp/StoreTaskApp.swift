import SwiftUI
import Firebase

@main
struct StoreTaskAppApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AuthGateView()
        }
    }
}
