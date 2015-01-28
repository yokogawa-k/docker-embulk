Docker Image for [embulk/embulk](https://github.com/embulk/embulk#quick-start)
====

使い方
----

[Treasure Dataの新データ転送ツールEmbulkを触ってみた #dtm_meetup ｜ Developers.IO](http://dev.classmethod.jp/tool/embulk-ataglance/) を参考にしています。

```console
$ git clone https://github.com/yokogawa-k/docker-embulk.git
$ cd docker-embulk
$ docker build -t yokogawa/embulk .
$ # help
$ docker run -t -v ${PWD}:/work yokogawa/embulk
$ # example
$ docker run -t -v ${PWD}:/work yokogawa/embulk example ./try1
$ docker run -t -v ${PWD}:/work yokogawa/embulk guess ./try1/example.yml -o config.yml
$ # dry-run
$ docker run -t -v ${PWD}:/work yokogawa/embulk preview config.yml
$ # run
$ docker run -t -v ${PWD}:/work yokogawa/embulk run config.yml
```

### 付属の run スクリプトを使った場合

サンプルの実行が以下のようになります

```console
$ # help
$ ./run
$ # example
$ ./run example ./try1
$ ./run guess ./try1/example.yml -o config.yml
$ # dry-run
$ ./run preview config.yml
$ # run
$ ./run run config.yml
```

bash を起動して、コンテナ内に入る場合は `./run bash` してください。

※ サンプルファイルは rootの所有で出来ます

fig
----

```console
$ fig up -d
$ fig logs
```

