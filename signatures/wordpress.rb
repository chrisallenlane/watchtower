# verify that the array has been initialized
$signatures[:wordpress] ||= {}


# Because these signatures themeselves are just a subset of the PHP file-
# type don't attempt to group these by signature group. These ARE a 
# signature group.

# These are a collection of functions which may commonly be used to 
# alter posts in your Wordpress database (such as overwriting them
# with spam), or to tamper with user information.
$signatures[:wordpress][:wp_database] = [
	Signature.new({:literal => '$wpdb'}),
	Signature.new({:literal => 'query'}),
	Signature.new({:literal => 'insert'}),
	Signature.new({:literal => 'update'}),
	Signature.new({:literal => 'prepare'}),
	Signature.new({:literal => 'hide_errors'}),
]

$signatures[:wordpress][:wp_post_insertion_or_removal] = [
	Signature.new({:literal => 'wp_delete_post'}),
	Signature.new({:literal => 'wp_insert_post'}),
	Signature.new({:literal => 'wp_publish_post'}),
	Signature.new({:literal => 'wp_update_post'}),
]

$signatures[:wordpress][:wp_post_meta] = [
	Signature.new({:literal => 'add_post_meta'}),
	Signature.new({:literal => 'delete_post_meta'}),
	Signature.new({:literal => 'update_post_meta'}),
]

$signatures[:wordpress][:wp_attachments] = [
	Signature.new({:literal => 'update_attached_file'}),
	Signature.new({:literal => 'wp_insert_attachment'}),
	Signature.new({:literal => 'wp_delete_attachment'}),
	Signature.new({:literal => 'wp_generate_attachment_metadata'}),
	Signature.new({:literal => 'wp_update_attachment_metadata'}),
]

$signatures[:wordpress][:wp_categories] = [
	Signature.new({:literal => 'wp_create_category'}),
	Signature.new({:literal => 'wp_delete_category'}),
	Signature.new({:literal => 'wp_insert_category'}),
]

$signatures[:wordpress][:wp_taxonomies] = [
	Signature.new({:literal => 'register_taxonomy'}),
	Signature.new({:literal => 'register_taxonomy_for_object_type'}),
	Signature.new({:literal => 'wp_set_object_terms'}),
	Signature.new({:literal => 'wp_insert_term'}),
	Signature.new({:literal => 'wp_update_term'}),
	Signature.new({:literal => 'wp_delete_term'}),
]

$signatures[:wordpress][:wp_users] = [
	Signature.new({:literal => 'add_cap'}),
	Signature.new({:literal => 'add_role'}),
	Signature.new({:literal => 'get_super_admins'}),
	Signature.new({:literal => 'is_super_admin'}),
	Signature.new({:literal => 'remove_cap'}),
	Signature.new({:literal => 'remove_role'}),
	Signature.new({:literal => 'user_can'}),
	Signature.new({:literal => 'auth_redirect'}),
	Signature.new({:literal => 'email_exists'}),
	Signature.new({:literal => 'get_current_user_id'}),
	Signature.new({:literal => 'get_profile'}),
	Signature.new({:literal => 'get_userdata'}),
	Signature.new({:literal => 'get_userdatabylogin'}),
	Signature.new({:literal => 'get_usernumposts'}),
	Signature.new({:literal => 'get_users'}),
	Signature.new({:literal => 'get_users_of_blog'}),
	Signature.new({:literal => 'set_current_user'}),
	Signature.new({:literal => 'user_pass_ok'}),
	Signature.new({:literal => 'username_exists'}),
	Signature.new({:literal => 'validate_username'}),
	Signature.new({:literal => 'wp_get_current_user'}),
	Signature.new({:literal => 'wp_set_current_user'}),
	Signature.new({:literal => 'get_author_posts_url'}),
]

$signatures[:wordpress][:wp_user_meta] = [
	Signature.new({:literal => 'add_user_meta'}),
	Signature.new({:literal => 'delete_user_meta'}),
	Signature.new({:literal => 'update_user_meta'}),
]

$signatures[:wordpress][:wp_user_insertion_or_removal] = [
	Signature.new({:literal => 'wp_create_user'}),
	Signature.new({:literal => 'wp_delete_user'}),
	Signature.new({:literal => 'wp_insert_user'}),
	Signature.new({:literal => 'wp_update_user'}),
]

$signatures[:wordpress][:wp_comments] = [
	Signature.new({:literal => 'add_ping'}),
	Signature.new({:literal => 'add_comment_meta'}),
	Signature.new({:literal => 'delete_comment_meta'}),
	Signature.new({:literal => 'sanitize_comment_cookies'}),
	Signature.new({:literal => 'update_comment_meta'}),
	Signature.new({:literal => 'wp_allow_comment'}),
	Signature.new({:literal => 'wp_delete_comment'}),
	Signature.new({:literal => 'wp_filter_comment'}),
	Signature.new({:literal => 'wp_insert_comment'}),
	Signature.new({:literal => 'wp_new_comment'}),
	Signature.new({:literal => 'wp_set_comment_status'}),
	Signature.new({:literal => 'wp_throttle_comment_flood'}),
	Signature.new({:literal => 'wp_update_comment'}),	
]

$signatures[:wordpress][:wp_filters] = [
	Signature.new({:literal => 'add_filter'}),
	Signature.new({:literal => 'apply_filters'}),
	Signature.new({:literal => 'remove_filter'}),
	Signature.new({:literal => 'remove_all_filters'}),	
]

$signatures[:wordpress][:wp_user_login_and_logout] = [
	Signature.new({:literal => 'is_user_logged_in'}),
	Signature.new({:literal => 'wp_login_form'}),
	Signature.new({:literal => 'wp_signon'}),
	Signature.new({:literal => 'wp_logout'}),	
]

$signatures[:wordpress][:wp_actions] = [
	Signature.new({:literal => 'add_action'}),
	Signature.new({:literal => 'do_action'}),
	Signature.new({:literal => 'do_action_ref_array'}),
	Signature.new({:literal => 'remove_action'}),
	Signature.new({:literal => 'remove_all_actions'}),
]

$signatures[:wordpress][:wp_plugins] = [
	Signature.new({:literal => 'register_activation_hook'}),
	Signature.new({:literal => 'register_deactivation_hook'}),
	Signature.new({:literal => 'register_setting'}),
	Signature.new({:literal => 'unregister_setting'}),
	Signature.new({:literal => 'menu_page_url'}),
]

$signatures[:wordpress][:wp_shortcodes] = [
	Signature.new({:literal => 'add_shortcode'}),
	Signature.new({:literal => 'do_shortcode'}),
	Signature.new({:literal => 'do_shortcode_tag'}),
	Signature.new({:literal => 'remove_shortcode'}),
	Signature.new({:literal => 'remove_all_shortcodes'}),
	Signature.new({:literal => 'strip_shortcodes'}),
]

$signatures[:wordpress][:wp_theme_functions] = [
	Signature.new({:literal => 'add_custom_background'}),
	Signature.new({:literal => 'add_custom_image_header'}),
	Signature.new({:literal => 'add_theme_support'}),
	Signature.new({:literal => 'dynamic_sidebar'}),
	Signature.new({:literal => 'load_template'}),
	Signature.new({:literal => 'register_nav_menu'}),
	Signature.new({:literal => 'register_nav_menus'}),
	Signature.new({:literal => 'register_sidebar'}),
	Signature.new({:literal => 'register_sidebars'}),
	Signature.new({:literal => 'register_theme_directory'}),
	Signature.new({:literal => 'remove_theme_mod'}),
	Signature.new({:literal => 'remove_theme_mods'}),
	Signature.new({:literal => 'require_if_theme_supports'}),
	Signature.new({:literal => 'search_theme_directories'}),
	Signature.new({:literal => 'set_theme_mod'}),
	Signature.new({:literal => 'switch_theme'}),
	Signature.new({:literal => 'unregister_nav_menu'}),
	Signature.new({:literal => 'wp_nav_menu'}),
	Signature.new({:literal => 'wp_page_menu'}),
]

$signatures[:wordpress][:wp_formatting] = [
	Signature.new({:literal => 'add_magic_quotes'}),
	Signature.new({:literal => 'addslashes_gpc'}),
	Signature.new({:literal => 'antispambot'}),
	Signature.new({:literal => 'attribute_escape'}),
	Signature.new({:literal => 'backslashit'}),
	Signature.new({:literal => 'clean_pre'}),
	Signature.new({:literal => 'clean_url'}),
	Signature.new({:literal => 'convert_chars'}),
	Signature.new({:literal => 'convert_smilies'}),
	Signature.new({:literal => 'ent2ncr'}),
	Signature.new({:literal => 'esc_attr'}),
	Signature.new({:literal => 'esc_html'}),
	Signature.new({:literal => 'esc_js'}),
	Signature.new({:literal => 'esc_textarea'}),
	Signature.new({:literal => 'esc_url'}),
	Signature.new({:literal => 'force_balance_tags'}),
	Signature.new({:literal => 'funky_javascript_fix'}),
	Signature.new({:literal => 'htmlentities2'}),
	Signature.new({:literal => 'is_email'}),
	Signature.new({:literal => 'js_escape'}),
	Signature.new({:literal => 'make_clickable'}),
	Signature.new({:literal => 'popuplinks'}),
	Signature.new({:literal => 'remove_accents'}),
	Signature.new({:literal => 'sanitize_email'}),
	Signature.new({:literal => 'sanitize_file_name'}),
	Signature.new({:literal => 'sanitize_user'}),
	Signature.new({:literal => 'sanitize_title'}),
	Signature.new({:literal => 'sanitize_title_with_dashes'}),
	Signature.new({:literal => 'seems_utf8'}),
	Signature.new({:literal => 'stripslashes_deep'}),
	Signature.new({:literal => 'trailingslashit'}),
	Signature.new({:literal => 'untrailingslashit'}),
	Signature.new({:literal => 'url_shorten'}),
	Signature.new({:literal => 'utf8_uri_encode'}),
	Signature.new({:literal => 'wp_filter_kses'}),
	Signature.new({:literal => 'wp_filter_post_kses'}),
	Signature.new({:literal => 'wp_filter_nohtml_kses'}),
	Signature.new({:literal => 'wp_iso_descrambler'}),
	Signature.new({:literal => 'wp_kses'}),
	Signature.new({:literal => 'wp_kses_array_lc'}),
	Signature.new({:literal => 'wp_kses_attr'}),
	Signature.new({:literal => 'wp_kses_bad_protocol'}),
	Signature.new({:literal => 'wp_kses_bad_protocol_once'}),
	Signature.new({:literal => 'wp_kses_bad_protocol_once2'}),
	Signature.new({:literal => 'wp_kses_check_attr_val'}),
	Signature.new({:literal => 'wp_kses_decode_entities'}),
	Signature.new({:literal => 'wp_kses_hair'}),
	Signature.new({:literal => 'wp_kses_hook'}),
	Signature.new({:literal => 'wp_kses_html_error'}),
	Signature.new({:literal => 'wp_kses_js_entities'}),
	Signature.new({:literal => 'wp_kses_no_null'}),
	Signature.new({:literal => 'wp_kses_normalize_entities'}),
	Signature.new({:literal => 'wp_kses_normalize_entities2'}),
	Signature.new({:literal => 'wp_kses_split'}),
	Signature.new({:literal => 'wp_kses_split2'}),
	Signature.new({:literal => 'wp_kses_stripslashes'}),
	Signature.new({:literal => 'wp_kses_version'}),
	Signature.new({:literal => 'wp_rel_nofollow'}),
	Signature.new({:literal => 'wp_richedit_pre'}),
	Signature.new({:literal => 'wp_specialchars'}),
	Signature.new({:literal => 'wp_trim_words'}),
	Signature.new({:literal => 'zeroise'}),
]

$signatures[:wordpress][:wp_options] = [
	Signature.new({:literal => 'add_option'}),
	Signature.new({:literal => 'delete_option'}),
	Signature.new({:literal => 'update_option'}),
	Signature.new({:literal => 'update_user_option'}),
]

$signatures[:wordpress][:wp_admin_menu] = [
	Signature.new({:literal => 'add_menu_page'}),
	Signature.new({:literal => 'remove_menu_page'}),
	Signature.new({:literal => 'add_submenu_page'}),
	Signature.new({:literal => 'remove_submenu_page'}),
	Signature.new({:literal => 'add_object_page'}),
	Signature.new({:literal => 'add_utility_page'}),
]

$signatures[:wordpress][:wp_toolbar] = [
	Signature.new({:literal => 'add_node'}),
	Signature.new({:literal => 'remove_node'}),
	Signature.new({:literal => 'add_group'}),
]

$signatures[:wordpress][:wp_nonces_and_security] = [
	Signature.new({:literal => 'check_admin_referer'}),
	Signature.new({:literal => 'check_ajax_referer'}),
	Signature.new({:literal => 'wp_create_nonce'}),
	Signature.new({:literal => 'wp_explain_nonce'}),
	Signature.new({:literal => 'wp_get_original_referer'}),
	Signature.new({:literal => 'wp_get_referer'}),
	Signature.new({:literal => 'wp_nonce_ays'}),
	Signature.new({:literal => 'wp_nonce_field'}),
	Signature.new({:literal => 'wp_nonce_url'}),
	Signature.new({:literal => 'wp_original_referer_field'}),
	Signature.new({:literal => 'wp_referer_field'}),
	Signature.new({:literal => 'wp_verify_nonce'}),
]

$signatures[:wordpress][:wp_localization] = [
	Signature.new({:literal => 'esc_attr__'}),
	Signature.new({:literal => 'esc_attr_e'}),
	Signature.new({:literal => 'load_default_textdomain'}),
	Signature.new({:literal => 'load_plugin_textdomain'}),
	Signature.new({:literal => 'load_textdomain'}),
	Signature.new({:literal => 'load_theme_textdomain'}),
]

$signatures[:wordpress][:wp_cron] = [
	Signature.new({:literal => 'spawn_cron'}),
	Signature.new({:literal => 'wp_clear_scheduled_hook'}),
	Signature.new({:literal => 'wp_cron'}),
	Signature.new({:literal => 'wp_reschedule_event'}),
	Signature.new({:literal => 'wp_schedule_event'}),
	Signature.new({:literal => 'wp_schedule_single_event'}),
	Signature.new({:literal => 'wp_unschedule_event'}),
]

$signatures[:wordpress][:wp_misc] = [
	Signature.new({:literal => 'add_query_arg'}),
	Signature.new({:literal => 'admin_url'}),
	Signature.new({:literal => 'is_ssl'}),
	Signature.new({:literal => 'log_app'}),
	Signature.new({:literal => 'site_url'}),
	Signature.new({:literal => 'wp_hash'}),
	Signature.new({:literal => 'wp_mail'}),
	Signature.new({:literal => 'wp_mkdir_p'}),
	Signature.new({:literal => 'wp_new_user_notification'}),
	Signature.new({:literal => 'wp_notify_moderator'}),
	Signature.new({:literal => 'wp_notify_postauthor'}),
	Signature.new({:literal => 'wp_redirect'}),
	Signature.new({:literal => 'wp_reset_postdata'}),
	Signature.new({:literal => 'wp_reset_query'}),
	Signature.new({:literal => 'wp_remote_fopen'}),
	Signature.new({:literal => 'wp_salt'}),
	Signature.new({:literal => 'wp_set_auth_cookie'}),
	Signature.new({:literal => 'wp_upload_bits'}),
	Signature.new({:literal => 'wp_upload_dir'}),
]

$signatures[:wordpress][:wp_mu_admin] = [
	Signature.new({:literal => 'check_import_new_users'}),
	Signature.new({:literal => 'check_upload_size'}),
	Signature.new({:literal => 'choose_primary_blog'}),
	Signature.new({:literal => 'confirm_delete_users'}),
	Signature.new({:literal => 'dashboard_quota'}),
	Signature.new({:literal => 'display_space_usage'}),
	Signature.new({:literal => 'get_site_allowed_themes'}),
	Signature.new({:literal => 'get_space_allowed'}),
	Signature.new({:literal => 'get_upload_space_available'}),
	Signature.new({:literal => 'grant_super_admin'}),
	Signature.new({:literal => 'new_user_email_admin_notice'}),
	Signature.new({:literal => 'redirect_user_to_blog'}),
	Signature.new({:literal => 'revoke_super_admin'}),
	Signature.new({:literal => 'secret_salt_warning'}),
	Signature.new({:literal => 'send_confirmation_on_profile_email'}),
	Signature.new({:literal => 'show_post_thumbnail_warning'}),
	Signature.new({:literal => 'site_admin_notice'}),
	Signature.new({:literal => 'update_option_new_admin_email'}),
	Signature.new({:literal => 'update_user_status'}),
	Signature.new({:literal => 'upload_size_limit_filter'}),
	Signature.new({:literal => 'upload_space_setting'}),
	Signature.new({:literal => 'wpmu_delete_blog'}),
	Signature.new({:literal => 'wpmu_delete_user'}),
	Signature.new({:literal => 'wpmu_get_blog_allowedthemes'}),
]

$signatures[:wordpress][:wp_mu_site] = [
	Signature.new({:literal => 'add_blog_option'}),
	Signature.new({:literal => 'delete_blog_option'}),
	Signature.new({:literal => 'restore_current_blog'}),
	Signature.new({:literal => 'switch_to_blog'}),
	Signature.new({:literal => 'update_archived'}),
	Signature.new({:literal => 'update_blog_details'}),
	Signature.new({:literal => 'update_blog_option'}),
	Signature.new({:literal => 'update_blog_status'}),
	Signature.new({:literal => 'wpmu_update_blogs_date'}),
	Signature.new({:literal => 'ms_cookie_constants'}),
	Signature.new({:literal => 'ms_file_constants'}),
	Signature.new({:literal => 'ms_subdomain_constants'}),
	Signature.new({:literal => 'ms_upload_constants'}),
	Signature.new({:literal => 'add_existing_user_to_blog'}),
	Signature.new({:literal => 'add_new_user_to_blog'}),
	Signature.new({:literal => 'add_user_to_blog'}),
	Signature.new({:literal => 'create_empty_blog'}),
	Signature.new({:literal => 'filter_SSL'}),
	Signature.new({:literal => 'fix_import_form_size'}),
	Signature.new({:literal => 'fix_phpmailer_messageid'}),
	Signature.new({:literal => 'force_ssl_content'}),
	Signature.new({:literal => 'insert_blog'}),
	Signature.new({:literal => 'install_blog'}),
	Signature.new({:literal => 'install_blog_defaults'}),
	Signature.new({:literal => 'is_blog_user'}),
	Signature.new({:literal => 'is_email_address_unsafe'}),
	Signature.new({:literal => 'is_user_member_of_blog'}),
	Signature.new({:literal => 'is_user_option_local'}),
	Signature.new({:literal => 'is_user_spammy'}),
	Signature.new({:literal => 'maybe_add_existing_user_to_blog'}),
	Signature.new({:literal => 'maybe_redirect_404'}),
	Signature.new({:literal => 'newblog_notify_siteadmin'}),
	Signature.new({:literal => 'newuser_notify_siteadmin'}),
	Signature.new({:literal => 'remove_user_from_blog'}),
	Signature.new({:literal => 'signup_nonce_check'}),
	Signature.new({:literal => 'signup_nonce_fields'}),
	Signature.new({:literal => 'update_blog_public'}),
	Signature.new({:literal => 'update_posts_count'}),
	Signature.new({:literal => 'upload_is_file_too_big'}),
	Signature.new({:literal => 'upload_is_user_over_quota'}),
	Signature.new({:literal => 'users_can_register_signup_filter'}),
	Signature.new({:literal => 'welcome_user_msg_filter'}),
	Signature.new({:literal => 'wordpressmu_wp_mail_from'}),
	Signature.new({:literal => 'wpmu_activate_signup'}),
	Signature.new({:literal => 'wpmu_admin_redirect_add_updated_param'}),
	Signature.new({:literal => 'wpmu_create_blog'}),
	Signature.new({:literal => 'wpmu_create_user'}),
	Signature.new({:literal => 'wpmu_log_new_registrations'}),
	Signature.new({:literal => 'wpmu_signup_blog'}),
	Signature.new({:literal => 'wpmu_signup_blog_notification'}),
	Signature.new({:literal => 'wpmu_signup_user'}),
	Signature.new({:literal => 'wpmu_signup_user_notification'}),
	Signature.new({:literal => 'wpmu_validate_blog_signup'}),
	Signature.new({:literal => 'wpmu_validate_user_signup'}),
	Signature.new({:literal => 'wpmu_welcome_notification'}),
	Signature.new({:literal => 'wpmu_welcome_user_notification'}),
]
