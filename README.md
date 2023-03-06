## ScriptLauncher
#### These are bash scripts that can be used to easily interact with:

* translate-shell
* yt-dlp
* ffmpeg
* w3m

### Dependencies

* bash
* docker

### Installation
* Linux (bash/sh/zsh)
```
git clone https://github.com/fatualux/scriptLauncher && cd scriptLauncher
chmod +x install.sh
./install.sh
```

### Usage

```
docker run -v $(pwd):/scriptLauncher/ -it scriptlauncher
```
