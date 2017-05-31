# Version 0.0.1
FROM ubuntu:16.04
MAINTAINER Albina Kit
RUN apt-get update
RUN apt-get install apache2
RUN apt-get install nano
RUN mkdir -p /var/www/f1.kit/public_html
RUN mkdir -p /var/www/f2.kit/public_html
RUN chown -R $USER:$USER /var/www/f1.kit/public_html
RUN chown -R $USER:$USER /var/www/f2.kit/public_html
RUN chmod -R 755 /var/www
RUN nano /var/www/f1.kit/public_html/index.html
RUN cp /var/www/f1.kit/public_html/index.html /var/www/f2.kit/public_html/index.html
RUN nano /var/www/f2.kit/public_html/index.html
RUN cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/f1.kit.conf
RUN nano /etc/apache2/sites-available/f1.kit.conf
RUN cp /etc/apache2/sites-available/f1.kit.conf /etc/apache2/sites-available/f2.kit.conf
RUN nano /etc/apache2/sites-available/f2.kit.conf
RUN a2ensite f1.kit.conf
RUN a2ensite f2.kit.conf
RUN service apache2 restart
EXPOSE 80
