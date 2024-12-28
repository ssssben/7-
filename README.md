# ROS 2 Talker と Listener で7の倍数の計算をするプログラム

このリポジトリは、2つのノードから成るROS 2の基本的なサンプルを提供します。`Talker`ノードは整数値を発行し、`Listener`ノードはその値を受け取り、7倍して表示します。ノード間の通信は、`countup`というトピックを介して行われます。

## 概要

- **Talkerノード**: このノードは、0から始まる整数を生成し、0.5秒ごとに1ずつ増加させ、その整数を`countup`というトピックに発行します。
- **Listenerノード**: このノードは、`countup`トピックをリッスンし、受け取った整数を7倍して、その結果をログに表示します。

## セットアップ方法

### 1. リポジトリをクローンする

このリポジトリをローカルにクローンします：

```bash
git clone https://github.com/ssssben/7-times.git
cd ros2_ws
```

## 使い方
はじめにビルドをしてください
```
colcon build
```
そして環境をソースしてください
```
source ~/ros2_ws/install/setup.bash
```
ターミナルを二つ開き
ターミナル1でTalkerノードを実行して、整数を発行します
```
ros2 run mypkg talker
```
実行結果
```
[talker-1] [INFO] [1735363374.229580212] [talker]: 整数: '0'
[talker-1] [INFO] [1735363374.717171970] [talker]: 整数: '1'
[talker-1] [INFO] [1735363375.217392375] [talker]: 整数: '2'
[talker-1] [INFO] [1735363375.717274364] [talker]: 整数: '3'
[talker-1] [INFO] [1735363376.217181308] [talker]: 整数: '4'
```
ターミナル2で、Listenerノードを実行して、countupトピックから整数を受信し、7倍した結果を表示します
```
ros2 run mypkg listener
```
実行結果

```
[listener-2] [INFO] [1735363374.229580217] [listener]: 7倍した結果: 0
[listener-2] [INFO] [1735363374.717691927] [listener]: 7倍した結果: 7
[listener-2] [INFO] [1735363375.217817340] [listener]: 7倍した結果: 14
[listener-2] [INFO] [1735363375.717634469] [listener]: 7倍した結果: 21
[listener-2] [INFO] [1735363376.217540069] [listener]: 7倍した結果: 28
```

# 動作環境
## 必要な環境

- **ROS 2 (Foxy以降)** がインストールされていること。
- **Python 3.8以上** (ROS 2のPython APIを使用)。
- **std_msgsパッケージ** (ROS 2の`Int16`メッセージ型が含まれている)。
## テスト環境
- ubuntu-20.04
## ライセンス
- このリポジトリはBSD-3-Clauseライセンスのもとで公開されています。
## Copyright
© 2024 Ben Fang
