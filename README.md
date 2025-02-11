## Compile in VSode on Save on MAC (Apple silicon).
With this workflow, you can compile pTex(Japanese Tex) source code with pLatex(Latex of pTex) in tex to pdf.
You don't have to install texlive in your local environment.

### 1. Build image

Build image by running this command .
```
sudo docker buildx build -t <Your Docker UserName>/texlive-ja:latest --platform linux/arm64 <linux/amd64 when using amd cpu> <Absolute Path to Dockerfile>  --push
```
#### Authentication Error
You may have authentication Error while installing packages. 
I solved This program by Replacing "credsStore" : "desktop" in v ~/.docker/config.json with "credsStore" : "osxkeychain".
``` 
// ~/.docker/config.json
"credsStore" : "desktop" -> "credsStore" : "osxkeychain"

```

### 2. Install 

Install exetension Docker and latex-workshop in VScode.
write this in setting.json of VSCODE

```
{
    //Latex
    "latex-workshop.latex.recipe.default": "latexmk (latexmkrc)",
    "latex-workshop.docker.enabled": true,
    "latex-workshop.docker.image.latex": "<Your Docker UserName>/texlive-ja",
    "latex-workshop.latex.autoBuild.run": "onFileChange",
    "latex-workshop.latex.autoClean.run": "onFailed",
    "latex-workshop.view.pdf.viewer": "tab",
    // you can have other config in setting.json .
}
```

### 3. write latexmkrc

make a file named latexmkrc in the directory as same as the directory in which .tex file is.

```
$latex = 'platex';
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx -V 7 %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 3;
$ENV{TZ} = 'Asia/Tokyo';
$ENV{OPENTYPEFONTS} = '/usr/share/fonts//:';
$ENV{TTFONTS} = '/usr/share/fonts//:';
```

### 4. finish
now you can compile .tex file.
