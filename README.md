# TaskApp( 欠品タスク管理アプリ）

## 概要
小売店の欠品対応を効率化するために、iOS（SwiftUI）とFirebaseを用いて個人開発した業務改善アプリです。
欠品タスクの登録、タスクのステータス管理(対応中・完了)、店内マップ上での位置登録/表示、履歴管理、全体チャットを備えています。

## 主な機能
- 欠品タスクの作成 / 一覧表示
- 完了タスクの履歴表示（必要に応じて削除）
- 店内マップのタップで位置登録（拡大・移動対応）
- タスクをタップするとマップに位置表示
- 全体チャット（ユーザー名・時刻表示）
- Firebase Authentication によるログイン

## 技術スタック
- Swift / SwiftUI
- Firebase Authentication
- Firebase Firestore
- Xcode

## セキュリティ上の注意
Firebase設定ファイル（GoogleService-Info.plist）は機密情報を含むため、リポジトリには含めていません。
