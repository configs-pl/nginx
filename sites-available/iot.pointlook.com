
server {

	root /home/www/iot.pointlook.com;
	index index.html index.htm;

	server_name iot.pointlook.com;

	location / {
	proxy_pass http://127.0.0.1:3010;    
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
	}
    access_log /home/www/shared/log/iot.pointlook-access.log;
    error_log /home/www/shared/log/iot.pointlook-error.log;
    error_page 404 /404.html;
}
