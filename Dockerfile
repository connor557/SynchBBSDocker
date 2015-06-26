############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Example julian@atechdad.com

# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################
RUN apt-get install wget build-essential pkg-config cvs python zip libnspr4-dev libncurses-dev authbind -y

RUN useradd bbsuser

RUN mkdir /sbbs

RUN wget 'http://cvs.synchro.net/cgi-bin/viewcvs.cgi/*checkout*/install/GNUmakefile' -P /sbbs

RUN cd /sbbs && make install SYMLINK=1

RUN chown -R bbsuser:bbsuser /sbbs

ADD sbbs.ini /sbbs/ctrl/sbbs.ini

RUN sed -i 's/RLoginPort=513/RLoginPort=40513/' /sbbs/ctrl/sbbs.ini

RUN touch /etc/authbind/byport/18
RUN chmod 500 /etc/authbind/byport/18
RUN chown bbsuser /etc/authbind/byport/18

RUN touch /etc/authbind/byport/23
RUN chmod 500 /etc/authbind/byport/23
RUN chown bbsuser /etc/authbind/byport/23

RUN touch /etc/authbind/byport/21
RUN chmod 500 /etc/authbind/byport/21
RUN chown bbsuser /etc/authbind/byport/21

RUN touch /etc/authbind/byport/119
RUN chmod 500 /etc/authbind/byport/119
RUN chown bbsuser /etc/authbind/byport/119

RUN touch /etc/authbind/byport/110
RUN chmod 500 /etc/authbind/byport/110
RUN chown bbsuser /etc/authbind/byport/110

RUN touch /etc/authbind/byport/22
RUN chmod 500 /etc/authbind/byport/22
RUN chown bbsuser /etc/authbind/byport/22

RUN touch /etc/authbind/byport/25
RUN chmod 500 /etc/authbind/byport/25
RUN chown bbsuser /etc/authbind/byport/25

RUN touch /etc/authbind/byport/80
RUN chmod 500 /etc/authbind/byport/80
RUN chown bbsuser /etc/authbind/byport/80

RUN touch /etc/authbind/byport/11
RUN chmod 500 /etc/authbind/byport/11
RUN chown bbsuser /etc/authbind/byport/11

RUN touch /etc/authbind/byport/17
RUN chmod 500 /etc/authbind/byport/17
RUN chown bbsuser /etc/authbind/byport/17

RUN touch /etc/authbind/byport/79
RUN chmod 500 /etc/authbind/byport/79
RUN chown bbsuser /etc/authbind/byport/79

RUN touch /etc/authbind/byport/70
RUN chmod 500 /etc/authbind/byport/70
RUN chown bbsuser /etc/authbind/byport/70

USER bbsuser

EXPOSE 21