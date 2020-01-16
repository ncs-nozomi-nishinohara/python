FROM ncsnozominishinohara/python:ubuntu-3.6-ppc64le
LABEL maintainer="nozomi nishinohara < nozomi_nishinohara@n-creativesystem.com>"

COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/lib/python3/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2
COPY --from=ncsnozominishinohara/python:opencv-ppc64le /usr/local/lib/*4.1.1 /usr/local/lib/