## アプリとサーバーの通信(ログインも？)の練習をします

#### アプリ体験
 - UserDefaultsを使ったログイン画面でログイン(ユーザ登録も)
 - Ajaxサーバーからログを受信する(画面１)
 - WebSocketからログを受信する(画面２)

<img src="assets/ajaxMovie.gif" width="300px"> <img src="assets/websocketStart.gif" width="300px">

### SwiftとNode.jsでアプリとサーバーの通信を表現します

### 使用するフレームワーク
(画面１)
 - Ajax
 - SwiftyJSON
 - Alamofire

(画面2)
 - SocketIO

### プロジェクト詳細
 - サーバーをJavaScriptで作成し、JSONまたは単純にログを送信する
 - SwiftでiOSアプリを作成し、サーバーからデータを受け取って表示する

#### 動かし方
①アプリを起動する

②```node ファイル名.js``` コマンドでローカルにサーバーを立ち上げる

③アプリ内でサーバーと接続するボタンを押下する
→画面が更新されていればオッケーです。

<img src="assets/ajaxOpenning.png" width="300px"> <img src="assets/ajaxMovie.gif" width="300px">

サーバーを立ち上げ、接続をするとuptimeが更新されていくのが分かります。
uptimeはサーバーの起動時間を表すので、適切に通信ができていることが分かりますね。

<img src="assets/websocketStart.gif" width="300px">
