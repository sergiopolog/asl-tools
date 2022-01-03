# asl-tools
**ASL Cross Assembler preconfigured Tool Bundle**

Based on Debian docker image.


Build as usual from provided Dockerfile: ```docker build -t "asl-tools" .```

Run as: ```docker run -it --rm --name "asl-container" --mount src="%cd%/data",target=/home/data,type=bind "asl-tools"```


Tools included in this bundle:

* **Macroassembler AS**: Cross assembler for many Microprocessors, by _Alfred Arnold_ http://john.ccac.rwth-aachen.de:8000/as/index.html
* **Interleave utility**: Combine contents of multiple files, interleaving them in differents chunks of data, by _drojaazu_ https://github.com/drojaazu/interleave
* **Deinterleave utility**: Split a file into two other ones with even and odd bytes of the former. by _me_
