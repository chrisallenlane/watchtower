# Because these signatures themeselves are just a subset of the PHP file-
# type don't attempt to group these by signature group. These ARE a 
# signature group.

# These are a collection of functions which may commonly be used to 
# alter posts in your Wordpress database (such as overwriting them
# with spam), or to tamper with user information.
wp_database = %w[
	$wpdb
	query
	insert
	update
	prepare
	hide_errors
]

wp_post_insertion_or_removal = %w[
	wp_delete_post
	wp_insert_post
	wp_publish_post
	wp_update_post
]

wp_post_meta = %w[
	add_post_meta
	delete_post_meta
	update_post_meta
]

wp_attachments = %w[
	update_attached_file
	wp_insert_attachment
	wp_delete_attachment
	wp_generate_attachment_metadata
	wp_update_attachment_metadata
]

wp_categories = %w[
	wp_create_category
	wp_delete_category
	wp_insert_category
]

wp_taxonomies = %w[
	register_taxonomy
	register_taxonomy_for_object_type
	wp_set_object_terms
	wp_insert_term
	wp_update_term
	wp_delete_term
]

wp_users = %w[
	add_cap
	add_role
	get_super_admins
	is_super_admin
	remove_cap
	remove_role
	user_can
	auth_redirect
	email_exists
	get_current_user_id
	get_profile
	get_userdata
	get_userdatabylogin
	get_usernumposts
	get_users
	get_users_of_blog
	set_current_user
	user_pass_ok
	username_exists
	validate_username
	wp_get_current_user
	wp_set_current_user
	get_author_posts_url
]

wp_user_meta = %w[
	add_user_meta
	delete_user_meta
	update_user_meta
]

wp_user_insertion_or_removal = %w[
	wp_create_user
	wp_delete_user
	wp_insert_user
	wp_update_user
]

wp_comments = %w[
	add_ping
	add_comment_meta
	delete_comment_meta
	sanitize_comment_cookies
	update_comment_meta
	wp_allow_comment
	wp_delete_comment
	wp_filter_comment
	wp_insert_comment
	wp_new_comment
	wp_set_comment_status
	wp_throttle_comment_flood
	wp_update_comment
]

wp_filters = %w[
	add_filter
	apply_filters
	remove_filter
	remove_all_filters
]

wp_user_login_and_logout = %w[
	is_user_logged_in
	wp_login_form
	wp_signon
	wp_logout
]

wp_actions = %w[
	add_action
	do_action
	do_action_ref_array
	remove_action
	remove_all_actions
]

wp_plugins = %w[
	register_activation_hook
	register_deactivation_hook
	register_setting
	unregister_setting
	menu_page_url
]

wp_shortcodes = %w[
	add_shortcode
	do_shortcode
	do_shortcode_tag
	remove_shortcode
	remove_all_shortcodes
	strip_shortcodes
]

wp_theme_functions = %w[
	add_custom_background
	add_custom_image_header
	add_theme_support
	dynamic_sidebar
	load_template
	register_nav_menu
	register_nav_menus
	register_sidebar
	register_sidebars
	register_theme_directory
	remove_theme_mod
	remove_theme_mods
	require_if_theme_supports
	search_theme_directories
	set_theme_mod
	switch_theme
	unregister_nav_menu
	wp_nav_menu
	wp_page_menu
]

wp_formatting = %w[
	add_magic_quotes
	addslashes_gpc
	antispambot
	attribute_escape
	backslashit
	clean_pre
	clean_url
	convert_chars
	convert_smilies
	ent2ncr
	esc_attr
	esc_html
	esc_js
	esc_textarea
	esc_url
	force_balance_tags
	funky_javascript_fix
	htmlentities2
	is_email
	js_escape
	make_clickable
	popuplinks
	remove_accents
	sanitize_email
	sanitize_file_name
	sanitize_user
	sanitize_title
	sanitize_title_with_dashes
	seems_utf8
	stripslashes_deep
	trailingslashit
	untrailingslashit
	url_shorten
	utf8_uri_encode
	wp_filter_kses
	wp_filter_post_kses
	wp_filter_nohtml_kses
	wp_iso_descrambler
	wp_kses
	wp_kses_array_lc
	wp_kses_attr
	wp_kses_bad_protocol
	wp_kses_bad_protocol_once
	wp_kses_bad_protocol_once2
	wp_kses_check_attr_val
	wp_kses_decode_entities
	wp_kses_hair
	wp_kses_hook
	wp_kses_html_error
	wp_kses_js_entities
	wp_kses_no_null
	wp_kses_normalize_entities
	wp_kses_normalize_entities2
	wp_kses_split
	wp_kses_split2
	wp_kses_stripslashes
	wp_kses_version
	wp_rel_nofollow
	wp_richedit_pre
	wp_specialchars
	wp_trim_words
	zeroise
]

wp_options = %w[
	add_option
	delete_option
	update_option
	update_user_option
]

wp_admin_menu = %w[
	add_menu_page
	remove_menu_page
	add_submenu_page
	remove_submenu_page
	add_object_page
	add_utility_page
]

wp_toolbar = %w[
	add_node
	remove_node
	add_group
]

wp_nonces_and_security = %w[
	check_admin_referer
	check_ajax_referer
	wp_create_nonce
	wp_explain_nonce
	wp_get_original_referer
	wp_get_referer
	wp_nonce_ays
	wp_nonce_field
	wp_nonce_url
	wp_original_referer_field
	wp_referer_field
	wp_verify_nonce
]

wp_localization = %w[
	esc_attr__
	esc_attr_e
	load_default_textdomain
	load_plugin_textdomain
	load_textdomain
	load_theme_textdomain
]

wp_cron = %w[
	spawn_cron
	wp_clear_scheduled_hook
	wp_cron
	wp_reschedule_event
	wp_schedule_event
	wp_schedule_single_event
	wp_unschedule_event
]

wp_misc = %w[
	add_query_arg
	admin_url
	is_ssl
	log_app
	site_url
	wp_hash
	wp_mail
	wp_mkdir_p
	wp_new_user_notification
	wp_notify_moderator
	wp_notify_postauthor
	wp_redirect
	wp_reset_postdata
	wp_reset_query
	wp_remote_fopen
	wp_salt
	wp_set_auth_cookie
	wp_upload_bits
	wp_upload_dir
]

wp_mu_admin = %w[
	check_import_new_users
	check_upload_size
	choose_primary_blog
	confirm_delete_users
	dashboard_quota
	display_space_usage
	get_site_allowed_themes
	get_space_allowed
	get_upload_space_available
	grant_super_admin
	new_user_email_admin_notice
	redirect_user_to_blog
	revoke_super_admin
	secret_salt_warning
	send_confirmation_on_profile_email
	show_post_thumbnail_warning
	site_admin_notice
	update_option_new_admin_email
	update_user_status
	upload_size_limit_filter
	upload_space_setting
	wpmu_delete_blog
	wpmu_delete_user
	wpmu_get_blog_allowedthemes
]

wp_mu_site = %w[
	add_blog_option
	delete_blog_option
	restore_current_blog
	switch_to_blog
	update_archived
	update_blog_details
	update_blog_option
	update_blog_status
	wpmu_update_blogs_date
	ms_cookie_constants
	ms_file_constants
	ms_subdomain_constants
	ms_upload_constants
	add_existing_user_to_blog
	add_new_user_to_blog
	add_user_to_blog
	create_empty_blog
	filter_SSL
	fix_import_form_size
	fix_phpmailer_messageid
	force_ssl_content
	insert_blog
	install_blog
	install_blog_defaults
	is_blog_user
	is_email_address_unsafe
	is_user_member_of_blog
	is_user_option_local
	is_user_spammy
	maybe_add_existing_user_to_blog
	maybe_redirect_404
	newblog_notify_siteadmin
	newuser_notify_siteadmin
	remove_user_from_blog
	signup_nonce_check
	signup_nonce_fields
	update_blog_public
	update_posts_count
	upload_is_file_too_big
	upload_is_user_over_quota
	users_can_register_signup_filter
	welcome_user_msg_filter
	wordpressmu_wp_mail_from
	wpmu_activate_signup
	wpmu_admin_redirect_add_updated_param
	wpmu_create_blog
	wpmu_create_user
	wpmu_log_new_registrations
	wpmu_signup_blog
	wpmu_signup_blog_notification
	wpmu_signup_user
	wpmu_signup_user_notification
	wpmu_validate_blog_signup
	wpmu_validate_user_signup
	wpmu_welcome_notification
	wpmu_welcome_user_notification
]

# verify that the array has been initialized
$signatures[:php] ||= {}
$signatures[:php][:wordpress] ||= []

# comment out what you don't want loaded here
$signatures[:php][:wordpress] << wp_database.literal
$signatures[:php][:wordpress] << wp_post_insertion_or_removal.literal
$signatures[:php][:wordpress] << wp_post_meta.literal
$signatures[:php][:wordpress] << wp_attachments.literal
$signatures[:php][:wordpress] << wp_categories.literal
$signatures[:php][:wordpress] << wp_taxonomies.literal
$signatures[:php][:wordpress] << wp_users.literal
$signatures[:php][:wordpress] << wp_user_meta.literal
$signatures[:php][:wordpress] << wp_user_insertion_or_removal.literal
$signatures[:php][:wordpress] << wp_comments.literal
$signatures[:php][:wordpress] << wp_filters.literal
$signatures[:php][:wordpress] << wp_user_login_and_logout.literal
$signatures[:php][:wordpress] << wp_actions.literal
$signatures[:php][:wordpress] << wp_plugins.literal
$signatures[:php][:wordpress] << wp_shortcodes.literal
$signatures[:php][:wordpress] << wp_theme_functions.literal
$signatures[:php][:wordpress] << wp_formatting.literal
$signatures[:php][:wordpress] << wp_options.literal
$signatures[:php][:wordpress] << wp_admin_menu.literal
$signatures[:php][:wordpress] << wp_toolbar.literal
$signatures[:php][:wordpress] << wp_nonces_and_security.literal
$signatures[:php][:wordpress] << wp_localization.literal
$signatures[:php][:wordpress] << wp_cron.literal
$signatures[:php][:wordpress] << wp_misc.literal
$signatures[:php][:wordpress] << wp_mu_admin.literal
$signatures[:php][:wordpress] << wp_mu_site.literal

# I only want a single-level array at this depth
$signatures[:php][:wordpress].flatten!

