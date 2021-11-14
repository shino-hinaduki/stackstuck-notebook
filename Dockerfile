FROM node:16-buster

ENV HOME /root
ENV WORKDIR /workdir

# Install juypterlab
RUN apt update && apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools 

RUN python3 -m pip install --upgrade pip

RUN pip3 install --no-cache-dir \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    lckr-jupyterlab-variableinspector \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb \
    plotly \
    dash

# Install IJavascript
RUN npm config set prefix $HOME
RUN npm install -g ijavascript
ENV NODE_PATH /root/lib/node_modules
RUN export NODE_PATH
RUN node $NODE_PATH/ijavascript/bin/ijsinstall.js --spec-path=full
RUN jupyter kernelspec list

WORKDIR /workdir

EXPOSE 8888
CMD /bin/bash
