FROM debian:latest

RUN apt update
RUN apt install build-essential git meson ninja-build -y

WORKDIR /root
RUN git clone https://github.com/Jackojc/wotpp.git
WORKDIR wotpp
RUN meson build
RUN ninja -C build
RUN ninja -C build test

FROM gorialis/discord.py

ENV PATH=".:$PATH"

COPY --from=0 /root/wotpp/build/w++ .
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "bot.py"]
