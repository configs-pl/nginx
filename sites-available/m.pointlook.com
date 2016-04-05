
server {

	root /home/www/m.pointlook.com;
	index index.html index.htm;

	server_name m.pointlook.com;

	location / {
	proxy_pass http://127.0.0.1:8081;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
	}
    access_log /home/www/shared/log/m.pointlook-access.log;
    error_log /home/www/shared/log/m.pointlook-error.log;
    error_page 404 /404.html;
}
