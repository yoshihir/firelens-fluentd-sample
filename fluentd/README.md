## ローカル開発
```
# fluent.confの先頭にsourceを追加
<source>
  @type forward
  port 24224
</source>

# docker build
docker build -t fluentd1.7-test-container .

# command1
docker run --env-file=.env -it -p 24224:24224 \
    -v `pwd`/fluent.conf:/fluentd/etc/fluent.conf -e FLUENTD_CONF=fluent.conf \
    -v `pwd`/conf.in:/fluentd/etc/conf.in \
    -v `pwd`/conf.out:/fluentd/etc/conf.out \
    fluentd1.7-test-container
    
# command2(別terminal)
## nginx log sample
docker run --log-driver=fluentd --log-opt tag="nginx-firelens-11111111" busybox echo "10.0.11.195 - - [20/Oct/2019:11:15:53 +0000] \"GET / HTTP/1.1\" 200 612 \"-\" \"ELB-HealthChecker/2.0\" \"-\""
```
#### .envの中身
```
AWS_REGION=ap-northeast-1
AWS_ACCESS_KEY_ID=xxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxx
```
