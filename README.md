Docker Image for [embulk/embulk](https://github.com/embulk/embulk#quick-start)
====

使い方
----

```console
$ git clone https://github.com/yokogawa-k/docker-embulk.git
$ cd docker-embulk
$ docker build -t yokogawa/embulk .
$ # help
$ docker run -t -v ${PWD}:/work yokogawa/embulk
$ # example
$ docker run -t -v ${PWD}:/work yokogawa/embulk example ./try1
```

※ サンプルファイルは rootの所有で出来ます

fig
----

```console
$ fig up -d
$ fig logs
```

参考サイト
----

- [Treasure Dataの新データ転送ツールEmbulkを触ってみた #dtm_meetup ｜ Developers.IO](http://dev.classmethod.jp/tool/embulk-ataglance/)
