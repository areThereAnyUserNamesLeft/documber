
# DOCUMBER

*A bare bones ubuntu / cucumber /selenium image so that you can just add your tests and get running*

### Docker Basics

##### Running docker on most Linux systems

1. as root run:- <kbd># systemctl start docker</kbd> _to start the docker service_

Once done then you might want the following:

##### Running and listing  

- List built images - <kbd># docker image ls </kbd>
- Run image - <kbd># docker run <-image-name-> </kbd>
- Run images with args - <kbd># docker run -i <-image-name-> <- arg -> </kbd> (__i__ stands for interactive mode so if you don't give it an argument then will fire you into a virtual shell session on the docker image)
- Run images with args and color terminal output <kbd># docker run -it <-image-name-> <- arg -> </kbd>
- Run images with output piped to console e.g. <kbd># docker run -it <-image-name->  cucumber --format html > myhtml.html</kbd>

##### Building 

- Navigate to the dir with the dockerfile in and run <kbd># docker build .</kbd>
- Build with a name <kbd># docker build <-image-name-> .</kbd> - (hint remember the '.') 

