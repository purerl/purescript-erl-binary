.PHONY: ps erl all clean distclean

.DEFAULT_GOAL := ps

ps:
	@spago build

clean:
	rm -rf output

distclean: clean
	rm -rf .spago
