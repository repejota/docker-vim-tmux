run: build
	docker run -p 80:8080 -ti --rm -v `pwd`:/source vim-tmux

build:
	docker build --rm -t vim-tmux .

