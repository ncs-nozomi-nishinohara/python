FROM ncsnozominishinohara/python:3.6.8-gpu-ppc64le
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

LABEL maintainer="nozomi nishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/lib/python3/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2
COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/local/lib/*4.1.1 /usr/local/lib/
