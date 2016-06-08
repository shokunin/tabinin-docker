FROM            ubuntu:16.04
MAINTAINER      chris.mague@shokunin.co

ENV		LANG=en_US.UTF-8
ENV		LANGUAGE=en_US.UTF-8 
ENV		LC_CTYPE=en_US.UTF-8 
ENV		LC_MESSAGES=en_US.UTF-8 
ENV		LC_ALL=en_US.UTF-8 
ENV		NOMAD_API="http://127.0.0.1:4646"
ENV		NOMAD_CLUSTER="BROKEN"

RUN             apt-get update && apt-get install -y git wget nodejs-legacy && \
		wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb && rm  erlang-solutions_1.0_all.deb  && \
		export LANG=en_US.UTF-8 && LANGUAGE=en_US.UTF-8 && export LC_CTYPE=en_US.UTF-8 && export LC_MESSAGES=en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && \
		apt-get update && \
		apt-get install -y erlang elixir && \
		echo "Y" | /usr/local/bin/mix local.hex && \
		echo "Y" | /usr/local/bin/mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez && \
		cd / && git clone https://github.com/shokunin/tabinin.git && /bin/true

COPY		nomad.exs /tabinin/config/nomad.exs

RUN		cd /tabinin && /usr/local/bin/mix deps.get && echo "Y" | mix compile

EXPOSE          4000

WORKDIR		/tabinin
ENTRYPOINT      ["/usr/local/bin/mix", "phoenix.server"]
