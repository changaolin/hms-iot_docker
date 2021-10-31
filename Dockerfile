FROM ubuntu:20.04
WORKDIR /root
COPY gcc_riscv32-linux-7.3.0.tar.gz ./
COPY gn.1523.tar ./
COPY ninja.1.9.0.tar ./
COPY node-v14.15.1-linux-x64.tar.xz ./
COPY build.sh ./
COPY requirements.txt ./
COPY pip.conf /etc/pip.conf
RUN rm -rf /bin/sh && ln -s /bin/bash /bin/sh && chmod -x ~/build.sh
RUN ["/bin/bash", "-c", "source build.sh"]
#RUN build.sh
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir /code
WORKDIR /code
VOLUME /code
CMD ["bash"]
