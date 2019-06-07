FROM debian:stretch

RUN apt-get -y update && apt-get -y install unzip curl libxext6 libxt-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir runtime-installer && cd runtime-installer \
  && curl -sL http://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/2/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019a_Update_2_glnxa64.zip -o installer.zip \
  && unzip installer.zip \
  && ./install -mode silent -agreeToLicense yes \
  && cd / && rm -rf /runtime-installer && rm -rf /tmp/mathworks_*

ENV LD_LIBRARY_PATH=/usr/local/MATLAB/MATLAB_Runtime/v96/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v96/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v96/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v96/extern/bin/glnxa64
ENV MCR_CACHE_VERBOSE=true
ENV MCR_CACHE_ROOT=/tmp
