# from scratch

```
docker build -t rails:ready .
docker run -it --rm --name rails -p 3000:3000 -v "$(pwd)/app:/usr/local/app" -w "/usr/local/app" rails:ready bash

rails new blog
cd blog
./bin/rails server -b 0.0.0.0
```

See it running from `http:localhost:3000` and commit the image: `docker commit rails rails:ready`
