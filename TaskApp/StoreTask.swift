import Foundation
import FirebaseFirestore

struct StoreTask: Identifiable {
    let id: String
    let productName: String
    let note: String
    let x: Double
    let y: Double
    let status: String
    let completedAt: Timestamp?

    init(id: String, data: [String: Any]) {
        self.id = id
        self.productName = data["productName"] as? String ?? ""
        self.note = data["note"] as? String ?? ""
        self.x = data["x"] as? Double ?? 0
        self.y = data["y"] as? Double ?? 0
        self.status = data["status"] as? String ?? "open"
        self.completedAt = data["completedAt"] as? Timestamp
    }
}
