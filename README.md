# asl-tools
ASL Cross Assembler preconfigured Tools

Based on Debian docker image.


Build as usual from provided Dockerfile: ```docker build -t "asl-tools" .```

Run as: ```docker run -it --rm --name "asl-container" --mount src="%cd%/data",target=/home/data,type=bind "asl-tools"```
