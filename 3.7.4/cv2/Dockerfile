FROM ncsnozominishinohara/python:3.7.4-ppc64le
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi ishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/lib/python3/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2
COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/local/lib/*4.1.1 /usr/local/lib/
