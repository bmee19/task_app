# TaskApp( 欠品タスク管理アプリ）

## 概要
小売店の欠品対応を効率化するために、iOS（SwiftUI）とFirebaseを用いて個人開発した業務改善アプリです。
欠品タスクの登録、タスクのステータス管理(対応中・完了)、店内マップ上での位置登録/表示、履歴管理、全体チャットを備えています。

## 主な機能
- 欠品タスクの作成 / 一覧表示
  ![IMG_1339](https://github.com/user-attachments/assets/1f828f54-7678-4aec-baec-63db0d30c10a)(タスク追加)
  ![IMG_1341](https://github.com/user-attachments/assets/aa495656-37e0-4647-ab40-802c291bda7f)(商品名入力画面)
  ![IMG_1343](https://github.com/user-attachments/assets/c340e380-fcf3-4778-a522-72e536e30b26)(入力)
  ![IMG_1342](https://github.com/user-attachments/assets/a6a04a09-62dc-447b-9df9-5c382bd314b3)(地図)
  ![IMG_1344](https://github.com/user-attachments/assets/d91ca0cf-9f79-4f9d-8691-5d3b90993603)（タスク追加後）
  ![IMG_1350](https://github.com/user-attachments/assets/074f1220-adfe-4711-8997-c5ff517e1b19)（タスクの場所）
  ![IMG_1345](https://github.com/user-attachments/assets/36fe3cd3-f704-4e65-af24-581493f31507)(対応中)
  ![IMG_1347](https://github.com/user-attachments/assets/560ce958-33a0-4d57-a01c-786598c0107d)（履歴）
  ![IMG_1351](https://github.com/user-attachments/assets/78da1a3f-8347-40db-97a9-3bfd0dbd9ae0)（タスクがいろいろ追加されている画面）
  ![IMG_1348](https://github.com/user-attachments/assets/2eb707d8-c331-4a71-a1a8-a744dbf4c7b3)（全体チャット）
  ![IMG_1354](https://github.com/user-attachments/assets/37581e72-5912-4f50-9d58-844fa06e3b79)（ログイン画面）
  ![IMG_1353](https://github.com/user-attachments/assets/6a56acf8-ed36-4c58-af9c-329a8e3792ba)（ユーザー情報の確認）
  
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
