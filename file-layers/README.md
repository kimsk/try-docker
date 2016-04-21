### [Layering of Docker images](http://tuhrig.de/layering-of-docker-images/)

`docker history ubuntu`

    IMAGE               CREATED             CREATED BY                                      SIZE
    cdd474520b8c        6 months ago        /bin/sh -c #(nop) CMD ["/bin/bash"]             0 B
    f03f3645bde1        6 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/   1.895 kB
    9302827ed0a5        6 months ago        /bin/sh -c echo '#!/bin/sh' > /usr/sbin/polic   194.5 kB
    48731f0a6276        6 months ago        /bin/sh -c #(nop) ADD file:ed2337b3477da68f9b   187.8 MB


#### a.Dockerfile

    FROM ubuntu
    RUN apt-get update
    RUN apt-get install -y apache2
    RUN touch /opt/a.txt

`docker build -t test/a -f a.Dockerfile .`

`docker history test/a`

    IMAGE               CREATED             CREATED BY                                      SIZE
    49e97b682b13        40 minutes ago      /bin/sh -c touch /opt/a.txt                     0 B
    201fe3a094e0        40 minutes ago      /bin/sh -c apt-get install -y apache2           14.43 MB
    ceae303cdf08        40 minutes ago      /bin/sh -c apt-get update                       21.72 MB
    cdd474520b8c        6 months ago        /bin/sh -c #(nop) CMD ["/bin/bash"]             0 B
    f03f3645bde1        6 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/   1.895 kB
    9302827ed0a5        6 months ago        /bin/sh -c echo '#!/bin/sh' > /usr/sbin/polic   194.5 kB
    48731f0a6276        6 months ago        /bin/sh -c #(nop) ADD file:ed2337b3477da68f9b   187.8 MB

#### b.Dockerfile

    FROM ubuntu
    RUN apt-get update
    RUN apt-get install -y apache2
    RUN touch /opt/b.txt

`docker build -t test/a -f b.Dockerfile .`

`docker history test/b`

    IMAGE               CREATED             CREATED BY                                      SIZE
    b29c5312c42a        7 minutes ago       /bin/sh -c touch /opt/b.txt                     0 B
    201fe3a094e0        42 minutes ago      /bin/sh -c apt-get install -y apache2           14.43 MB
    ceae303cdf08        42 minutes ago      /bin/sh -c apt-get update                       21.72 MB
    cdd474520b8c        6 months ago        /bin/sh -c #(nop) CMD ["/bin/bash"]             0 B
    f03f3645bde1        6 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/   1.895 kB
    9302827ed0a5        6 months ago        /bin/sh -c echo '#!/bin/sh' > /usr/sbin/polic   194.5 kB
    48731f0a6276        6 months ago        /bin/sh -c #(nop) ADD file:ed2337b3477da68f9b   187.8 MB

#### ab.Dockerfile

    FROM ubuntu
    RUN apt-get update
    RUN apt-get install -y apache2
    RUN touch /opt/a.txt
    RUN touch /opt/b.txt

`docker build -t test/a -f ab.Dockerfile .`

`docker history test/ab`

    IMAGE               CREATED             CREATED BY                                      SIZE
    65a5b7f8a3dc        9 minutes ago       /bin/sh -c touch /opt/b.txt                     0 B
    49e97b682b13        43 minutes ago      /bin/sh -c touch /opt/a.txt                     0 B
    201fe3a094e0        43 minutes ago      /bin/sh -c apt-get install -y apache2           14.43 MB
    ceae303cdf08        43 minutes ago      /bin/sh -c apt-get update                       21.72 MB
    cdd474520b8c        6 months ago        /bin/sh -c #(nop) CMD ["/bin/bash"]             0 B
    f03f3645bde1        6 months ago        /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$/   1.895 kB
    9302827ed0a5        6 months ago        /bin/sh -c echo '#!/bin/sh' > /usr/sbin/polic   194.5 kB
    48731f0a6276        6 months ago        /bin/sh -c #(nop) ADD file:ed2337b3477da68f9b   187.8 MB