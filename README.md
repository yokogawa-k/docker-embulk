Docker Image for [embulk/embulk](https://github.com/embulk/embulk#quick-start)
====

使い方
----

[Treasure Dataの新データ転送ツールEmbulkを触ってみた #dtm_meetup ｜ Developers.IO](http://dev.classmethod.jp/tool/embulk-ataglance/) を参考にしています。

### セットアップ

```console
$ git clone https://github.com/Y-Fujikawa/docker-embulk.git
$ cd docker-embulk
$ docker build -t fujiyasu/embulk .
```

### help

```console
$ docker run -t -v ${PWD}:/work fujiyasu/embulk
```

### example

```console
$ docker run -t -v ${PWD}:/work fujiyasu/embulk example ./try1
$ docker run -t -v ${PWD}:/work fujiyasu/embulk guess ./try1/example.yml -o config.yml
```

### dry-run

```console
$ docker run -t -v ${PWD}:/work fujiyasu/embulk preview config.yml
```

### run

```console
$ docker run -t -v ${PWD}:/work fujiyasu/embulk run config.yml
```

付属の run スクリプトを使った場合
----

### help

```console
$ ./run
```

### example

```console
$ ./run example ./try1
$ ./run guess ./try1/example.yml -o config.yml
```

### dry-run

```console
$ ./run preview config.yml
```

### run

```console
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

