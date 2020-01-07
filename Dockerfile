FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential libopencv-dev cmake git htop
RUN cd /root && git clone https://github.com/tencent/ncnn && cd ncnn && git checkout d21a9f99bb91208ce1718b452d1be377156b1ee1
RUN mkdir -p /root/ncnn/build && cd /root/ncnn/build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr && make -j$(nproc) && make install
COPY minimal-code /root/minimal-code
RUN cd /root/minimal-code && cmake . && make
WORKDIR /root/minimal-code
CMD sh -c "./retinaface testimg.jpg >/dev/null &" && htop
