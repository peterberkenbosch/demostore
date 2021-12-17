# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_17_112861) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.string "message_checksum", null: false
    t.string "message_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", precision: 6, null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.datetime "updated_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "spree_addresses", id: :serial, force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "alternative_phone"
    t.string "city"
    t.string "company"
    t.integer "country_id"
    t.datetime "created_at", precision: 6
    t.string "firstname"
    t.string "lastname"
    t.string "name"
    t.string "phone"
    t.integer "state_id"
    t.string "state_name"
    t.datetime "updated_at", precision: 6
    t.string "zipcode"
    t.index ["country_id"], name: "index_spree_addresses_on_country_id"
    t.index ["firstname"], name: "index_addresses_on_firstname"
    t.index ["lastname"], name: "index_addresses_on_lastname"
    t.index ["name"], name: "index_spree_addresses_on_name"
    t.index ["state_id"], name: "index_spree_addresses_on_state_id"
  end

  create_table "spree_adjustment_reasons", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.string "code"
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
    t.index ["active"], name: "index_spree_adjustment_reasons_on_active"
    t.index ["code"], name: "index_spree_adjustment_reasons_on_code"
  end

  create_table "spree_adjustments", id: :serial, force: :cascade do |t|
    t.integer "adjustable_id", null: false
    t.string "adjustable_type"
    t.integer "adjustment_reason_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: 6
    t.boolean "eligible", default: true
    t.boolean "finalized", default: false, null: false
    t.boolean "included", default: false
    t.string "label"
    t.integer "order_id", null: false
    t.integer "promotion_code_id"
    t.integer "source_id"
    t.string "source_type"
    t.datetime "updated_at", precision: 6
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
    t.index ["adjustable_id"], name: "index_adjustments_on_order_id"
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible"
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id"
    t.index ["promotion_code_id"], name: "index_spree_adjustments_on_promotion_code_id"
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type"
  end

  create_table "spree_assets", id: :serial, force: :cascade do |t|
    t.text "alt"
    t.string "attachment_content_type"
    t.string "attachment_file_name"
    t.integer "attachment_file_size"
    t.integer "attachment_height"
    t.datetime "attachment_updated_at"
    t.integer "attachment_width"
    t.datetime "created_at", precision: 6
    t.integer "position"
    t.string "type", limit: 75
    t.datetime "updated_at", precision: 6
    t.integer "viewable_id"
    t.string "viewable_type"
    t.index ["viewable_id"], name: "index_assets_on_viewable_id"
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type"
  end

  create_table "spree_calculators", id: :serial, force: :cascade do |t|
    t.integer "calculable_id"
    t.string "calculable_type"
    t.datetime "created_at", precision: 6
    t.text "preferences"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type"
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type"
  end

  create_table "spree_cartons", id: :serial, force: :cascade do |t|
    t.integer "address_id"
    t.datetime "created_at", precision: 6
    t.string "external_number"
    t.integer "imported_from_shipment_id"
    t.string "number"
    t.datetime "shipped_at"
    t.integer "shipping_method_id"
    t.integer "stock_location_id"
    t.string "tracking"
    t.datetime "updated_at", precision: 6
    t.index ["external_number"], name: "index_spree_cartons_on_external_number"
    t.index ["imported_from_shipment_id"], name: "index_spree_cartons_on_imported_from_shipment_id", unique: true
    t.index ["number"], name: "index_spree_cartons_on_number", unique: true
    t.index ["stock_location_id"], name: "index_spree_cartons_on_stock_location_id"
  end

  create_table "spree_countries", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "iso"
    t.string "iso3"
    t.string "iso_name"
    t.string "name"
    t.integer "numcode"
    t.boolean "states_required", default: false
    t.datetime "updated_at", precision: 6
    t.index ["iso"], name: "index_spree_countries_on_iso"
  end

  create_table "spree_credit_cards", id: :serial, force: :cascade do |t|
    t.integer "address_id"
    t.string "cc_type"
    t.datetime "created_at", precision: 6
    t.boolean "default", default: false, null: false
    t.string "gateway_customer_profile_id"
    t.string "gateway_payment_profile_id"
    t.string "last_digits"
    t.string "month"
    t.string "name"
    t.integer "payment_method_id"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.string "year"
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id"
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id"
  end

  create_table "spree_customer_returns", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "number"
    t.integer "stock_location_id"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_inventory_units", id: :serial, force: :cascade do |t|
    t.integer "carton_id"
    t.datetime "created_at", precision: 6
    t.integer "line_item_id"
    t.boolean "pending", default: true
    t.integer "shipment_id"
    t.string "state"
    t.datetime "updated_at", precision: 6
    t.integer "variant_id"
    t.index ["carton_id"], name: "index_spree_inventory_units_on_carton_id"
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id"
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id"
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id"
  end

  create_table "spree_line_item_actions", id: :serial, force: :cascade do |t|
    t.integer "action_id", null: false
    t.datetime "created_at", precision: 6
    t.integer "line_item_id", null: false
    t.integer "quantity", default: 0
    t.datetime "updated_at", precision: 6
    t.index ["action_id"], name: "index_spree_line_item_actions_on_action_id"
    t.index ["line_item_id"], name: "index_spree_line_item_actions_on_line_item_id"
  end

  create_table "spree_line_items", id: :serial, force: :cascade do |t|
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "cost_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "order_id"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.integer "quantity", null: false
    t.integer "tax_category_id"
    t.datetime "updated_at", precision: 6
    t.integer "variant_id"
    t.index ["order_id"], name: "index_spree_line_items_on_order_id"
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id"
  end

  create_table "spree_log_entries", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.text "details"
    t.integer "source_id"
    t.string "source_type"
    t.datetime "updated_at", precision: 6
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type"
  end

  create_table "spree_option_type_prototypes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "option_type_id"
    t.integer "prototype_id"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_option_types", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name", limit: 100
    t.integer "position", default: 0, null: false
    t.string "presentation", limit: 100
    t.datetime "updated_at", precision: 6
    t.index ["position"], name: "index_spree_option_types_on_position"
  end

  create_table "spree_option_values", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.integer "option_type_id"
    t.integer "position"
    t.string "presentation"
    t.datetime "updated_at", precision: 6
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id"
    t.index ["position"], name: "index_spree_option_values_on_position"
  end

  create_table "spree_option_values_variants", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "option_value_id"
    t.datetime "updated_at", precision: 6
    t.integer "variant_id"
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id"
    t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id"
  end

  create_table "spree_order_mutexes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "order_id", null: false
    t.index ["order_id"], name: "index_spree_order_mutexes_on_order_id", unique: true
  end

  create_table "spree_orders", id: :serial, force: :cascade do |t|
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "approved_at"
    t.integer "approver_id"
    t.string "approver_name"
    t.integer "bill_address_id"
    t.datetime "canceled_at"
    t.integer "canceler_id"
    t.string "channel", default: "spree"
    t.datetime "completed_at"
    t.boolean "confirmation_delivered", default: false
    t.datetime "created_at", precision: 6
    t.integer "created_by_id"
    t.string "currency"
    t.string "email"
    t.boolean "frontend_viewable", default: true, null: false
    t.string "guest_token"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "item_count", default: 0
    t.decimal "item_total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "last_ip_address"
    t.string "number", limit: 32
    t.string "payment_state"
    t.decimal "payment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.integer "ship_address_id"
    t.string "shipment_state"
    t.decimal "shipment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.text "special_instructions"
    t.string "state"
    t.integer "store_id"
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id"
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id"
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at"
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id"
    t.index ["guest_token"], name: "index_spree_orders_on_guest_token"
    t.index ["number"], name: "index_spree_orders_on_number"
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id"
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id"
    t.index ["user_id"], name: "index_spree_orders_on_user_id"
  end

  create_table "spree_orders_promotions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "order_id"
    t.integer "promotion_code_id"
    t.integer "promotion_id"
    t.datetime "updated_at", precision: 6
    t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id"
    t.index ["promotion_code_id"], name: "index_spree_orders_promotions_on_promotion_code_id"
  end

  create_table "spree_payment_capture_events", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6
    t.integer "payment_id"
    t.datetime "updated_at", precision: 6
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id"
  end

  create_table "spree_payment_methods", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.boolean "auto_capture"
    t.boolean "available_to_admin", default: true
    t.boolean "available_to_users", default: true
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.text "description"
    t.string "name"
    t.integer "position", default: 0
    t.string "preference_source"
    t.text "preferences"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type"
  end

  create_table "spree_payments", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.string "avs_response"
    t.datetime "created_at", precision: 6
    t.string "cvv_response_code"
    t.string "cvv_response_message"
    t.string "number"
    t.integer "order_id"
    t.integer "payment_method_id"
    t.string "response_code"
    t.integer "source_id"
    t.string "source_type"
    t.string "state"
    t.datetime "updated_at", precision: 6
    t.index ["number"], name: "index_spree_payments_on_number", unique: true
    t.index ["order_id"], name: "index_spree_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id"
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type"
  end

  create_table "spree_preferences", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "key"
    t.datetime "updated_at", precision: 6
    t.text "value"
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true
  end

  create_table "spree_prices", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "country_iso", limit: 2
    t.datetime "created_at", precision: 6
    t.string "currency"
    t.datetime "deleted_at"
    t.datetime "updated_at", precision: 6
    t.integer "variant_id", null: false
    t.index ["country_iso"], name: "index_spree_prices_on_country_iso"
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency"
  end

  create_table "spree_product_option_types", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "option_type_id"
    t.integer "position"
    t.integer "product_id"
    t.datetime "updated_at", precision: 6
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id"
    t.index ["position"], name: "index_spree_product_option_types_on_position"
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id"
  end

  create_table "spree_product_promotion_rules", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "product_id"
    t.integer "promotion_rule_id"
    t.datetime "updated_at", precision: 6
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id"
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id"
  end

  create_table "spree_product_properties", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "position", default: 0
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "updated_at", precision: 6
    t.string "value"
    t.index ["position"], name: "index_spree_product_properties_on_position"
    t.index ["product_id"], name: "index_product_properties_on_product_id"
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id"
  end

  create_table "spree_products", id: :serial, force: :cascade do |t|
    t.datetime "available_on"
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.text "description"
    t.datetime "discontinue_on"
    t.text "meta_description"
    t.string "meta_keywords"
    t.string "meta_title"
    t.string "name", default: "", null: false
    t.boolean "promotionable", default: true
    t.integer "shipping_category_id"
    t.string "slug"
    t.integer "tax_category_id"
    t.datetime "updated_at", precision: 6
    t.index ["available_on"], name: "index_spree_products_on_available_on"
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at"
    t.index ["name"], name: "index_spree_products_on_name"
    t.index ["slug"], name: "index_spree_products_on_slug", unique: true
  end

  create_table "spree_products_taxons", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "position"
    t.integer "product_id"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: 6
    t.index ["position"], name: "index_spree_products_taxons_on_position"
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id"
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id"
  end

  create_table "spree_promotion_action_line_items", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "promotion_action_id"
    t.integer "quantity", default: 1
    t.datetime "updated_at", precision: 6
    t.integer "variant_id"
    t.index ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id"
    t.index ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id"
  end

  create_table "spree_promotion_actions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.integer "position"
    t.text "preferences"
    t.integer "promotion_id"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.index ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at"
    t.index ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type"
    t.index ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id"
  end

  create_table "spree_promotion_categories", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_promotion_code_batches", id: :serial, force: :cascade do |t|
    t.string "base_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.string "email"
    t.string "error"
    t.string "join_characters", default: "_", null: false
    t.integer "number_of_codes", null: false
    t.integer "promotion_id", null: false
    t.string "state", default: "pending"
    t.datetime "updated_at", precision: 6, null: false
    t.index ["promotion_id"], name: "index_spree_promotion_code_batches_on_promotion_id"
  end

  create_table "spree_promotion_codes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "promotion_code_batch_id"
    t.integer "promotion_id", null: false
    t.datetime "updated_at", precision: 6
    t.string "value", null: false
    t.index ["promotion_code_batch_id"], name: "index_spree_promotion_codes_on_promotion_code_batch_id"
    t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id"
    t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true
  end

  create_table "spree_promotion_rule_taxons", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "promotion_rule_id"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: 6
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id"
    t.index ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id"
  end

  create_table "spree_promotion_rules", id: :serial, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6
    t.text "preferences"
    t.integer "product_group_id"
    t.integer "promotion_id"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id"
    t.index ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id"
  end

  create_table "spree_promotion_rules_stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "promotion_rule_id", null: false
    t.bigint "store_id", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rules_stores_on_promotion_rule_id"
    t.index ["store_id"], name: "index_spree_promotion_rules_stores_on_store_id"
  end

  create_table "spree_promotion_rules_users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "promotion_rule_id"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id"
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id"
  end

  create_table "spree_promotions", id: :serial, force: :cascade do |t|
    t.boolean "advertise", default: false
    t.boolean "apply_automatically", default: false
    t.datetime "created_at", precision: 6
    t.string "description"
    t.datetime "expires_at"
    t.string "match_policy", default: "all"
    t.string "name"
    t.string "path"
    t.integer "per_code_usage_limit"
    t.integer "promotion_category_id"
    t.datetime "starts_at"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.integer "usage_limit"
    t.index ["advertise"], name: "index_spree_promotions_on_advertise"
    t.index ["apply_automatically"], name: "index_spree_promotions_on_apply_automatically"
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at"
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type"
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id"
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at"
  end

  create_table "spree_properties", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.string "presentation", null: false
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_property_prototypes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "property_id"
    t.integer "prototype_id"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_prototype_taxons", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "prototype_id"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: 6
    t.index ["prototype_id"], name: "index_spree_prototype_taxons_on_prototype_id"
    t.index ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id"
  end

  create_table "spree_prototypes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_refund_reasons", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.string "code"
    t.datetime "created_at", precision: 6
    t.boolean "mutable", default: true
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_refunds", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6
    t.integer "payment_id"
    t.integer "refund_reason_id"
    t.integer "reimbursement_id"
    t.string "transaction_id"
    t.datetime "updated_at", precision: 6
    t.index ["payment_id"], name: "index_spree_refunds_on_payment_id"
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id"
    t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id"
  end

  create_table "spree_reimbursement_credits", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6
    t.integer "creditable_id"
    t.string "creditable_type"
    t.integer "reimbursement_id"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_reimbursement_types", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6
    t.boolean "mutable", default: true
    t.string "name"
    t.string "type"
    t.datetime "updated_at", precision: 6
    t.index ["type"], name: "index_spree_reimbursement_types_on_type"
  end

  create_table "spree_reimbursements", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "customer_return_id"
    t.string "number"
    t.integer "order_id"
    t.string "reimbursement_status"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "updated_at", precision: 6
    t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id"
    t.index ["order_id"], name: "index_spree_reimbursements_on_order_id"
  end

  create_table "spree_return_authorizations", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.text "memo"
    t.string "number"
    t.integer "order_id"
    t.integer "return_reason_id"
    t.string "state"
    t.integer "stock_location_id"
    t.datetime "updated_at", precision: 6
    t.index ["return_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id"
  end

  create_table "spree_return_items", id: :serial, force: :cascade do |t|
    t.string "acceptance_status"
    t.text "acceptance_status_errors"
    t.decimal "additional_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "amount", precision: 12, scale: 4, default: "0.0", null: false
    t.datetime "created_at", precision: 6
    t.integer "customer_return_id"
    t.integer "exchange_inventory_unit_id"
    t.integer "exchange_variant_id"
    t.decimal "included_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.integer "inventory_unit_id"
    t.integer "override_reimbursement_type_id"
    t.integer "preferred_reimbursement_type_id"
    t.string "reception_status"
    t.integer "reimbursement_id"
    t.boolean "resellable", default: true, null: false
    t.integer "return_authorization_id"
    t.integer "return_reason_id"
    t.datetime "updated_at", precision: 6
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id"
    t.index ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id"
  end

  create_table "spree_return_reasons", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6
    t.boolean "mutable", default: true
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_roles", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
    t.index ["name"], name: "index_spree_roles_on_name", unique: true
  end

  create_table "spree_roles_users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "role_id"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["role_id"], name: "index_spree_roles_users_on_role_id"
    t.index ["user_id", "role_id"], name: "index_spree_roles_users_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_spree_roles_users_on_user_id"
  end

  create_table "spree_shipments", id: :serial, force: :cascade do |t|
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "cost", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6
    t.integer "deprecated_address_id"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "number"
    t.integer "order_id"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.datetime "shipped_at"
    t.string "state"
    t.integer "stock_location_id"
    t.string "tracking"
    t.datetime "updated_at", precision: 6
    t.index ["deprecated_address_id"], name: "index_spree_shipments_on_deprecated_address_id"
    t.index ["number"], name: "index_shipments_on_number"
    t.index ["order_id"], name: "index_spree_shipments_on_order_id"
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id"
  end

  create_table "spree_shipping_categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_shipping_method_categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "shipping_category_id", null: false
    t.integer "shipping_method_id", null: false
    t.datetime "updated_at", precision: 6
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id"
  end

  create_table "spree_shipping_method_stock_locations", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "shipping_method_id"
    t.integer "stock_location_id"
    t.datetime "updated_at", precision: 6
    t.index ["shipping_method_id"], name: "shipping_method_id_spree_sm_sl"
    t.index ["stock_location_id"], name: "sstock_location_id_spree_sm_sl"
  end

  create_table "spree_shipping_method_zones", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "shipping_method_id"
    t.datetime "updated_at", precision: 6
    t.integer "zone_id"
  end

  create_table "spree_shipping_methods", id: :serial, force: :cascade do |t|
    t.string "admin_name"
    t.boolean "available_to_all", default: true
    t.boolean "available_to_users", default: true
    t.string "carrier"
    t.string "code"
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.string "name"
    t.string "service_level"
    t.integer "tax_category_id"
    t.string "tracking_url"
    t.datetime "updated_at", precision: 6
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id"
  end

  create_table "spree_shipping_rate_taxes", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.integer "shipping_rate_id"
    t.integer "tax_rate_id"
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_rate_id"], name: "index_spree_shipping_rate_taxes_on_shipping_rate_id"
    t.index ["tax_rate_id"], name: "index_spree_shipping_rate_taxes_on_tax_rate_id"
  end

  create_table "spree_shipping_rates", id: :serial, force: :cascade do |t|
    t.decimal "cost", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6
    t.boolean "selected", default: false
    t.integer "shipment_id"
    t.integer "shipping_method_id"
    t.integer "tax_rate_id"
    t.datetime "updated_at", precision: 6
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true
  end

  create_table "spree_state_changes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.string "next_state"
    t.string "previous_state"
    t.integer "stateful_id"
    t.string "stateful_type"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type"
    t.index ["user_id"], name: "index_spree_state_changes_on_user_id"
  end

  create_table "spree_states", id: :serial, force: :cascade do |t|
    t.string "abbr"
    t.integer "country_id"
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
    t.index ["country_id"], name: "index_spree_states_on_country_id"
  end

  create_table "spree_stock_items", id: :serial, force: :cascade do |t|
    t.boolean "backorderable", default: false
    t.integer "count_on_hand", default: 0, null: false
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.integer "stock_location_id"
    t.datetime "updated_at", precision: 6
    t.integer "variant_id"
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at"
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id"
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id"
    t.index ["variant_id", "stock_location_id"], name: "index_spree_stock_items_on_variant_id_and_stock_location_id", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "spree_stock_locations", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true
    t.string "address1"
    t.string "address2"
    t.string "admin_name"
    t.boolean "backorderable_default", default: false
    t.boolean "check_stock_on_transfer", default: true
    t.string "city"
    t.string "code"
    t.integer "country_id"
    t.datetime "created_at", precision: 6
    t.boolean "default", default: false, null: false
    t.boolean "fulfillable", default: true, null: false
    t.string "name"
    t.string "phone"
    t.integer "position", default: 0
    t.boolean "propagate_all_variants", default: true
    t.boolean "restock_inventory", default: true, null: false
    t.integer "state_id"
    t.string "state_name"
    t.datetime "updated_at", precision: 6
    t.string "zipcode"
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id"
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id"
  end

  create_table "spree_stock_movements", id: :serial, force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.integer "originator_id"
    t.string "originator_type"
    t.integer "quantity", default: 0
    t.integer "stock_item_id"
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id"
  end

  create_table "spree_store_credit_categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_store_credit_events", id: :serial, force: :cascade do |t|
    t.string "action", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "amount_remaining", precision: 8, scale: 2
    t.string "authorization_code", null: false
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.integer "originator_id"
    t.string "originator_type"
    t.integer "store_credit_id", null: false
    t.integer "store_credit_reason_id"
    t.datetime "updated_at", precision: 6
    t.decimal "user_total_amount", precision: 8, scale: 2, default: "0.0", null: false
    t.index ["deleted_at"], name: "index_spree_store_credit_events_on_deleted_at"
    t.index ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id"
  end

  create_table "spree_store_credit_reasons", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "spree_store_credit_types", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name"
    t.integer "priority"
    t.datetime "updated_at", precision: 6
    t.index ["priority"], name: "index_spree_store_credit_types_on_priority"
  end

  create_table "spree_store_credits", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "amount_used", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "category_id"
    t.datetime "created_at", precision: 6
    t.integer "created_by_id"
    t.string "currency"
    t.datetime "deleted_at"
    t.datetime "invalidated_at"
    t.text "memo"
    t.integer "type_id"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at"
    t.index ["type_id"], name: "index_spree_store_credits_on_type_id"
    t.index ["user_id"], name: "index_spree_store_credits_on_user_id"
  end

  create_table "spree_store_payment_methods", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.integer "payment_method_id", null: false
    t.integer "store_id", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_method_id"], name: "index_spree_store_payment_methods_on_payment_method_id"
    t.index ["store_id"], name: "index_spree_store_payment_methods_on_store_id"
  end

  create_table "spree_store_shipping_methods", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.bigint "shipping_method_id", null: false
    t.bigint "store_id", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_method_id"], name: "index_spree_store_shipping_methods_on_shipping_method_id"
    t.index ["store_id"], name: "index_spree_store_shipping_methods_on_store_id"
  end

  create_table "spree_stores", id: :serial, force: :cascade do |t|
    t.string "available_locales"
    t.string "bcc_email"
    t.string "cart_tax_country_iso"
    t.string "code"
    t.datetime "created_at", precision: 6
    t.boolean "default", default: false, null: false
    t.string "default_currency"
    t.string "mail_from_address"
    t.text "meta_description"
    t.text "meta_keywords"
    t.string "name"
    t.string "seo_title"
    t.datetime "updated_at", precision: 6
    t.string "url"
    t.index ["code"], name: "index_spree_stores_on_code"
    t.index ["default"], name: "index_spree_stores_on_default"
  end

  create_table "spree_tax_categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.string "description"
    t.boolean "is_default", default: false
    t.string "name"
    t.string "tax_code"
    t.datetime "updated_at", precision: 6
  end

  create_table "spree_tax_rate_tax_categories", id: :serial, force: :cascade do |t|
    t.integer "tax_category_id", null: false
    t.integer "tax_rate_id", null: false
    t.index ["tax_category_id"], name: "index_spree_tax_rate_tax_categories_on_tax_category_id"
    t.index ["tax_rate_id"], name: "index_spree_tax_rate_tax_categories_on_tax_rate_id"
  end

  create_table "spree_tax_rates", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 5
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.datetime "expires_at"
    t.boolean "included_in_price", default: false
    t.string "name"
    t.boolean "show_rate_in_label", default: true
    t.datetime "starts_at"
    t.datetime "updated_at", precision: 6
    t.integer "zone_id"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at"
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id"
  end

  create_table "spree_taxonomies", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "name", null: false
    t.integer "position", default: 0
    t.datetime "updated_at", precision: 6
    t.index ["position"], name: "index_spree_taxonomies_on_position"
  end

  create_table "spree_taxons", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "depth"
    t.text "description"
    t.string "icon_content_type"
    t.string "icon_file_name"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer "lft"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_title"
    t.string "name", null: false
    t.integer "parent_id"
    t.string "permalink"
    t.integer "position", default: 0
    t.integer "rgt"
    t.integer "taxonomy_id"
    t.datetime "updated_at", precision: 6
    t.index ["lft"], name: "index_spree_taxons_on_lft"
    t.index ["parent_id"], name: "index_taxons_on_parent_id"
    t.index ["permalink"], name: "index_taxons_on_permalink"
    t.index ["position"], name: "index_spree_taxons_on_position"
    t.index ["rgt"], name: "index_spree_taxons_on_rgt"
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"
  end

  create_table "spree_unit_cancels", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "created_by"
    t.integer "inventory_unit_id", null: false
    t.string "reason"
    t.datetime "updated_at", precision: 6
    t.index ["inventory_unit_id"], name: "index_spree_unit_cancels_on_inventory_unit_id"
  end

  create_table "spree_user_addresses", id: :serial, force: :cascade do |t|
    t.integer "address_id", null: false
    t.boolean "archived", default: false
    t.datetime "created_at", precision: 6, null: false
    t.boolean "default", default: false
    t.boolean "default_billing", default: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["address_id"], name: "index_spree_user_addresses_on_address_id"
    t.index ["user_id", "address_id"], name: "index_spree_user_addresses_on_user_id_and_address_id", unique: true
    t.index ["user_id"], name: "index_spree_user_addresses_on_user_id"
  end

  create_table "spree_user_stock_locations", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "stock_location_id"
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.index ["user_id"], name: "index_spree_user_stock_locations_on_user_id"
  end

  create_table "spree_users", id: :serial, force: :cascade do |t|
    t.string "authentication_token"
    t.integer "bill_address_id"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.datetime "deleted_at"
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "locked_at"
    t.string "login"
    t.string "password_salt", limit: 128
    t.string "perishable_token"
    t.string "persistence_token"
    t.datetime "remember_created_at"
    t.string "remember_token"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "ship_address_id"
    t.integer "sign_in_count", default: 0, null: false
    t.string "spree_api_key", limit: 48
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at"
    t.index ["email"], name: "email_idx_unique", unique: true
    t.index ["reset_password_token"], name: "index_spree_users_on_reset_password_token_solidus_auth_devise", unique: true
    t.index ["spree_api_key"], name: "index_spree_users_on_spree_api_key"
  end

  create_table "spree_variant_property_rule_conditions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.integer "option_value_id"
    t.datetime "updated_at", precision: 6, null: false
    t.integer "variant_property_rule_id"
    t.index ["variant_property_rule_id", "option_value_id"], name: "index_spree_variant_prop_rule_conditions_on_rule_and_optval"
  end

  create_table "spree_variant_property_rule_values", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.integer "position", default: 0
    t.integer "property_id"
    t.datetime "updated_at", precision: 6
    t.text "value"
    t.integer "variant_property_rule_id"
    t.index ["property_id"], name: "index_spree_variant_property_rule_values_on_property_id"
    t.index ["variant_property_rule_id"], name: "index_spree_variant_property_rule_values_on_rule"
  end

  create_table "spree_variant_property_rules", id: :serial, force: :cascade do |t|
    t.boolean "apply_to_all", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_spree_variant_property_rules_on_product_id"
  end

  create_table "spree_variants", id: :serial, force: :cascade do |t|
    t.string "cost_currency"
    t.decimal "cost_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6
    t.datetime "deleted_at"
    t.decimal "depth", precision: 8, scale: 2
    t.decimal "height", precision: 8, scale: 2
    t.boolean "is_master", default: false
    t.integer "position"
    t.integer "product_id"
    t.string "sku", default: "", null: false
    t.integer "tax_category_id"
    t.boolean "track_inventory", default: true
    t.datetime "updated_at", precision: 6
    t.decimal "weight", precision: 8, scale: 2, default: "0.0"
    t.decimal "width", precision: 8, scale: 2
    t.index ["position"], name: "index_spree_variants_on_position"
    t.index ["product_id"], name: "index_spree_variants_on_product_id"
    t.index ["sku"], name: "index_spree_variants_on_sku"
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id"
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory"
  end

  create_table "spree_wallet_payment_sources", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.boolean "default", default: false, null: false
    t.integer "payment_source_id", null: false
    t.string "payment_source_type", null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id", "payment_source_id", "payment_source_type"], name: "index_spree_wallet_payment_sources_on_source_and_user", unique: true
    t.index ["user_id"], name: "index_spree_wallet_payment_sources_on_user_id"
  end

  create_table "spree_zone_members", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "zone_id"
    t.integer "zoneable_id"
    t.string "zoneable_type"
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id"
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type"
  end

  create_table "spree_zones", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: 6
    t.string "description"
    t.string "name"
    t.datetime "updated_at", precision: 6
    t.integer "zone_members_count", default: 0
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "spree_promotion_code_batches", "spree_promotions", column: "promotion_id"
  add_foreign_key "spree_promotion_codes", "spree_promotion_code_batches", column: "promotion_code_batch_id"
  add_foreign_key "spree_tax_rate_tax_categories", "spree_tax_categories", column: "tax_category_id"
  add_foreign_key "spree_tax_rate_tax_categories", "spree_tax_rates", column: "tax_rate_id"
  add_foreign_key "spree_wallet_payment_sources", "spree_users", column: "user_id"
end
