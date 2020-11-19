FROM aurblobs/arch-multilib:latest

RUN \
	pacman -Syyu --needed --noconfirm && \
	sudo pacman -S base-devel