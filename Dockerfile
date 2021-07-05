FROM ruby:3.0.0-alpine

RUN mkdir /app
WORKDIR /app

RUN apk --no-cache --update add build-base curl

# install mecab
RUN wget -O mecab-0.996.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE' && \
	tar xvzf mecab-0.996.tar.gz && cd mecab-0.996 && ./configure && make && make check && make install && cd ../

## install IPA dictionary
RUN wget -O mecab-ipadic-2.7.0-20070801.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM' && \
	tar xvzf mecab-ipadic-2.7.0-20070801.tar.gz && cd mecab-ipadic-2.7.0-20070801 && ./configure -with-charset=utf-8 –enable-utf8-only && make && make install && cd ../
