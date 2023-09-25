# niciliketo.github.io

To run in dev mode
```bash
docker compose up
```

To create post
```bash
./hugo.sh  new posts/<yyyy-mm-dd>-xyz.md
```

To publish
```
./publish.sh
```

To install on a new machine
This site using a theme, which is installed using git submodules
```
git submodule init
git submodule update
```
