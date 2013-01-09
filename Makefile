.PHONY:	all deps compile setup clean

NAME=exoskeleton

all: deps compile

deps:
	rebar get-deps

compile:
	rebar compile

setup:
	ERL_LIBS+=":`pwd`/deps" \
	deps/setup/setup_gen $(NAME) priv/setup.config setup -pz `pwd`/ebin

target:
	ERL_LIBS+=":`pwd`/deps" \
	deps/setup/setup_gen $(NAME) priv/setup.config setup -pz `pwd`/ebin \
	-target rel -vsn 0.1

run: setup
	erl -boot setup/start -config setup/sys

clean:
	rebar clean
