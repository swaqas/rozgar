# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110530115009) do

  create_table "admin_users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.boolean  "super"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicants", :force => true do |t|
    t.string   "serial"
    t.date     "entry_date"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_first_name"
    t.string   "father_last_name"
    t.string   "id_card_number"
    t.string   "address"
    t.string   "street"
    t.integer  "city_id"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "mobile"
    t.string   "education"
    t.string   "experience"
    t.string   "occupation"
    t.string   "about"
    t.string   "family"
    t.integer  "number_of_children"
    t.string   "prior_dues"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "children", :force => true do |t|
    t.string   "child_name"
    t.string   "detail"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer  "donner_id"
    t.decimal  "amount",      :precision => 10, :scale => 0
    t.date     "received_at"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donner_applicants", :force => true do |t|
    t.integer  "donner_id"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donners", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "street"
    t.integer  "city_id"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "mobile"
    t.string   "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "random_code"
  end

  create_table "expenditures", :force => true do |t|
    t.string   "detail"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guarantors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_first_name"
    t.string   "father_last_name"
    t.string   "id_card_number"
    t.string   "address"
    t.string   "street"
    t.integer  "city_id"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "mobile"
    t.string   "education"
    t.string   "relationship"
    t.string   "opinion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
  end

  create_table "incomes", :force => true do |t|
    t.string   "detail"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_grants", :force => true do |t|
    t.integer  "applicant_id"
    t.decimal  "loan_amount",       :precision => 10, :scale => 0
    t.decimal  "returned_amount",   :precision => 10, :scale => 0
    t.decimal  "instalment_amount", :precision => 10, :scale => 0
    t.string   "comment"
    t.integer  "grant_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_payments", :force => true do |t|
    t.integer  "applicant_id"
    t.integer  "loan_grant_id"
    t.decimal  "amount",        :precision => 10, :scale => 0
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_transaction_types", :force => true do |t|
    t.string   "transaction_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_transactions", :force => true do |t|
    t.integer  "donner_id"
    t.integer  "applicant_id"
    t.decimal  "debit",               :precision => 10, :scale => 0
    t.decimal  "credit",              :precision => 10, :scale => 0
    t.string   "comment"
    t.integer  "transaction_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_plans", :force => true do |t|
    t.string   "detail"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
