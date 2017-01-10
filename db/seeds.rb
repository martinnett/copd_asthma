# 初始化管理员
admin = User.create({
  username: 'admin',
  realname: '管理员',
  password: '123456',
  password_confirmation: '123456'
})
