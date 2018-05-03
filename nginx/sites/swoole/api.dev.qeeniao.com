server {
    listen       80;
    server_name  api.dev.qeeniao.com;
    root  /var/www/qeeniao/public/;
    index  index.html index.htm index.php;

    access_log  /var/log/api.dev.qeeniao.com.access.log;
    error_log   /var/log/api.dev.qeeniao.com.error.log;

    location / {
        try_files $uri $uri/ @laravels;
    }
    location @laravels {
        proxy_http_version 1.1;
        # proxy_connect_timeout 60s;
        # proxy_send_timeout 60s;
        # proxy_read_timeout 120s;
        proxy_set_header Connection "keep-alive";
        # 如果有多层反向代理，注意IP别搞错了
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_set_header SCHEME "https";
        proxy_pass http://laravels;
        proxy_redirect default;
    }

    upstream laravels {
        server php-swoole:5200;
    }
}