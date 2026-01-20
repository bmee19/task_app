import SwiftUI
import FirebaseAuth

struct SettingsView: View {

    @StateObject private var profile = UserProfileStore()

    var loginDateText: String {
        if let date = UserDefaults.standard.object(forKey: "lastLoginDate") as? Date {
            return date.formatted(date: .abbreviated, time: .shortened)
        }
        return "不明"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("ユーザー情報")
                .font(.title2)
                .bold()

            HStack {
                Text("ユーザー名")
                Spacer()
                Text(profile.userName)
                    .foregroundColor(.secondary)
            }

            HStack {
                Text("ID（メール）")
                Spacer()
                Text(Auth.auth().currentUser?.email ?? "不明")
                    .foregroundColor(.secondary)
            }

            HStack {
                Text("ログイン時刻")
                Spacer()
                Text(loginDateText)
                    .foregroundColor(.secondary)
            }

            Divider().padding(.vertical, 8)

            Button(role: .destructive) {
                logout()
            } label: {
                Text("ログアウト")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("設定")
        .onAppear {
            profile.load() // users/{uid} から名前を読む
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("ログアウト失敗:", error.localizedDescription)
        }
    }
}
