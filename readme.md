# dockerfile for nginx lua

This repo builds an nginx server on ubuntu xenial with lua modules enabled.

To build:
`docker build -t nginx-oss-lua .`

To run with CLI:
`docker run -it nginx-oss-lua /bin/bash`

To run web server:
`docker run -d -p 8112:80 nginx-oss-lua nginx -g 'daemon off;'`

To run web server with logs:
`docker run -d -p 8112:80 -v {{MY_LOG_PATH}}:/var/log/nginx nginx-oss-lua nginx -g 'daemon off;'`

After running the web server, go to the url

`http://localhost:8112/lua_content`

and you should see a "hello world" message.

You can edit the nginx.conf file to see different behaviors.

See the [nginx documentation](http://nginx.org/en/docs/beginners_guide.html) and the documentation for the [lua-nginx-module](https://github.com/openresty/lua-nginx-module) to configure.