FROM elasticsearch:7.8.1

COPY es-launcher.sh launcher.sh

ENTRYPOINT ["/tini", "--", "./launcher.sh"]
CMD ["eswrapper"]
