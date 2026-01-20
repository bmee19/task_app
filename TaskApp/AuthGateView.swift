import SwiftUI

struct AuthGateView: View {
    @StateObject private var session = SessionStore()

    var body: some View {
        Group {
            if session.user != nil {
                RootTabView()
            } else {
                LoginView {
                }
            }
        }
    }
}
