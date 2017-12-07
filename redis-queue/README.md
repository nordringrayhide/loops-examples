# Loops Redis Queue

```
brew install redis
```

```
bundle
foreman start
```

```
bin/console
```

type "queue.push 'task0'"

```
tail -f log/simple_loop.log
```

find "Received a message: task0"

[![pic0.png](https://github.com/romanvbabenko/loops-examples/blob/master/redis-queue/pic0.png)
