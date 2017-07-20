## Basic example of uwsgi app controlled by emperor

### Getting started
Build the docker image with `make`

Run the docker container with `make run`

Get a bash prompt on the container with `make shell`

The container runs two uwsgi apps behind nginx that are managed by emperor.

myapp can be accessed at http://localhost:8888
myapp2 can be accessed at http://localhost:8889

On startup only myapp is enabled. To enable myapp2 get a shell with `make shell`. Then run `cp /etc/uwsgi/vassals/myapp.ini /etc/uwsgi/vassals/myapp2.ini`. 

Emperor will bootstrap the second app. You can restart an app by running `touch /etc/uwsgi/vassals/myapp.ini` or by running `\cp -f /etc/uwsgi/vassals/myapp2.ini /etc/uwsgi/vassals/myapp.ini`.

