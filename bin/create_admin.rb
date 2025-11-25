#!/usr/bin/env ruby
require_relative '../config/environment'

# Create admin user
admin = AdminUser.new(
  username: 'admin',
  password: 'password123'
)

if admin.save
  puts "✅ Admin kullanıcısı oluşturuldu!"
  puts "Kullanıcı Adı: admin"
  puts "Şifre: password123"
else
  puts "❌ Hata: Admin kullanıcısı oluşturulamadı."
end
