# 使用官方 PHP 镜像，带 FPM 支持
FROM php:8.2-fpm

# 安装 nginx 和其他必要工具
RUN apt-get update && apt-get install -y \
    nginx \
    vim \
    curl \
    unzip \
    && docker-php-ext-install pdo pdo_mysql && apt-get install -y libmariadb-dev \
                                                && docker-php-ext-install pdo pdo_mysql mysqli \
                                                && docker-php-ext-enable pdo pdo_mysql mysqli

# 安装 Composer（PHP 包管理器）
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置工作目录
WORKDIR /var/www/html

# 复制 PHP 项目代码到容器中
COPY . .

# 复制 nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 复制启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 设置权限
RUN chown -R www-data:www-data /var/www/html

# 暴露 HTTP 端口
EXPOSE 80

# 使用启动脚本启动 nginx 和 php-fpm
CMD ["/start.sh"]
