FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3
RUN echo 1.0 >> /etc/version && apt-get install -y git \
	&& apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
WORKDIR /datos1
RUN touch f2.txt

##Copié el archivo index.html que está en /imagen_python en el directorio /datos del contenedor##
#COPY index1.html . 

##ADD##
#ADD docs docs



##ENV creo dos variables de entorno y creo los directorios con mkdir##
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

###ARG###
#ARG dir2
#RUN mkdir $dir2
#ARG user 
#ENV user_docker $user 
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh  

###EXPOSE###
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

###CMD###
#Al arrancar el contenedor, se ejecutará entrypoint.sh
CMD /datos1/entrypoint.sh

#ENTRYPOINT ["/bin/bash"]

