#!/bin/bash

# ============================================================
# WordPress 一键安装脚本 (Caddy + PHP + MariaDB + WordPress)
# 适用系统: Debian 10/11/12
# ============================================================

set -euo pipefail

# ──────────────────────────────────────────────
# 颜色定义
# ──────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ──────────────────────────────────────────────
# 辅助函数
# ──────────────────────────────────────────────
info()    { echo -e "${CYAN}[INFO]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[ERR]${NC}  $*"; }
header()  { echo -e "\n${BOLD}${BLUE}══════════════════════════════════════════${NC}"; echo -e "${BOLD}${BLUE}  $*${NC}"; echo -e "${BOLD}${BLUE}══════════════════════════════════════════${NC}\n"; }

# ──────────────────────────────────────────────
# 检查 root 权限
# ──────────────────────────────────────────────
if [[ $EUID -ne 0 ]]; then
  error "请以 root 权限运行此脚本（sudo bash $0）"
  exit 1
fi

# ──────────────────────────────────────────────
# 检查操作系统
# ──────────────────────────────────────────────
if [[ ! -f /etc/debian_version ]]; then
  error "此脚本仅支持 Debian 系统"
  exit 1
fi

DEBIAN_VERSION=$(cat /etc/debian_version | cut -d'.' -f1)
info "检测到 Debian 版本: $(cat /etc/debian_version)"

# ──────────────────────────────────────────────
# 检测服务状态函数
# ──────────────────────────────────────────────
check_installed() {
  command -v "$1" &>/dev/null || dpkg -l "$1" &>/dev/null 2>&1
}

check_service_running() {
  systemctl is-active --quiet "$1" 2>/dev/null
}

get_version() {
  case "$1" in
    caddy)   caddy version 2>/dev/null | head -1 | awk '{print $1}' || echo "未安装" ;;
    php)     php --version 2>/dev/null | head -1 | awk '{print $2}' || echo "未安装" ;;
    mariadb) mysql --version 2>/dev/null | awk '{print $3}' || echo "未安装" ;;
    wordpress) [[ -f /var/www/wordpress/wp-config.php || -f /var/www/wordpress/wp-config-sample.php ]] && echo "已安装" || echo "未安装" ;;
  esac
}

# ──────────────────────────────────────────────
# 显示服务状态表格
# ──────────────────────────────────────────────
show_status_table() {
  header "当前服务状态检测"

  # 定义服务列表
  declare -A services=(
    ["caddy"]="caddy"
    ["php"]="php-fpm"
    ["mariadb"]="mariadb"
  )

  printf "${BOLD}%-15s %-12s %-12s %-15s${NC}\n" "服务" "已安装" "运行状态" "版本"
  printf '%.0s─' {1..55}; echo

  # Caddy
  if check_installed caddy; then
    CADDY_INST="${GREEN}✓ 已安装${NC}"
    CADDY_VER=$(get_version caddy)
  else
    CADDY_INST="${RED}✗ 未安装${NC}"
    CADDY_VER="-"
  fi
  check_service_running caddy && CADDY_RUN="${GREEN}● 运行中${NC}" || CADDY_RUN="${RED}○ 未运行${NC}"
  printf "%-15s " "Caddy"
  printf "${CADDY_INST}"
  printf " %-12s " ""
  printf "${CADDY_RUN}"
  printf " %-15s\n" "$CADDY_VER"

  # PHP
  PHP_PKG=$(dpkg -l 'php*-fpm' 2>/dev/null | grep '^ii' | head -1 | awk '{print $2}' || true)
  if [[ -n "$PHP_PKG" ]]; then
    PHP_INST="${GREEN}✓ 已安装${NC}"
    PHP_VER=$(php --version 2>/dev/null | head -1 | awk '{print $2}' || echo "未知")
    PHP_SVC=$(echo "$PHP_PKG" | sed 's/php/php/;s/-fpm//')
    check_service_running "php${PHP_SVC##php}-fpm" 2>/dev/null && PHP_RUN="${GREEN}● 运行中${NC}" || PHP_RUN="${RED}○ 未运行${NC}"
  else
    PHP_INST="${RED}✗ 未安装${NC}"
    PHP_RUN="${RED}○ 未运行${NC}"
    PHP_VER="-"
  fi
  printf "%-15s " "PHP-FPM"
  printf "${PHP_INST}"
  printf " %-12s " ""
  printf "${PHP_RUN}"
  printf " %-15s\n" "$PHP_VER"

  # MariaDB
  if check_installed mariadb-server; then
    DB_INST="${GREEN}✓ 已安装${NC}"
    DB_VER=$(mysql --version 2>/dev/null | awk '{print $3}' || echo "未知")
  else
    DB_INST="${RED}✗ 未安装${NC}"
    DB_VER="-"
  fi
  check_service_running mariadb && DB_RUN="${GREEN}● 运行中${NC}" || DB_RUN="${RED}○ 未运行${NC}"
  printf "%-15s " "MariaDB"
  printf "${DB_INST}"
  printf " %-12s " ""
  printf "${DB_RUN}"
  printf " %-15s\n" "$DB_VER"

  # WordPress
  if [[ -f /var/www/wordpress/wp-config-sample.php ]]; then
    WP_INST="${GREEN}✓ 已安装${NC}"
    WP_RUN="${GREEN}● 可访问${NC}"
    WP_VER=$(grep "wp_version" /var/www/wordpress/wp-includes/version.php 2>/dev/null | head -1 | grep -oP "'[\d.]+'" | tr -d "'" || echo "未知")
  else
    WP_INST="${RED}✗ 未安装${NC}"
    WP_RUN="${RED}○ -${NC}"
    WP_VER="-"
  fi
  printf "%-15s " "WordPress"
  printf "${WP_INST}"
  printf " %-12s " ""
  printf "${WP_RUN}"
  printf " %-15s\n" "$WP_VER"

  printf '%.0s─' {1..55}; echo
  echo ""
}

# ──────────────────────────────────────────────
# 收集用户输入
# ──────────────────────────────────────────────
collect_user_input() {
  header "配置信息收集"

  # 域名
  echo -e "${BOLD}请输入您的域名（留空则使用服务器 IP 访问）:${NC}"
  echo -e "${YELLOW}  提示: 使用域名时 Caddy 会自动申请 SSL 证书${NC}"
  read -rp "  域名 > " DOMAIN
  DOMAIN="${DOMAIN:-}"

  if [[ -z "$DOMAIN" ]]; then
    SERVER_IP=$(curl -s4 ifconfig.me 2>/dev/null || hostname -I | awk '{print $1}')
    DOMAIN="$SERVER_IP"
    warn "将使用 IP 地址访问: $DOMAIN（不支持 HTTPS）"
    USE_IP=true
  else
    USE_IP=false
    info "域名: $DOMAIN"
  fi

  echo ""

  # WordPress 数据库配置
  echo -e "${BOLD}WordPress 数据库配置:${NC}"

  read -rp "  数据库名称 [wordpress]: " WP_DB_NAME
  WP_DB_NAME="${WP_DB_NAME:-wordpress}"

  read -rp "  数据库用户名 [wpuser]: " WP_DB_USER
  WP_DB_USER="${WP_DB_USER:-wpuser}"

  # 生成随机密码
  WP_DB_PASS_DEFAULT=$(openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 16)
  read -rp "  数据库密码 [随机生成: ${WP_DB_PASS_DEFAULT}]: " WP_DB_PASS
  WP_DB_PASS="${WP_DB_PASS:-$WP_DB_PASS_DEFAULT}"

  echo ""
  info "配置摘要:"
  echo "  域名/IP    : $DOMAIN"
  echo "  数据库名   : $WP_DB_NAME"
  echo "  数据库用户 : $WP_DB_USER"
  echo "  数据库密码 : $WP_DB_PASS"
  echo ""
  read -rp "确认以上信息? [Y/n]: " CONFIRM
  CONFIRM="${CONFIRM:-Y}"
  if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "已取消。请重新运行脚本。"
    exit 0
  fi
}

# ──────────────────────────────────────────────
# 安装 Caddy
# ──────────────────────────────────────────────
install_caddy() {
  if check_installed caddy; then
    success "Caddy 已安装，跳过"
    return
  fi

  header "安装 Caddy"
  apt-get install -y debian-keyring debian-archive-keyring apt-transport-https curl 2>&1 | tail -3

  curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' \
    | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

  curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' \
    | tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null

  apt-get update -qq
  apt-get install -y caddy 2>&1 | tail -5
  success "Caddy 安装完成"
}

# ──────────────────────────────────────────────
# 安装 PHP
# ──────────────────────────────────────────────
install_php() {
  PHP_PKG=$(dpkg -l 'php*-fpm' 2>/dev/null | grep '^ii' | head -1 | awk '{print $2}' || true)
  if [[ -n "$PHP_PKG" ]]; then
    success "PHP-FPM 已安装，跳过"
    return
  fi

  header "安装 PHP"

  # 检测可用的 PHP 版本
  apt-get update -qq
  if apt-cache show php8.2-fpm &>/dev/null; then
    PHP_VER="8.2"
  elif apt-cache show php8.1-fpm &>/dev/null; then
    PHP_VER="8.1"
  elif apt-cache show php8.0-fpm &>/dev/null; then
    PHP_VER="8.0"
  else
    PHP_VER="7.4"
  fi

  info "将安装 PHP ${PHP_VER}"

  apt-get install -y \
    php${PHP_VER}-fpm \
    php${PHP_VER}-mysql \
    php${PHP_VER}-curl \
    php${PHP_VER}-gd \
    php${PHP_VER}-mbstring \
    php${PHP_VER}-xml \
    php${PHP_VER}-xmlrpc \
    php${PHP_VER}-zip \
    php${PHP_VER}-intl \
    php${PHP_VER}-bcmath \
    php${PHP_VER}-imagick \
    2>&1 | tail -5

  # 优化 PHP 配置
  PHP_INI="/etc/php/${PHP_VER}/fpm/php.ini"
  if [[ -f "$PHP_INI" ]]; then
    sed -i 's/^upload_max_filesize.*/upload_max_filesize = 64M/' "$PHP_INI"
    sed -i 's/^post_max_size.*/post_max_size = 64M/' "$PHP_INI"
    sed -i 's/^max_execution_time.*/max_execution_time = 300/' "$PHP_INI"
    sed -i 's/^memory_limit.*/memory_limit = 256M/' "$PHP_INI"
    info "PHP 配置已优化 (上传限制64M, 内存256M)"
  fi

  PHP_VERSION="$PHP_VER"
  success "PHP ${PHP_VER} 安装完成"
}

# ──────────────────────────────────────────────
# 安装 MariaDB
# ──────────────────────────────────────────────
install_mariadb() {
  if check_installed mariadb-server; then
    success "MariaDB 已安装，跳过"
    return
  fi

  header "安装 MariaDB"
  apt-get install -y mariadb-server mariadb-client 2>&1 | tail -5
  success "MariaDB 安装完成"
}

# ──────────────────────────────────────────────
# 配置数据库
# ──────────────────────────────────────────────
setup_database() {
  header "配置 WordPress 数据库"

  systemctl start mariadb
  systemctl enable mariadb

  # 检查数据库是否已存在
  if mysql -e "USE ${WP_DB_NAME};" 2>/dev/null; then
    warn "数据库 '${WP_DB_NAME}' 已存在"
    read -rp "是否重新创建？这将删除现有数据！[y/N]: " RECREATE
    if [[ "$RECREATE" =~ ^[Yy]$ ]]; then
      mysql -e "DROP DATABASE IF EXISTS ${WP_DB_NAME};"
    else
      info "保留现有数据库"
      return
    fi
  fi

  mysql <<EOF
CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'localhost' IDENTIFIED BY '${WP_DB_PASS}';
GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO '${WP_DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

  # 基础安全加固（无需交互）
  mysql -e "DELETE FROM mysql.user WHERE User='';" 2>/dev/null || true
  mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" 2>/dev/null || true
  mysql -e "DROP DATABASE IF EXISTS test;" 2>/dev/null || true
  mysql -e "FLUSH PRIVILEGES;" 2>/dev/null || true

  success "数据库配置完成: ${WP_DB_NAME} / ${WP_DB_USER}"
}

# ──────────────────────────────────────────────
# 安装 WordPress
# ──────────────────────────────────────────────
install_wordpress() {
  header "安装 WordPress"

  WP_DIR="/var/www/wordpress"

  if [[ -f "${WP_DIR}/wp-config-sample.php" ]]; then
    warn "WordPress 已存在于 ${WP_DIR}"
    read -rp "是否重新下载？[y/N]: " REDOWNLOAD
    if [[ ! "$REDOWNLOAD" =~ ^[Yy]$ ]]; then
      info "保留现有 WordPress 文件"
      configure_wordpress
      return
    fi
    rm -rf "${WP_DIR}"
  fi

  mkdir -p "${WP_DIR}"
  cd /tmp

  info "下载 WordPress..."
  curl -sL https://wordpress.org/latest.tar.gz -o wordpress.tar.gz
  tar -xzf wordpress.tar.gz
  mv wordpress/* "${WP_DIR}/"
  rm -rf wordpress wordpress.tar.gz

  configure_wordpress

  # 设置目录权限
  chown -R www-data:www-data "${WP_DIR}"
  find "${WP_DIR}" -type d -exec chmod 755 {} \;
  find "${WP_DIR}" -type f -exec chmod 644 {} \;
  chmod 600 "${WP_DIR}/wp-config.php"

  success "WordPress 安装完成: ${WP_DIR}"
}

configure_wordpress() {
  WP_DIR="/var/www/wordpress"
  WP_CONFIG="${WP_DIR}/wp-config.php"

  if [[ ! -f "${WP_DIR}/wp-config-sample.php" ]]; then
    error "WordPress 文件不完整"
    exit 1
  fi

  cp "${WP_DIR}/wp-config-sample.php" "${WP_CONFIG}"

  # 生成安全密钥
  info "获取 WordPress 安全密钥..."
  WP_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/ 2>/dev/null || echo "")

  # 替换数据库配置
  sed -i "s/database_name_here/${WP_DB_NAME}/" "${WP_CONFIG}"
  sed -i "s/username_here/${WP_DB_USER}/" "${WP_CONFIG}"
  sed -i "s/password_here/${WP_DB_PASS}/" "${WP_CONFIG}"
  sed -i "s/localhost/localhost/" "${WP_CONFIG}"

  # 替换安全密钥（如果获取成功）
  if [[ -n "$WP_KEYS" ]]; then
    # 删除旧的密钥占位符并插入新密钥
    KEYS_START="define( 'AUTH_KEY'"
    KEYS_END="define( 'NONCE_SALT'"
    sed -i "/${KEYS_START}/,/${KEYS_END}/d" "${WP_CONFIG}"
    # 在 WP_DEBUG 前插入密钥
    sed -i "/define( 'WP_DEBUG'/i ${WP_KEYS}" "${WP_CONFIG}" 2>/dev/null || true
  fi

  # 设置表前缀（增加安全性）
  RAND_PREFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 4)
  sed -i "s/\$table_prefix = 'wp_'/\$table_prefix = 'wp${RAND_PREFIX}_'/" "${WP_CONFIG}"

  # 添加 HTTPS 支持配置
  if [[ "$USE_IP" == "false" ]]; then
    sed -i "/\/\*\*#@-\*\//a define('FORCE_SSL_ADMIN', true);" "${WP_CONFIG}" 2>/dev/null || true
  fi

  success "wp-config.php 配置完成"
}

# ──────────────────────────────────────────────
# 配置 Caddy
# ──────────────────────────────────────────────
configure_caddy() {
  header "配置 Caddy Web 服务器"

  # 检测 PHP 版本和 socket
  PHP_VERSION=$(php --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+' | head -1 || echo "8.2")
  PHP_SOCKET="/run/php/php${PHP_VERSION}-fpm.sock"

  WP_DIR="/var/www/wordpress"

  if [[ "$USE_IP" == "true" ]]; then
    # IP 访问模式（无 HTTPS）
    CADDY_SITE=":80"
  else
    # 域名模式（自动 HTTPS）
    CADDY_SITE="${DOMAIN}"
  fi

  cat > /etc/caddy/Caddyfile <<EOF
${CADDY_SITE} {
    root * ${WP_DIR}
    encode gzip

    php_fastcgi unix/${PHP_SOCKET}

    file_server

    # WordPress 固定链接支持
    @notStatic {
        not file
        not path /wp-admin/*
    }
    rewrite @notStatic /index.php?{query}

    # 安全 Header
    header {
        X-Content-Type-Options nosniff
        X-Frame-Options SAMEORIGIN
        Referrer-Policy strict-origin-when-cross-origin
        -Server
    }

    # 禁止访问敏感文件
    @sensitive {
        path /wp-config.php
        path /.htaccess
        path /xmlrpc.php
        path *.log
    }
    respond @sensitive 403

    log {
        output file /var/log/caddy/wordpress.log {
            roll_size 10mb
            roll_keep 5
        }
    }
}
EOF

  mkdir -p /var/log/caddy
  chown caddy:caddy /var/log/caddy

  # 验证 Caddyfile 语法
  caddy validate --config /etc/caddy/Caddyfile 2>&1 && success "Caddyfile 语法验证通过" || {
    warn "Caddyfile 语法警告（可能影响 HTTPS 自动申请）"
  }

  success "Caddy 配置完成"
}

# ──────────────────────────────────────────────
# 启动所有服务
# ──────────────────────────────────────────────
start_services() {
  header "启动服务"

  PHP_VERSION=$(php --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+' | head -1 || echo "8.2")

  # PHP-FPM
  info "启动 PHP-FPM..."
  systemctl enable php${PHP_VERSION}-fpm
  systemctl restart php${PHP_VERSION}-fpm
  check_service_running php${PHP_VERSION}-fpm && success "PHP-FPM 运行中" || error "PHP-FPM 启动失败"

  # MariaDB
  info "启动 MariaDB..."
  systemctl enable mariadb
  systemctl restart mariadb
  check_service_running mariadb && success "MariaDB 运行中" || error "MariaDB 启动失败"

  # Caddy
  info "启动 Caddy..."
  systemctl enable caddy
  systemctl restart caddy
  sleep 2
  check_service_running caddy && success "Caddy 运行中" || {
    error "Caddy 启动失败，查看日志:"
    journalctl -u caddy -n 20 --no-pager
  }
}

# ──────────────────────────────────────────────
# 配置防火墙（如果存在 ufw）
# ──────────────────────────────────────────────
configure_firewall() {
  if command -v ufw &>/dev/null && ufw status | grep -q "active"; then
    header "配置防火墙"
    ufw allow 80/tcp  > /dev/null
    ufw allow 443/tcp > /dev/null
    success "防火墙已放行 80/443 端口"
  fi
}

# ──────────────────────────────────────────────
# 显示安装完成信息
# ──────────────────────────────────────────────
show_completion() {
  echo ""
  echo -e "${BOLD}${GREEN}╔══════════════════════════════════════════════╗${NC}"
  echo -e "${BOLD}${GREEN}║          🎉 WordPress 安装完成！              ║${NC}"
  echo -e "${BOLD}${GREEN}╚══════════════════════════════════════════════╝${NC}"
  echo ""

  if [[ "$USE_IP" == "true" ]]; then
    echo -e "  ${BOLD}访问地址:${NC} ${CYAN}http://${DOMAIN}/${NC}"
    warn "  使用 IP 访问，不支持 HTTPS"
  else
    echo -e "  ${BOLD}访问地址:${NC} ${CYAN}https://${DOMAIN}/${NC}"
    echo -e "  ${BOLD}管理后台:${NC} ${CYAN}https://${DOMAIN}/wp-admin/${NC}"
    info "  Caddy 将自动申请 Let's Encrypt SSL 证书（需要域名已解析）"
  fi

  echo ""
  echo -e "  ${BOLD}数据库信息（请妥善保存）:${NC}"
  echo -e "  ┌─────────────────────────────────────────┐"
  echo -e "  │  数据库名:   ${YELLOW}${WP_DB_NAME}${NC}"
  echo -e "  │  用户名:     ${YELLOW}${WP_DB_USER}${NC}"
  echo -e "  │  密码:       ${YELLOW}${WP_DB_PASS}${NC}"
  echo -e "  │  主机:       ${YELLOW}localhost${NC}"
  echo -e "  └─────────────────────────────────────────┘"
  echo ""
  echo -e "  ${BOLD}文件位置:${NC}"
  echo -e "  WordPress:  /var/www/wordpress/"
  echo -e "  Caddy 配置: /etc/caddy/Caddyfile"
  echo -e "  Caddy 日志: /var/log/caddy/wordpress.log"
  echo ""
  echo -e "  ${BOLD}服务管理命令:${NC}"
  PHP_VER=$(php --version 2>/dev/null | head -1 | grep -oP '\d+\.\d+' | head -1 || echo "8.x")
  echo -e "  ${CYAN}systemctl restart caddy${NC}"
  echo -e "  ${CYAN}systemctl restart mariadb${NC}"
  echo -e "  ${CYAN}systemctl restart php${PHP_VER}-fpm${NC}"
  echo ""
  echo -e "${YELLOW}  请在浏览器打开上方地址，完成 WordPress 初始化安装。${NC}"
  echo ""
}

# ──────────────────────────────────────────────
# 主流程
# ──────────────────────────────────────────────
main() {
  clear
  echo -e "${BOLD}${BLUE}"
  cat <<'BANNER'
  ██╗    ██╗ ██████╗ ██████╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗███████╗
  ██║    ██║██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
  ██║ █╗ ██║██║   ██║██████╔╝██║  ██║██████╔╝██████╔╝█████╗  ███████╗███████╗
  ██║███╗██║██║   ██║██╔══██╗██║  ██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║
  ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝██║     ██║  ██║███████╗███████║███████║
   ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
     Caddy + PHP + MariaDB + WordPress 一键安装脚本 (Debian)
BANNER
  echo -e "${NC}"

  # 1. 检测当前状态
  show_status_table

  # 2. 收集用户配置
  collect_user_input

  # 3. 更新系统包列表
  header "更新系统包列表"
  apt-get update -qq
  apt-get install -y curl wget gnupg2 lsb-release ca-certificates openssl 2>&1 | tail -3
  success "系统包列表更新完成"

  # 4. 安装各服务
  install_caddy
  install_php
  install_mariadb

  # 5. 配置数据库
  setup_database

  # 6. 安装 WordPress
  install_wordpress

  # 7. 配置 Caddy
  configure_caddy

  # 8. 启动服务
  start_services

  # 9. 配置防火墙
  configure_firewall

  # 10. 显示完成信息
  show_completion
}

main "$@"
