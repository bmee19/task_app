import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ChatView: View {

    @StateObject private var profile = UserProfileStore()
    @State private var messages: [ChatMessage] = []
    @State private var newMessage: String = ""

    var body: some View {
        VStack {

            // ===== メッセージ一覧 =====
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.userId == Auth.auth().currentUser?.uid {
                                    Spacer()
                                }

                                VStack(alignment: .leading, spacing: 4) {

                                    //  名前 + 時刻
                                    HStack(spacing: 6) {
                                        Text(message.userName)
                                            .font(.caption)
                                            .foregroundColor(.secondary)

                                        Text(message.timeString)
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }

                                    Text(message.text)
                                        .padding(10)
                                        .background(
                                            message.userId == Auth.auth().currentUser?.uid
                                            ? Color.blue.opacity(0.7)
                                            : Color.gray.opacity(0.3)
                                        )
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }

                                if message.userId != Auth.auth().currentUser?.uid {
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) {
                    guard let last = messages.last else { return }
                    DispatchQueue.main.async {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }

            Divider()

            // ===== 入力欄 =====
            HStack {
                TextField("メッセージを入力", text: $newMessage)
                    .textFieldStyle(.roundedBorder)

                Button("送信") {
                    sendMessage()
                }
                .disabled(newMessage.isEmpty)
            }
            .padding()
        }
        .navigationTitle("全体チャット")
        .onAppear {
            profile.load()   
            loadMessages()
        }
    }

    // ===== Firestore からメッセージ読み込み =====
    func loadMessages() {
        Firestore.firestore()
            .collection("messages")
            .order(by: "createdAt")
            .addSnapshotListener { snapshot, _ in
                messages = snapshot?.documents.map {
                    ChatMessage(id: $0.documentID, data: $0.data())
                } ?? []
            }
    }

    // ===== メッセージ送信 =====
    func sendMessage() {
        guard
            let uid = Auth.auth().currentUser?.uid,
            !newMessage.isEmpty
        else { return }

        Firestore.firestore()
            .collection("messages")
            .addDocument(data: [
                "text": newMessage,
                "userId": uid,
                "userName": profile.userName,
                "createdAt": Timestamp()
            ])

        newMessage = ""
    }
}
