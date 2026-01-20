import SwiftUI
import FirebaseFirestore

struct CreateTaskView: View {
    @State private var productName = ""
    @State private var note = ""
    @State private var x: Double = 0
    @State private var y: Double = 0
    @State private var showMap = false

    var body: some View {
        VStack(spacing: 16) {
            TextField("商品名", text: $productName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("コメント", text: $note)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("場所を選択") {
                showMap = true
            }

            Button("欠品タスクを保存") {
                saveTask()
            }
        }
        .padding()
        .sheet(isPresented: $showMap) {
            MapSelectView { px, py in
                x = px
                y = py
                showMap = false
            }
        }
    }

    func saveTask() {
        let db = Firestore.firestore()
        db.collection("tasks").addDocument(data: [
            "productName": productName,
            "note": note,
            "x": x,
            "y": y,
            "status": "open",
            "createdAt": Timestamp()
        ])

        productName = ""
        note = ""
    }
}
