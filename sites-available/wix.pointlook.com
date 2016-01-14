
server {

	root /home/www/wix.pointlook.com;
	index index.html index.htm;

	server_name wix.pointlook.com;

	location / {
		proxy_pass http://127.0.0.1:9000;    
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
	}
    access_log /home/www/shared/log/wix.pointlook-access.log;
    error_log /home/www/shared/log/wix.pointlook-error.log;
    error_page 404 /404.html;
}
