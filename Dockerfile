FROM julia:1.4.1-buster

RUN apt update && apt upgrade && apt install -y python3-pip && pip3 install jupyterlab && mkdir /scripts/

WORKDIR /scripts/

RUN echo "using Pkg" >> run_me.jl && echo "Pkg.add(\"IJulia\")" >> run_me.jl && julia run_me.jl

CMD jupyter lab --port=8080 --ip=0.0.0.0 --allow-root
