FROM paperist/texlive-ja:latest

RUN apt-get update
RUN tlmgr install pdfjam
RUN tlmgr install collection-binextra
RUN tlmgr install collection-mathscience
RUN tlmgr install collection-pictures
RUN tlmgr install bussproofs rsfs lualatex-math
RUN tlmgr install caption
RUN tlmgr install kastrup tex-gyre newtx
