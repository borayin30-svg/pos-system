INSTALLATION GUIDE
==================

POS Business System - Step-by-Step Setup

## Step 1: Prerequisites
- XAMPP (PHP 8.1+, MySQL 5.7+)
- Git
- Composer

## Step 2: Clone Repository
git clone https://github.com/yourusername/pos-system.git
cd pos-system

## Step 3: Setup Environment
cp .env.example .env

Edit .env file:
DB_HOST=localhost
DB_NAME=pos_system
DB_USER=root
DB_PASSWORD=

## Step 4: Install Dependencies
composer install

## Step 5: Create Database
mysql -u root -e "CREATE DATABASE pos_system DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root pos_system < database/schema.sql

## Step 6: Insert Default Admin User
mysql -u root pos_system -e "INSERT INTO users (username, email, password, first_name, last_name, role_id, is_active) VALUES ('vanny', 'admin@pos-system.local', '\$2y\$12\$aBc1234567890aBc1234567890aBc1234567890aBc1234567890', 'វន្នី', 'Vanny', 1, 1);"

## Step 7: Start XAMPP
- Start Apache and MySQL services

## Step 8: Access System
http://localhost/pos-system

## Default Login
Username: vanny
Password: Admin123!

## Troubleshooting

### Database Connection Error
- Check DB credentials in .env
- Ensure MySQL is running
- Verify database created: mysql -u root -e "SHOW DATABASES;"

### 404 Not Found
- Check .htaccess in public folder
- Enable mod_rewrite: a2enmod rewrite
- Restart Apache

### Permission Denied Errors
- Set write permissions: chmod -R 755 uploads/ logs/ cache/
- Check owner: chown -R www-data:www-data pos-system/

### Composer Issues
- Update: composer update
- Clear cache: composer clear-cache

## First Time Setup Checklist
☐ Clone repository
☐ Copy .env.example to .env
☐ Edit .env with database credentials
☐ Run composer install
☐ Create database
☐ Import schema.sql
☐ Start XAMPP (Apache + MySQL)
☐ Login with vanny/Admin123!
☐ Change admin password
☐ Configure email settings (optional)
☐ Set up Telegram bot (optional)

## File/Folder Permissions
logs/       - 755 (writable)
cache/      - 755 (writable)
uploads/    - 755 (writable)
.env        - 600 (readable only)
public/     - 755 (world readable)

## Security Notes
1. Change default admin password immediately
2. Keep .env file secure (never commit to git)
3. Use HTTPS in production
4. Disable debug mode in production (APP_DEBUG=false)
5. Regular database backups
6. Keep PHP/MySQL updated
7. Restrict .htaccess files (chmod 600)

## Production Deployment

### 1. Configure .env for Production
APP_ENV=production
APP_DEBUG=false
DB_HOST=your_db_host
DB_NAME=pos_system
DB_USER=pos_user
DB_PASSWORD=strong_password
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587

### 2. Enable HTTPS
- Get SSL certificate
- Configure web server
- Update APP_URL to https://

### 3. Set File Permissions
chmod 644 app/config/*.php
chmod 755 app/
chmod 755 logs/ cache/ uploads/

### 4. Database Optimization
- Create indexes
- Regular backups
- Monitor growth

### 5. Monitoring
- Check error logs: tail -f logs/error.log
- Monitor disk space
- Watch database size
- Set up log rotation

## Backup & Recovery

### Manual Backup
mysqldump -u root pos_system > backup_$(date +%Y%m%d).sql

### Restore from Backup
mysql -u root pos_system < backup_20260601.sql

### Automated Backup (Cron)
0 2 * * * mysqldump -u root pos_system > /backups/pos_system_$(date +\%Y\%m\%d).sql

## Support
For issues: https://github.com/yourusername/pos-system/issues
Documentation: README.md
