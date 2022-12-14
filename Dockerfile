FROM aler9/rtsp-simple-server AS rtsp
FROM alpine:3.12
RUN apk add --no-cache ffmpeg
COPY --from=rtsp /rtsp-simple-server /
COPY --from=rtsp /rtsp-simple-server.yml /
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]