CANDIDATES := $(wildcard src/.??* src/.config/* src/.local/bin/*)
EXCLUSIONS := src/.config src/.local
DOTFILES := $(patsubst src/%,%, $(filter-out $(EXCLUSIONS), $(CANDIDATES)))

all:

install:
	@{ \
		make -s list; \
		make -s list-deployed-files; \
		} | \
			sort | \
			uniq -u | \
			xargs -I{} ln -fnsv $(abspath src/{}) $(HOME)/{}

list:
	@$(foreach f, $(DOTFILES), echo $(f);)

list-deployed-files:
	@make -s list | \
		xargs -I{} find ~/{} -type l 2>/dev/null | \
		sed "s|$(HOME)/||"

clean:
	@$(foreach f, $(DOTFILES), unlink $(HOME)/$(f);)
