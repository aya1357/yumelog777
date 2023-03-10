# README

# ゆめログ

* 【サービス概要】<br>
勉強しようと思っているけど先延ばしになっている人に、勉強の習慣を提供する目標管理作成サポートのサービスです。

* 【メインのターゲットユーザー】<br>

20~40代で勉強に取り組んでいる、もしくは勉強しようと思っている人
積読しがちな人
働きながら資格取得を目指している人
営業スキルや、プログラミングスキルなど、勉強をしようと思っているけど、仕事が忙しくて先延ばしになりがちな社会人
自身の勉強記録をつけたい人

* 【ユーザーが抱える課題】<br>
いざ勉強しようと本や動画を買ったけど、購入した日だけ手をつけて結局先延ばしになっている

* 【解決方法】<br>
1日何ページを読むか、何分動画を見るかという目標を決定して、1日の数分の時間を、先延ばしになっている本や動画に手をつける時間に当てられるようにする

* 【サービス詳細】<br>
勉強したい本を登録出来る
1日何分、何ページ勉強するか登録するだけで、完了出来る予定の日付を自動計算してくれる
今日の勉強した範囲、勉強に取り組んだ時間を記録出来て振り返りが出来る
選択した日付で取り組んでいる本の進捗が一目で分かる
勉強した範囲を記録したものをタイムラインに投稿出来る

* 【なぜこのようなサービスを作りたいのか？】<br>
積読本を持っているという人は統計で79%という結果が出ているとのこと。
[積読本がある人の数の統計結果](https://hon.jp/news/1.0/0/25587)<br>
2023年1月の2022年の出版市場（推定販売金額）によると、紙の出版物推定販売金額は、1兆1292億円もの市場規模があり、そこに対して、統計的に79%の人が読まずに放置している積読本があるとのことで、そこの悩みにアプローチ出来たら大きいと感じたため。
[本の市場規模](https://hon.jp/news/1.0/0/38832#:~:text=%E5%85%AC%E7%9B%8A%E7%A4%BE%E5%9B%A3%E6%B3%95%E4%BA%BA%E5%85%A8%E5%9B%BD%E5%87%BA%E7%89%88,%EF%BC%85%E5%A2%97%E3%81%A8%E3%81%AA%E3%81%A3%E3%81%9F%E3%80%82)<br>
カレンダーアプリはありますが、1日に読んだ本の記録をつけながら残りページ数や終了日を簡単に計算出来たり、本のメモ機能でワード検索機能があり後からワード検索や、理解度が一瞬で見れるアプリが見当たらず、積読本解消の悩みに特化して解決出来るカレンダーあればと思い、作ってみようと思いました。


* 【機能一覧】<br>
- 新規ユーザー登録機能
- ユーザーログイン機能
- ユーザーパスワードリセット機能
- プロフィール編集機能
- 勉強するの登録、編集機能
- １日の勉強した範囲の登録、編集機能
- 1日の勉強した範囲の登録をして、残りの日数やページ数を自動で割り出してくれる機能
- 完了した本のメモ作成、編集機能

* 【実装予定の機能一覧】<br>
- 目標終了予定日から1日のページ数を割り出す機能
- 本に対して顔マークなどで理解度を表示。後から読み返したい本を一覧で表示出来る機能
- その日までの勉強の進捗の表示機能
- 1日の勉強した範囲の登録後に、タイムラインに表示する機能
- Twitter投稿機能(今日からこの本を読み始める宣言が出来たらいいかと。)
- LINE BOT機能
- 勉強する本や動画の登録の際に、終わらせたい日付を登録すると、1日やるべきページ数や分数の自動計算機能
- 完了した本や動画の検索機能
- 本のカテゴリー機能
- ゲーム性のある機能(勉強時間、読破した勉強本の数などでレベルが上がるような機能をつけて「○レベルまであと何日」などを表示して継続を促すような機能)

* 照屋さん案
- 読み終わった本やこれから読みたい本などを登録できるリスト機能
- 1日の学習ログのリマインダーとしてのLINEBOT機能
* 税理士さん案
- 本に関してのメモ機能で、何ページのここを振り返るとか、メモしたワードを全体検索して、どの本か割り出してそのワードがどの本のどのページに存在するか一瞬で割り出すことが出来たらいいとのこと。
- 本を読むたびにカロリー数に合わせて、今日は１kgステーキ分読みましたとか遊び心が欲しいとのこと。


* 【スケジュール】<br>

README〜ER図作成：12/14 〆切
メイン機能実装：2/14 〆切
β版をRUNTEQ内リリース（MVP）：2/14〆切
本番リリース：2月末

* 【画面遷移図】<br>
https://www.figma.com/file/yTq0bQsHWISKMvBg7mlkXX/%E7%84%A1%E9%A1%8C?node-id=0%3A1&t=ol4j64oMJC5fHmsK-0

* 【ER図】<br>
[![Image from Gyazo](https://i.gyazo.com/965b41b4c0d78a3d2677e54e0563d41f.png)](https://gyazo.com/965b41b4c0d78a3d2677e54e0563d41f)
