# TaskApp( 欠品タスク管理アプリ）

## 概要
小売店の欠品対応を効率化するために、iOS（SwiftUI）とFirebaseを用いて個人開発した業務改善アプリです。
欠品タスクの登録、タスクのステータス管理(対応中・完了)、店内マップ上での位置登録/表示、履歴管理、全体チャットを備えています。

## 主な機能

### 欠品タスクの作成・管理フロー

<img src="https://github.com/user-attachments/assets/1f828f54-7678-4aec-baec-63db0d30c10a" width="240">（タスク追加）
<img src="https://github.com/user-attachments/assets/aa495656-37e0-4647-ab40-802c291bda7f" width="240">（商品名入力）
<img src="https://github.com/user-attachments/assets/c340e380-fcf3-4778-a522-72e536e30b26" width="240">（入力）
<img src="https://github.com/user-attachments/assets/a6a04a09-62dc-447b-9df9-5c382bd314b3" width="240">（地図）
<img src="https://github.com/user-attachments/assets/d91ca0cf-9f79-4f9d-8691-5d3b90993603" width="240">（タスク追加後）

---

### タスク管理・位置表示

<img src="https://github.com/user-attachments/assets/074f1220-adfe-4711-8997-c5ff517e1b19" width="260">（タスクの場所）
<img src="https://github.com/user-attachments/assets/36fe3cd3-f704-4e65-af24-581493f31507" width="260">（対応中）
<img src="https://github.com/user-attachments/assets/78da1a3f-8347-40db-97a9-3bfd0dbd9ae0" width="260">（複数タスク）

---

### 完了・履歴管理

<img src="https://github.com/user-attachments/assets/560ce958-33a0-4d57-a01c-786598c0107d" width="260">（履歴）

---

### 全体チャット・ログイン

<img src="https://github.com/user-attachments/assets/2eb707d8-c331-4a71-a1a8-a744dbf4c7b3" width="260">（全体チャット）
<img src="https://github.com/user-attachments/assets/37581e72-5912-4f50-9d58-844fa06e3b79" width="260">（ログイン画面）
<img src="https://github.com/user-attachments/assets/6a56acf8-ed36-4c58-af9c-329a8e3792ba" width="260">（ユーザー情報）


## 技術スタック
- Swift / SwiftUI
- Firebase Authentication
- Firebase Firestore
- Xcode

## セキュリティ上の注意
Firebase設定ファイル（GoogleService-Info.plist）は機密情報を含むため、リポジトリには含めていません。
