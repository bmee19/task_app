import SwiftUI

struct RootTabView: View {

    var body: some View {
        TabView {

            NavigationView {
                TaskListView()
            }
            .tabItem {
                Label("タスク", systemImage: "list.bullet")
            }

            NavigationView {
                TaskHistoryView()
            }
            .tabItem {
                Label("履歴", systemImage: "clock")
            }

            NavigationView {
                ChatView()
            }
            .tabItem {
                Label("チャット", systemImage: "bubble.left.and.bubble.right")
            }
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("設定", systemImage: "gearshape")
            }
        }
    }
}
