-include Makefile.local # for optional local options e.g. threads

all:

vendor/codemirror:
	mkdir -p $@
	wget -O $@.zip https://codemirror.net/codemirror.zip && \
		unzip $@.zip -d $@ && \
		mv $@/codemirror-*/lib/* $@/codemirror-*/mode/crystal/ $@ && \
		rm -r $@.zip $@/codemirror-*

vendor/ansi_up:
	mkdir -p $@
	wget -O $@.zip https://github.com/drudru/ansi_up/archive/v5.0.0.zip && \
		unzip $@.zip -d $@ && \
		mv $@/ansi_up-*/ansi_up.js $@ && \
		rm -r $@.zip $@/ansi_up-*

.PHONY: update-codemirror
update-codemirror: clean_codemirror vendor/codemirror

.PHONY: update-ansi_up
update-ansi_up: clean_ansi_up vendor/ansi_up

.PHONY: clean_codemirror
clean_codemirror:
	rm -r vendor/codemirror

.PHONY: clean_ansi_up
clean_ansi_up:
	rm -r vendor/ansi_up

.PHONY: clean_vendor
clean_vendor: clean_codemirror clean_ansi_up
