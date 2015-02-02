FROM dockerfile/python

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v0.11.16/node-v0.11.16.tar.gz && \
  tar xvzf node-v0.11.16.tar.gz && \
  rm -f node-v0.11.16.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc
