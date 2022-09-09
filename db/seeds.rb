# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
abdulmalik = User.new({ email: 'abdulmalik.saghir@devsinc.com', fullname: 'Abdul Malik',
                        username: 'abdulmalik', kind: 'public', password: '123456',
                        password_confirmation: '123456' })
abdulmalik.save(validate: false)

ahmedwaheed = User.new({ email: 'ahmed.waheed@devsinc.com', fullname: 'Ahmed Waheed',
                         username: 'buttalpha', kind: 'public', password: '123456',
                         password_confirmation: '123456' })
ahmedwaheed.save(validate: false)
