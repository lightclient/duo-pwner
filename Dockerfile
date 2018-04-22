# basing this off an existing android vm
# https://github.com/butomo1989/docker-android
FROM butomo1989/docker-android-x86-7.0

# vnc -> 6080 , android -> 5555
EXPOSE 6080 5555

# bring in our files
WORKDIR /root
COPY src/run.sh /root/
COPY src/com.duosecurity.duomobile_3.19.2.apk /root/tmp/
