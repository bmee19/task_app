import Foundation
import FirebaseFirestore

struct ChatMessage: Identifiable {
    let id: String
    let text: String
    let userId: String
    let userName: String
    let createdAt: Timestamp

    init(id: String, data: [String: Any]) {
        self.id = id
        self.text = data["text"] as? String ?? ""
        self.userId = data["userId"] as? String ?? ""
        self.userName = data["userName"] as? String ?? "no name"
        self.createdAt = data["createdAt"] as? Timestamp ?? Timestamp()
    }
    var timeString: String {
        let date = createdAt.dateValue()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
