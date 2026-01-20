import SwiftUI
import FirebaseFirestore

struct TaskListView: View {

    @State private var tasks: [StoreTask] = []
    @State private var selectedTask: StoreTask?

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack(spacing: 12) {
                        Button {
                            selectedTask = task
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(task.productName.isEmpty ? "（商品名なし）" : task.productName)
                                    .font(.headline)

                                if !task.note.isEmpty {
                                    Text(task.note)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                if task.status == "in_progress" {
                                    Text("対応中")
                                        .font(.caption)
                                        .foregroundColor(.orange)
                                }
                            }
                            .padding(.vertical, 6)
                        }

                        Spacer()

                        HStack(spacing: 8) {
                            if task.status == "open" {
                                Button("対応中") {
                                    updateStatus(task, "in_progress")
                                }
                                .buttonStyle(.bordered)
                                .tint(.orange)
                            }

                            Button("完了") {
                                updateStatus(task, "done")
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                        }
                    }
                }
            }
            .navigationTitle("タスク")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink("追加") {
                        CreateTaskView()
                    }
                }
            }
        }
        .onAppear(perform: loadTasks)
        .sheet(item: $selectedTask) { task in
            MapDisplayView(x: task.x, y: task.y)
        }
    }

    // 未完了（open + in_progress）のみ表示
    func loadTasks() {
        Firestore.firestore()
            .collection("tasks")
            .whereField("status", in: ["open", "in_progress"])
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("loadTasks error:", error.localizedDescription)
                    return
                }
                tasks = snapshot?.documents.map {
                    StoreTask(id: $0.documentID, data: $0.data())
                } ?? []
            }
    }

    // ステータス更新
    func updateStatus(_ task: StoreTask, _ status: String) {
        var data: [String: Any] = ["status": status]
        if status == "done" {
            data["completedAt"] = Timestamp()
        }

        Firestore.firestore()
            .collection("tasks")
            .document(task.id)
            .updateData(data) { error in
                if let error = error {
                    print("updateStatus error:", error.localizedDescription)
                }
            }
    }
}
