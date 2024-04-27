FROM ubuntu
RUN apt update
RUN apt install -y apache2
RUN echo "<html>\n<head>\n\t<title> I love Docker! </title>\n</head>\n<body>\n\t<p> Hello world! I'm Viktoria and I study at ITMO University! </p>\n</body>\n</html>" > /var/www/html/index.html
##COPY etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/html.conf
RUN cd /etc/apache2/sites-available && cp 000-default.conf html.conf && a2ensite html.conf
EXPOSE 80
CMD "apache2ctl" "-D" "FOREGROUND"
