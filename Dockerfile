FROM debian:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
		build-essential \
		curl \
		zip \
		unzip \
		xxd \
	&& apt-get clean


RUN apt-get install -y \	
		texlive-fonts-recommended \
		texlive-lang-german \
		texlive-fonts-extra \

	&& curl http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current.tar.gz --output asl-current.tar.gz \
	&& tar -xvf asl-current.tar.gz \
	
	&& cd asl-current \
	&& cp Makefile.def.tmpl Makefile.def \
	&& make install \
	
	&& cd .. \

	&& rm -rf asl-current* \
	&& apt-get remove -y \
		texlive-fonts-recommended \
		texlive-lang-german \
		texlive-fonts-extra \
	&& apt autoremove -y \
	&& apt-get clean


RUN curl -L https://github.com/drojaazu/interleave/archive/refs/heads/master.zip --output interleave-master.zip \
	&& unzip interleave-master.zip \
	&& cd interleave-master \
	&& sed -i '/CC := clang++/c\CC := g++' Makefile \
	&& make \
	&& cp bin/interleave /usr/local/bin \
	&& cp bin/interleave /usr/local/lib \
	&& cd .. \
	&& rm -rf interleave-master*


RUN echo '#!/bin/bash' >> deinterleave \
	&& echo 'xxd -p "$1" | sed -E "s/(..)../\\1/g" | xxd -r -p > "$2.even"' >> deinterleave \
	&& echo 'xxd -p "$1" | sed -E "s/..(..)/\\1/g" | xxd -r -p > "$2.odd"' >> deinterleave \
	&& chmod +x deinterleave \
	&& cp deinterleave /usr/local/bin \
	&& cp deinterleave /usr/local/lib \
	&& rm -rf deinterleave

