纠结

1. 按照docker的设计原则，执行队列的worker，应该另起一个docker
2. 但是如果用pm2，需要命令行才能监控到，如果不在docker里装ssh的话，还需要等到宿主机查看
3. 可以使用supervisor代替pm2，因为supervisor提供了9001的web来查看进程状态
4. 做了worker，应用要同时开启 fpm cli(crond) worker

方案：最终还是使用pm2安装在workspace当中，可是怎么平衡 crond sshd 和 pm2的 pid=1的关系呢