
FROM continuumio/miniconda3

ADD  dist/housing_price_Navyasree-0.3.tar.gz home/

WORKDIR /home/housing_price_Navyasree-0.3


ADD ./test ./test
ADD ./enviornment_file ./enviornment_file
ADD ./logs ./logs
ADD ./docs ./docs
ADD entrypoint.sh .

RUN conda env create -f enviornment_file/env.yml

RUN conda run -n test-mle-dev pip install .
RUN chmod +x entrypoint.sh
CMD /usr/bin/tail -f /dev/null
ENTRYPOINT [ "./entrypoint.sh" ]