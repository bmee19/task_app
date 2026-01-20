import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

final class UserProfileStore: ObservableObject {

    @Published var userName: String = "未設定"

    func load() {
        guard
            let user = Auth.auth().currentUser,
            let email = user.email
        else { return }

        let ref = Firestore.firestore()
            .collection("users")
            .document(user.uid)

        ref.getDocument { doc, _ in
            if doc?.exists == true {
                let data = doc?.data() ?? [:]
                self.userName = data["name"] as? String ?? "未設定"
            } else {
                ref.setData([
                    "name": "未設定",
                    "email": email
                ])
                self.userName = "未設定"
            }
        }
    }

    func loadOrCreateUserDoc() {
        load()
    }
}
