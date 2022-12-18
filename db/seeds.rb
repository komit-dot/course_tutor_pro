# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Course.create(name: "BCA", subject: "Computer Application", duration_month: 36)
Course.create(name: "BBA", subject: "Business Administration", duration_month: 36)
Course.create(name: "BSC", subject: "Science", duration_month: 36)
Course.create(name: "BTech.", subject: "Engineering", duration_month: 48)
Course.create(name: "B.Farma", subject: "Pharmacy", duration_month: 48)

Tutor.create(full_name: "Anthony", course_id: 1, address: "Parliament Street", 
	mobile_no: 983812349, email: "anthony@gmail.com", )
Tutor.create(full_name: "Bharat", course_id: 2, address: "Parliament9 Street", 
	mobile_no: 983812348, email: "bharat@gmail.com", )
Tutor.create(full_name: "Chetan", course_id: 1, address: "Parliament2 Street", 
	mobile_no: 983812345, email: "chetan11@gmail.com", )