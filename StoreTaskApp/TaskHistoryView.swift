import SwiftUI
import FirebaseFirestore

struct TaskHistoryView: View {
    @State private var tasks: [StoreTask] = []

    var body: some View {
        List {
            ForEach(tasks) { task in
                VStack(alignment: .leading, spacing: 4) {
                    Text(task.productName.isEmpty ? "（商品名なし）" : task.productName)
                        .font(.headline)

                    if !task.note.isEmpty {
                        Text(task.note)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    if let completedAt = task.completedAt {
                        Text("完了: \(completedAt.dateValue().formatted())")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteHistory)
        }
        .navigationTitle("履歴")
        .onAppear(perform: loadHistory)
    }

    func loadHistory() {
        Firestore.firestore()
            .collection("tasks")
            .whereField("status", isEqualTo: "done")
            .order(by: "completedAt", descending: true)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("loadHistory error:", error.localizedDescription)
                    return
                }
                tasks = snapshot?.documents.map {
                    StoreTask(id: $0.documentID, data: $0.data())
                } ?? []
            }
    }

    func deleteHistory(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            Firestore.firestore()
                .collection("tasks")
                .document(task.id)
                .delete { error in
                    if let error = error {
                        print("履歴削除エラー:", error.localizedDescription)
                    }
                }
        }
    }
}
