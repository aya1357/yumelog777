# README

# 積みログ
[![Image from Gyazo](https://i.gyazo.com/e21db215392bbde33c8a55fcb552a27f.png)](https://gyazo.com/e21db215392bbde33c8a55fcb552a27f)
# 【アプリのURL】
## [積みログ](https://www.tsumilog.net/)

## [Qiita記事](https://qiita.com/aya1357/items/5abc68b557197dc39baf)

### * 【積みログ】 2023年5月15日現在
#### PV数: 10390pv
#### uu数： 378
#### 【Qiita記事】 約1万view


## 【サービス概要】<br>
積読本解消のための読書カレンダー管理サービスです。

## 【メインのターゲットユーザー】<br>

20~40代
積読しがちな人
働きながら資格取得を目指している人
営業スキルや、プログラミングスキルなど、勉強をしようと思っているけど、仕事が忙しくて先延ばしになりがちな社会人
自身の読書記録をつけたい人

* 【ユーザーが抱える課題】
いざ読書しようと本を買ったけど、結局読まずに放置されている本がある

* 【解決方法】
1日何ページを読むか、何分動画を見るかという目標を決定して、1日の数分の時間を、先延ばしになっている本や動画に手をつける時間に当てられるようにする

## 【サービス詳細】
- 読書したい本を登録出来る
- 1日何分、何ページ勉強するか登録するだけで、完了出来る予定の日付を自動計算してくれる
- 今日の勉強した範囲、勉強に取り組んだ時間を記録出来て振り返りが出来る
- 選択した日付で取り組んでいる本の進捗が一目で分かる
- 勉強した範囲を記録したものをタイムラインに投稿出来る

## 【なぜこのようなサービスを作りたいのか？】
積読本を持っているという人は統計で79%という結果が出ているとのこと。
[積読本がある人の数の統計結果](https://hon.jp/news/1.0/0/25587)<br>
2023年1月の2022年の出版市場（推定販売金額）によると、紙の出版物推定販売金額は、1兆1292億円もの市場規模があり、そこに対して、統計的に79%の人が読まずに放置している積読本があるとのことで、そこの悩みにアプローチ出来たら大きいと感じたため。
[本の市場規模](https://hon.jp/news/1.0/0/38832#:~:text=%E5%85%AC%E7%9B%8A%E7%A4%BE%E5%9B%A3%E6%B3%95%E4%BA%BA%E5%85%A8%E5%9B%BD%E5%87%BA%E7%89%88,%EF%BC%85%E5%A2%97%E3%81%A8%E3%81%AA%E3%81%A3%E3%81%9F%E3%80%82)<br>
また、自分自身積読本を抱えた経験があり、その解消を少しずつしていけたらと思いました。そのため、その本に関して1日何ページほど読んだらいつまでに終われるのかが一瞬で分かるようなアプリが欲しいと思ったのと、読書記録をつけながら、残りページ数や読書したページ数によって、終了日が変動するようなアプリがあったら、自身の努力が可視化出来、継続を促せるのではと思い立ち、このようなサービスを作りたいと思いました。


## 【機能一覧】
- 新規ユーザー登録機能
- ユーザーログイン機能
- ユーザーパスワードリセット機能
- プロフィール編集機能
- 勉強するの登録、編集機能
- １日の勉強した範囲の登録、編集機能
- 1日の勉強した範囲の登録をして、残りの日数やページ数を自動で割り出してくれる機能
- 完了した本のメモ作成、編集機能

## 【本リリース時の実装予定機能一覧】
- お問い合わせ機能作成
- 使い方ガイド作成
- twitterカードの導入
- ユーザーの退会機能作成

## 【実装予定の機能一覧】
- 目標終了予定日から1日のページ数を割り出す機能
- キャラクターを用意して、ログの記録後にカードでキャラクターとメッセージをランダムで表示する機能
- メモ機能にAIのGemを導入して、本を読みながら、わからない単語を調べて、ページ数と一緒にメモ出来る機能
- メモに対してワードで全体検索が出来る機能
- 本に対して顔マークなどで理解度を表示。後から読み返したい本を一覧で表示出来る機能
- その日までの勉強の進捗の表示機能
- 1日の勉強した範囲の登録後に、タイムラインに表示する機能
- Twitter投稿機能(今日からこの本を読み始める宣言が出来たらいいかと。)
- LINE BOT機能(朝とかに目標ページ数が見れたりやる気が出るメッセージを投入)
- 勉強する本や動画の登録の際に、終わらせたい日付を登録すると、1日やるべきページ数や分数の自動計算機能
- 完了した本や動画の検索機能
- 本のカテゴリー機能
- ゲーム性のある機能(勉強時間、読破した勉強本の数などでレベルが上がるような機能をつけて「○レベルまであと何日」などを表示して継続を促すような機能)

### アドバイス案
- 読み終わった本やこれから読みたい本などを登録できるリスト機能
- 1日の学習ログのリマインダーとしてのLINEBOT機能
- 本に関してのメモ機能で、何ページのここを振り返るとか、メモしたワードを全体検索して、どの本か割り出してそのワードがどの本のどのページに存在するか一瞬で割り出すことが出来たらいいとのこと。
- 本を読むたびにカロリー数に合わせて、今日は１kgステーキ分読みましたとか遊び心が欲しいとのこと。


## 【スケジュール】

README〜ER図作成：12/14 〆切
メイン機能実装：3/31 〆切
β版をRUNTEQ内リリース（MVP）：3/31〆切
本番リリース：4月中旬

## 【使用技術】
|  バックエンド  |  フロントエンド  |  インフラ ・ その他 |
| ---- | ---- | ---- |
|  Ruby on Rails(7.0.3)  |  TailwindCSS  |  PostgreSQL  |
|  Ruby(3.1.2)  |  jQuery  |  Heroku  |
|    |    |  Blender |

[画面遷移図](https://www.figma.com/file/yTq0bQsHWISKMvBg7mlkXX/%E7%84%A1%E9%A1%8C?node-id=0%3A1&t=ol4j64oMJC5fHmsK-0)

【ER図】<br>
[![Image from Gyazo](https://i.gyazo.com/49337581e0e69c12e681baf7de996b07.png)](https://gyazo.com/49337581e0e69c12e681baf7de996b07)
