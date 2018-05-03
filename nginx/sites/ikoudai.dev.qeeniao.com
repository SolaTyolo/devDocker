server {
    listen       80;
    server_name  ikoudai.dev.qeeniao.com;
    root  /var/www/qeeniao/public/;
    index  index.html index.htm index.php;

    access_log  /var/log/ikoudai.dev.qeeniao.com.access.log;
    error_log   /var/log/ikoudai.dev.qeeniao.com.error.log;

    location / {
            try_files $uri $uri/ /index.php?$args;
        }

    location ~ \.php$ {
        fastcgi_pass   php-fpm:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include        fastcgi_params;
        try_files $uri =404;
    }

        location ~ /\.(git|svn|ht) {
                deny all;
        }
}