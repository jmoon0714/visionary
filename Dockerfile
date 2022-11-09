FROM nvcr.io/nvidia/pytorch:22.02-py3

ADD ./VideoX/X-CLIP /X-CLIP

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata \
 && apt-get -y install  --no-install-recommends \
        build-essential \
        ffmpeg \
        apt-utils \
        git \
        wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN pip install -r /X-CLIP/requirements.txt
