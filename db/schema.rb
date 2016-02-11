# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160211000323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts_billingaddress", force: :cascade do |t|
    t.integer "profile_id",                 null: false
    t.text    "billing_address",            null: false
    t.string  "city",            limit: 50, null: false
    t.string  "country",         limit: 50, null: false
    t.string  "postal_code",     limit: 50, null: false
  end

  add_index "accounts_billingaddress", ["profile_id"], name: "accounts_billingaddress_profile_id", using: :btree

  create_table "accounts_carddetails", force: :cascade do |t|
    t.integer "profile_id",            null: false
    t.string  "firstname",  limit: 50, null: false
    t.string  "lastname",   limit: 50, null: false
  end

  add_index "accounts_carddetails", ["profile_id"], name: "accounts_carddetails_profile_id", using: :btree

  create_table "accounts_myprofile", force: :cascade do |t|
    t.string  "mugshot",    limit: 100, null: false
    t.string  "privacy",    limit: 15,  null: false
    t.integer "user_id",                null: false
    t.integer "gender",     limit: 2,   null: false
    t.string  "website",    limit: 200, null: false
    t.string  "location",   limit: 255, null: false
    t.date    "birth_date"
    t.text    "bio",                    null: false
  end

  add_index "accounts_myprofile", ["user_id"], name: "accounts_myprofile_user_id_key", unique: true, using: :btree

  create_table "ajax_upload_uploadedfile", force: :cascade do |t|
    t.datetime "creation_date",             null: false
    t.string   "file",          limit: 255, null: false
  end

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  add_index "auth_group", ["name"], name: "auth_group_name_key", unique: true, using: :btree
  add_index "auth_group", ["name"], name: "auth_group_name_like", using: :btree

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true, using: :btree
  add_index "auth_group_permissions", ["group_id"], name: "auth_group_permissions_group_id", using: :btree
  add_index "auth_group_permissions", ["permission_id"], name: "auth_group_permissions_permission_id", using: :btree

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
  end

  add_index "auth_permission", ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true, using: :btree
  add_index "auth_permission", ["content_type_id"], name: "auth_permission_content_type_id", using: :btree

  create_table "auth_user", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login",               null: false
    t.boolean  "is_superuser",             null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.datetime "date_joined",              null: false
  end

  add_index "auth_user", ["username"], name: "auth_user_username_key", unique: true, using: :btree
  add_index "auth_user", ["username"], name: "auth_user_username_like", using: :btree

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
  end

  add_index "auth_user_groups", ["group_id"], name: "auth_user_groups_group_id", using: :btree
  add_index "auth_user_groups", ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true, using: :btree
  add_index "auth_user_groups", ["user_id"], name: "auth_user_groups_user_id", using: :btree

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_user_user_permissions", ["permission_id"], name: "auth_user_user_permissions_permission_id", using: :btree
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true, using: :btree
  add_index "auth_user_user_permissions", ["user_id"], name: "auth_user_user_permissions_user_id", using: :btree

  create_table "celery_taskmeta", force: :cascade do |t|
    t.string   "task_id",   limit: 255, null: false
    t.string   "status",    limit: 50,  null: false
    t.text     "result"
    t.datetime "date_done",             null: false
    t.text     "traceback"
    t.boolean  "hidden",                null: false
    t.text     "meta"
  end

  add_index "celery_taskmeta", ["hidden"], name: "celery_taskmeta_hidden", using: :btree
  add_index "celery_taskmeta", ["task_id"], name: "celery_taskmeta_task_id_key", unique: true, using: :btree
  add_index "celery_taskmeta", ["task_id"], name: "celery_taskmeta_task_id_like", using: :btree

  create_table "celery_tasksetmeta", force: :cascade do |t|
    t.string   "taskset_id", limit: 255, null: false
    t.text     "result",                 null: false
    t.datetime "date_done",              null: false
    t.boolean  "hidden",                 null: false
  end

  add_index "celery_tasksetmeta", ["hidden"], name: "celery_tasksetmeta_hidden", using: :btree
  add_index "celery_tasksetmeta", ["taskset_id"], name: "celery_tasksetmeta_taskset_id_key", unique: true, using: :btree
  add_index "celery_tasksetmeta", ["taskset_id"], name: "celery_tasksetmeta_taskset_id_like", using: :btree

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
  end

  add_index "django_admin_log", ["content_type_id"], name: "django_admin_log_content_type_id", using: :btree
  add_index "django_admin_log", ["user_id"], name: "django_admin_log_user_id", using: :btree

  create_table "django_comment_flags", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "comment_id",            null: false
    t.string   "flag",       limit: 30, null: false
    t.datetime "flag_date",             null: false
  end

  add_index "django_comment_flags", ["comment_id"], name: "django_comment_flags_comment_id", using: :btree
  add_index "django_comment_flags", ["flag"], name: "django_comment_flags_flag", using: :btree
  add_index "django_comment_flags", ["flag"], name: "django_comment_flags_flag_like", using: :btree
  add_index "django_comment_flags", ["user_id", "comment_id", "flag"], name: "django_comment_flags_user_id_comment_id_flag_key", unique: true, using: :btree
  add_index "django_comment_flags", ["user_id"], name: "django_comment_flags_user_id", using: :btree

  create_table "django_comments", force: :cascade do |t|
    t.integer  "content_type_id",             null: false
    t.text     "object_pk",                   null: false
    t.integer  "site_id",                     null: false
    t.integer  "user_id"
    t.string   "user_name",       limit: 50,  null: false
    t.string   "user_email",      limit: 75,  null: false
    t.string   "user_url",        limit: 200, null: false
    t.text     "comment",                     null: false
    t.datetime "submit_date",                 null: false
    t.inet     "ip_address"
    t.boolean  "is_public",                   null: false
    t.boolean  "is_removed",                  null: false
  end

  add_index "django_comments", ["content_type_id"], name: "django_comments_content_type_id", using: :btree
  add_index "django_comments", ["site_id"], name: "django_comments_site_id", using: :btree
  add_index "django_comments", ["user_id"], name: "django_comments_user_id", using: :btree

  create_table "django_content_type", force: :cascade do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
  end

  add_index "django_content_type", ["app_label", "model"], name: "django_content_type_app_label_model_key", unique: true, using: :btree

  create_table "django_session", primary_key: "session_key", force: :cascade do |t|
    t.text     "session_data", null: false
    t.datetime "expire_date",  null: false
  end

  add_index "django_session", ["expire_date"], name: "django_session_expire_date", using: :btree
  add_index "django_session", ["session_key"], name: "django_session_session_key_like", using: :btree

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "django_summernote_attachment", force: :cascade do |t|
    t.string   "name",     limit: 255
    t.string   "file",     limit: 100, null: false
    t.datetime "uploaded",             null: false
  end

  create_table "djcelery_crontabschedule", force: :cascade do |t|
    t.string "minute",        limit: 64, null: false
    t.string "hour",          limit: 64, null: false
    t.string "day_of_week",   limit: 64, null: false
    t.string "day_of_month",  limit: 64, null: false
    t.string "month_of_year", limit: 64, null: false
  end

  create_table "djcelery_intervalschedule", force: :cascade do |t|
    t.integer "every",             null: false
    t.string  "period", limit: 24, null: false
  end

  create_table "djcelery_periodictask", force: :cascade do |t|
    t.string   "name",            limit: 200, null: false
    t.string   "task",            limit: 200, null: false
    t.integer  "interval_id"
    t.integer  "crontab_id"
    t.text     "args",                        null: false
    t.text     "kwargs",                      null: false
    t.string   "queue",           limit: 200
    t.string   "exchange",        limit: 200
    t.string   "routing_key",     limit: 200
    t.datetime "expires"
    t.boolean  "enabled",                     null: false
    t.datetime "last_run_at"
    t.integer  "total_run_count",             null: false
    t.datetime "date_changed",                null: false
    t.text     "description",                 null: false
  end

  add_index "djcelery_periodictask", ["crontab_id"], name: "djcelery_periodictask_crontab_id", using: :btree
  add_index "djcelery_periodictask", ["interval_id"], name: "djcelery_periodictask_interval_id", using: :btree
  add_index "djcelery_periodictask", ["name"], name: "djcelery_periodictask_name_key", unique: true, using: :btree
  add_index "djcelery_periodictask", ["name"], name: "djcelery_periodictask_name_like", using: :btree

  create_table "djcelery_periodictasks", primary_key: "ident", force: :cascade do |t|
    t.datetime "last_update", null: false
  end

  create_table "djcelery_taskstate", force: :cascade do |t|
    t.string   "state",     limit: 64,  null: false
    t.string   "task_id",   limit: 36,  null: false
    t.string   "name",      limit: 200
    t.datetime "tstamp",                null: false
    t.text     "args"
    t.text     "kwargs"
    t.datetime "eta"
    t.datetime "expires"
    t.text     "result"
    t.text     "traceback"
    t.float    "runtime"
    t.integer  "retries",               null: false
    t.integer  "worker_id"
    t.boolean  "hidden",                null: false
  end

  add_index "djcelery_taskstate", ["hidden"], name: "djcelery_taskstate_hidden", using: :btree
  add_index "djcelery_taskstate", ["name"], name: "djcelery_taskstate_name", using: :btree
  add_index "djcelery_taskstate", ["name"], name: "djcelery_taskstate_name_like", using: :btree
  add_index "djcelery_taskstate", ["state"], name: "djcelery_taskstate_state", using: :btree
  add_index "djcelery_taskstate", ["state"], name: "djcelery_taskstate_state_like", using: :btree
  add_index "djcelery_taskstate", ["task_id"], name: "djcelery_taskstate_task_id_key", unique: true, using: :btree
  add_index "djcelery_taskstate", ["task_id"], name: "djcelery_taskstate_task_id_like", using: :btree
  add_index "djcelery_taskstate", ["tstamp"], name: "djcelery_taskstate_tstamp", using: :btree
  add_index "djcelery_taskstate", ["worker_id"], name: "djcelery_taskstate_worker_id", using: :btree

  create_table "djcelery_workerstate", force: :cascade do |t|
    t.string   "hostname",       limit: 255, null: false
    t.datetime "last_heartbeat"
  end

  add_index "djcelery_workerstate", ["hostname"], name: "djcelery_workerstate_hostname_key", unique: true, using: :btree
  add_index "djcelery_workerstate", ["hostname"], name: "djcelery_workerstate_hostname_like", using: :btree
  add_index "djcelery_workerstate", ["last_heartbeat"], name: "djcelery_workerstate_last_heartbeat", using: :btree

  create_table "easy_thumbnails_source", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.datetime "modified",                 null: false
    t.string   "storage_hash", limit: 40,  null: false
  end

  add_index "easy_thumbnails_source", ["name", "storage_hash"], name: "easy_thumbnails_source_name_39229697_uniq", unique: true, using: :btree
  add_index "easy_thumbnails_source", ["name"], name: "easy_thumbnails_source_name", using: :btree
  add_index "easy_thumbnails_source", ["storage_hash"], name: "easy_thumbnails_source_storage_hash", using: :btree

  create_table "easy_thumbnails_thumbnail", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.datetime "modified",                 null: false
    t.integer  "source_id",                null: false
    t.string   "storage_hash", limit: 40,  null: false
  end

  add_index "easy_thumbnails_thumbnail", ["name"], name: "easy_thumbnails_thumbnail_name", using: :btree
  add_index "easy_thumbnails_thumbnail", ["source_id", "name", "storage_hash"], name: "easy_thumbnails_thumbnail_source_id_47e6eb80_uniq", unique: true, using: :btree
  add_index "easy_thumbnails_thumbnail", ["source_id"], name: "easy_thumbnails_thumbnail_source_id", using: :btree
  add_index "easy_thumbnails_thumbnail", ["storage_hash"], name: "easy_thumbnails_thumbnail_storage_hash", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.string   "youtube"
    t.string   "event_url"
    t.string   "questions_url"
    t.boolean  "next_in_line"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "guardian_groupobjectpermission", force: :cascade do |t|
    t.integer "permission_id",               null: false
    t.integer "content_type_id",             null: false
    t.integer "group_id",                    null: false
    t.string  "object_pk",       limit: 255, null: false
  end

  add_index "guardian_groupobjectpermission", ["content_type_id"], name: "guardian_groupobjectpermission_content_type_id", using: :btree
  add_index "guardian_groupobjectpermission", ["group_id"], name: "guardian_groupobjectpermission_group_id", using: :btree
  add_index "guardian_groupobjectpermission", ["object_pk", "group_id", "content_type_id", "permission_id"], name: "guardian_groupobjectpermission_object_pk_122874e9_uniq", unique: true, using: :btree
  add_index "guardian_groupobjectpermission", ["permission_id"], name: "guardian_groupobjectpermission_permission_id", using: :btree

  create_table "guardian_userobjectpermission", force: :cascade do |t|
    t.integer "permission_id",               null: false
    t.integer "content_type_id",             null: false
    t.integer "user_id",                     null: false
    t.string  "object_pk",       limit: 255, null: false
  end

  add_index "guardian_userobjectpermission", ["content_type_id"], name: "guardian_userobjectpermission_content_type_id", using: :btree
  add_index "guardian_userobjectpermission", ["object_pk", "user_id", "content_type_id", "permission_id"], name: "guardian_userobjectpermission_object_pk_2084f8ff_uniq", unique: true, using: :btree
  add_index "guardian_userobjectpermission", ["permission_id"], name: "guardian_userobjectpermission_permission_id", using: :btree
  add_index "guardian_userobjectpermission", ["user_id"], name: "guardian_userobjectpermission_user_id", using: :btree

  create_table "missings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "website",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "address"
    t.text     "description"
    t.integer  "latitude"
    t.integer  "longitude"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_auth_association", force: :cascade do |t|
    t.string  "server_url", limit: 255, null: false
    t.string  "handle",     limit: 255, null: false
    t.string  "secret",     limit: 255, null: false
    t.integer "issued",                 null: false
    t.integer "lifetime",               null: false
    t.string  "assoc_type", limit: 64,  null: false
  end

  add_index "social_auth_association", ["handle", "server_url"], name: "social_auth_association_handle_207fa6ae_uniq", unique: true, using: :btree
  add_index "social_auth_association", ["issued"], name: "social_auth_association_issued", using: :btree

  create_table "social_auth_nonce", force: :cascade do |t|
    t.string  "server_url", limit: 255, null: false
    t.integer "timestamp",              null: false
    t.string  "salt",       limit: 40,  null: false
  end

  add_index "social_auth_nonce", ["timestamp", "salt", "server_url"], name: "social_auth_nonce_timestamp_10adadb6_uniq", unique: true, using: :btree
  add_index "social_auth_nonce", ["timestamp"], name: "social_auth_nonce_timestamp", using: :btree

  create_table "social_auth_usersocialauth", force: :cascade do |t|
    t.integer "user_id",                null: false
    t.string  "provider",   limit: 32,  null: false
    t.string  "uid",        limit: 255, null: false
    t.text    "extra_data",             null: false
  end

  add_index "social_auth_usersocialauth", ["provider", "uid"], name: "social_auth_usersocialauth_provider_1d3b5e05_uniq", unique: true, using: :btree
  add_index "social_auth_usersocialauth", ["user_id"], name: "social_auth_usersocialauth_user_id", using: :btree

  create_table "south_migrationhistory", force: :cascade do |t|
    t.string   "app_name",  limit: 255, null: false
    t.string   "migration", limit: 255, null: false
    t.datetime "applied",               null: false
  end

  create_table "trucfund_backer", force: :cascade do |t|
    t.integer  "project_id",                null: false
    t.integer  "profile_id",                null: false
    t.integer  "pledge_amount",             null: false
    t.datetime "pledge_date",               null: false
    t.integer  "reward_id"
    t.string   "payment_status", limit: 20
  end

  add_index "trucfund_backer", ["profile_id"], name: "trucfund_backer_profile_id", using: :btree
  add_index "trucfund_backer", ["project_id"], name: "trucfund_backer_project_id", using: :btree
  add_index "trucfund_backer", ["reward_id"], name: "trucfund_backer_reward_id", using: :btree

  create_table "trucfund_bankaccount", force: :cascade do |t|
    t.integer "project_id",                      null: false
    t.integer "profile_id",                      null: false
    t.string  "account_holder_name", limit: 150, null: false
    t.string  "account_number",      limit: 25,  null: false
    t.string  "bank_name",           limit: 150, null: false
    t.string  "location",            limit: 50,  null: false
  end

  add_index "trucfund_bankaccount", ["profile_id"], name: "trucfund_bankaccount_profile_id", using: :btree
  add_index "trucfund_bankaccount", ["project_id"], name: "trucfund_bankaccount_project_id", using: :btree

  create_table "trucfund_comment", force: :cascade do |t|
    t.integer  "project_id",   null: false
    t.integer  "profile_id",   null: false
    t.text     "content",      null: false
    t.datetime "date_created", null: false
  end

  add_index "trucfund_comment", ["profile_id"], name: "trucfund_comment_profile_id", using: :btree
  add_index "trucfund_comment", ["project_id"], name: "trucfund_comment_project_id", using: :btree

  create_table "trucfund_feedback", force: :cascade do |t|
    t.string   "feedback_email", limit: 75, null: false
    t.string   "feedback_type",  limit: 25, null: false
    t.text     "feedback_text",             null: false
    t.datetime "post_date",                 null: false
    t.string   "feedback_title", limit: 25, null: false
  end

  create_table "trucfund_file", force: :cascade do |t|
    t.string   "upload",       limit: 100, null: false
    t.datetime "date_created",             null: false
    t.boolean  "is_image",                 null: false
  end

  create_table "trucfund_likedprojects", force: :cascade do |t|
    t.datetime "created",    null: false
    t.integer  "project_id", null: false
    t.integer  "profile_id", null: false
  end

  add_index "trucfund_likedprojects", ["profile_id"], name: "trucfund_likedprojects_profile_id", using: :btree
  add_index "trucfund_likedprojects", ["project_id"], name: "trucfund_likedprojects_project_id", using: :btree

  create_table "trucfund_milestone", force: :cascade do |t|
    t.integer "project_id",              null: false
    t.text    "description",             null: false
    t.string  "status",      limit: 20,  null: false
    t.string  "title",       limit: 100, null: false
  end

  add_index "trucfund_milestone", ["project_id"], name: "trucfund_milestone_project_id", using: :btree

  create_table "trucfund_payment", force: :cascade do |t|
    t.integer "project_id",                null: false
    t.integer "profile_id",                null: false
    t.string  "name",           limit: 50, null: false
    t.string  "account_number", limit: 12, null: false
  end

  add_index "trucfund_payment", ["profile_id"], name: "trucfund_payment_profile_id", using: :btree
  add_index "trucfund_payment", ["project_id"], name: "trucfund_payment_project_id", using: :btree

  create_table "trucfund_project", force: :cascade do |t|
    t.integer "profile_id",              null: false
    t.text    "name",                    null: false
    t.integer "goal",                    null: false
    t.string  "currency",    limit: 10,  null: false
    t.integer "duration",                null: false
    t.date    "start_date",              null: false
    t.date    "end_date",                null: false
    t.text    "blockers",                null: false
    t.string  "category",    limit: 20,  null: false
    t.text    "description",             null: false
    t.text    "tag_line",                null: false
    t.string  "image",       limit: 255, null: false
    t.string  "slug",        limit: 255, null: false
    t.string  "city",        limit: 50,  null: false
    t.string  "country",     limit: 50,  null: false
    t.boolean "approved",                null: false
    t.string  "video",       limit: 100
    t.string  "status",      limit: 20,  null: false
  end

  add_index "trucfund_project", ["profile_id"], name: "trucfund_project_profile_id", using: :btree
  add_index "trucfund_project", ["slug"], name: "trucfund_project_slug", using: :btree

  create_table "trucfund_reward", force: :cascade do |t|
    t.integer "project_id",    null: false
    t.integer "amount",        null: false
    t.text    "description",   null: false
    t.integer "total",         null: false
    t.date    "delivery_date", null: false
  end

  add_index "trucfund_reward", ["project_id"], name: "trucfund_reward_project_id", using: :btree

  create_table "trucfund_updates", force: :cascade do |t|
    t.integer  "project_id",   null: false
    t.integer  "profile_id",   null: false
    t.text     "content",      null: false
    t.datetime "date_created", null: false
  end

  add_index "trucfund_updates", ["profile_id"], name: "trucfund_updates_profile_id", using: :btree
  add_index "trucfund_updates", ["project_id"], name: "trucfund_updates_project_id", using: :btree

  create_table "upload_picture", force: :cascade do |t|
    t.string  "file",       limit: 100, null: false
    t.string  "slug",       limit: 50,  null: false
    t.integer "profile_id"
    t.date    "created"
    t.integer "project_id"
    t.string  "status",     limit: 50
  end

  add_index "upload_picture", ["profile_id"], name: "upload_picture_profile_id", using: :btree
  add_index "upload_picture", ["project_id"], name: "upload_picture_project_id", using: :btree
  add_index "upload_picture", ["slug"], name: "upload_picture_slug", using: :btree
  add_index "upload_picture", ["slug"], name: "upload_picture_slug_like", using: :btree

  create_table "userena_userenasignup", force: :cascade do |t|
    t.integer  "user_id",                                   null: false
    t.datetime "last_active"
    t.string   "activation_key",                 limit: 40, null: false
    t.boolean  "activation_notification_send",              null: false
    t.string   "email_unconfirmed",              limit: 75, null: false
    t.string   "email_confirmation_key",         limit: 40, null: false
    t.datetime "email_confirmation_key_created"
  end

  add_index "userena_userenasignup", ["user_id"], name: "userena_userenasignup_user_id_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "username",     limit: 255
    t.string   "email",        limit: 255
    t.string   "password",     limit: 255
    t.string   "website",      limit: 255
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "accounts_billingaddress", "accounts_myprofile", column: "profile_id", name: "accounts_billingaddress_profile_id_fkey"
  add_foreign_key "accounts_carddetails", "accounts_myprofile", column: "profile_id", name: "accounts_carddetails_profile_id_fkey"
  add_foreign_key "accounts_myprofile", "auth_user", column: "user_id", name: "accounts_myprofile_user_id_fkey"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "group_id_refs_id_f4b32aac"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissions_permission_id_fkey"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_d043b34a"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_fkey"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "user_id_refs_id_40c41112"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permissions_permission_id_fkey"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "user_id_refs_id_4dc23c39"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_fkey"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_fkey"
  add_foreign_key "django_comment_flags", "auth_user", column: "user_id", name: "django_comment_flags_user_id_fkey"
  add_foreign_key "django_comment_flags", "django_comments", column: "comment_id", name: "django_comment_flags_comment_id_fkey"
  add_foreign_key "django_comments", "auth_user", column: "user_id", name: "django_comments_user_id_fkey"
  add_foreign_key "django_comments", "django_content_type", column: "content_type_id", name: "django_comments_content_type_id_fkey"
  add_foreign_key "django_comments", "django_site", column: "site_id", name: "django_comments_site_id_fkey"
  add_foreign_key "djcelery_periodictask", "djcelery_crontabschedule", column: "crontab_id", name: "crontab_id_refs_id_286da0d1"
  add_foreign_key "djcelery_periodictask", "djcelery_intervalschedule", column: "interval_id", name: "interval_id_refs_id_1829f358"
  add_foreign_key "djcelery_taskstate", "djcelery_workerstate", column: "worker_id", name: "worker_id_refs_id_6fd8ce95"
  add_foreign_key "easy_thumbnails_thumbnail", "easy_thumbnails_source", column: "source_id", name: "source_id_refs_id_0df57a91"
  add_foreign_key "guardian_groupobjectpermission", "auth_group", column: "group_id", name: "group_id_refs_id_d890d4d6"
  add_foreign_key "guardian_groupobjectpermission", "auth_permission", column: "permission_id", name: "permission_id_refs_id_ab04ab90"
  add_foreign_key "guardian_groupobjectpermission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_ca873eba"
  add_foreign_key "guardian_userobjectpermission", "auth_permission", column: "permission_id", name: "permission_id_refs_id_720a4b21"
  add_foreign_key "guardian_userobjectpermission", "auth_user", column: "user_id", name: "user_id_refs_id_29f71157"
  add_foreign_key "guardian_userobjectpermission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_ccf6cb3f"
  add_foreign_key "social_auth_usersocialauth", "auth_user", column: "user_id", name: "user_id_refs_id_e6cbdf29"
  add_foreign_key "trucfund_backer", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_b448f8bd"
  add_foreign_key "trucfund_backer", "trucfund_project", column: "project_id", name: "project_id_refs_id_98134077"
  add_foreign_key "trucfund_backer", "trucfund_reward", column: "reward_id", name: "reward_id_refs_id_0f4b01c7"
  add_foreign_key "trucfund_bankaccount", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_7c89dc8e"
  add_foreign_key "trucfund_bankaccount", "trucfund_project", column: "project_id", name: "project_id_refs_id_a2ddbb69"
  add_foreign_key "trucfund_comment", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_6ae124a0"
  add_foreign_key "trucfund_comment", "trucfund_project", column: "project_id", name: "project_id_refs_id_c92fd0d8"
  add_foreign_key "trucfund_likedprojects", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_c8980192"
  add_foreign_key "trucfund_likedprojects", "trucfund_project", column: "project_id", name: "project_id_refs_id_90241d3e"
  add_foreign_key "trucfund_milestone", "trucfund_project", column: "project_id", name: "project_id_refs_id_43f56f4c"
  add_foreign_key "trucfund_payment", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_fa550c45"
  add_foreign_key "trucfund_payment", "trucfund_project", column: "project_id", name: "project_id_refs_id_9cdc4bed"
  add_foreign_key "trucfund_project", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_d1f23a66"
  add_foreign_key "trucfund_reward", "trucfund_project", column: "project_id", name: "project_id_refs_id_1da31497"
  add_foreign_key "trucfund_updates", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_0109a7d9"
  add_foreign_key "trucfund_updates", "trucfund_project", column: "project_id", name: "project_id_refs_id_61182ae2"
  add_foreign_key "upload_picture", "accounts_myprofile", column: "profile_id", name: "profile_id_refs_id_7b4138b2"
  add_foreign_key "upload_picture", "trucfund_project", column: "project_id", name: "project_id_refs_id_1d31e7dd"
  add_foreign_key "userena_userenasignup", "auth_user", column: "user_id", name: "user_id_refs_id_e8e75d2d"
end
