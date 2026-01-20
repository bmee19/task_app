import Foundation
import Combine
import FirebaseAuth

final class SessionStore: ObservableObject {
    @Published var user: User? = Auth.auth().currentUser

    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        handle = Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }

    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
