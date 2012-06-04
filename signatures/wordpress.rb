# verify that the array has been initialized
$signatures[:wordpress] ||= {}


# Because these signatures themeselves are just a subset of the PHP file-
# type don't attempt to group these by signature group. These ARE a 
# signature group.

# These are a collection of functions which may commonly be used to 
# alter posts in your Wordpress database (such as overwriting them
# with spam), or to tamper with user information.
$signatures[:wordpress][:wp_database] = [
	Signature.new({:sig => '$wpdb'}),
	Signature.new({:sig => 'query'}),
	Signature.new({:sig => 'insert'}),
	Signature.new({:sig => 'update'}),
	Signature.new({:sig => 'prepare'}),
	Signature.new({:sig => 'hide_errors'}),
]

$signatures[:wordpress][:wp_post_insertion_or_removal] = [
	Signature.new({:sig => 'wp_delete_post'}),
	Signature.new({:sig => 'wp_insert_post'}),
	Signature.new({:sig => 'wp_publish_post'}),
	Signature.new({:sig => 'wp_update_post'}),
]

$signatures[:wordpress][:wp_post_meta] = [
	Signature.new({:sig => 'add_post_meta'}),
	Signature.new({:sig => 'delete_post_meta'}),
	Signature.new({:sig => 'update_post_meta'}),
]

$signatures[:wordpress][:wp_attachments] = [
	Signature.new({:sig => 'update_attached_file'}),
	Signature.new({:sig => 'wp_insert_attachment'}),
	Signature.new({:sig => 'wp_delete_attachment'}),
	Signature.new({:sig => 'wp_generate_attachment_metadata'}),
	Signature.new({:sig => 'wp_update_attachment_metadata'}),
]

$signatures[:wordpress][:wp_categories] = [
	Signature.new({:sig => 'wp_create_category'}),
	Signature.new({:sig => 'wp_delete_category'}),
	Signature.new({:sig => 'wp_insert_category'}),
]

$signatures[:wordpress][:wp_taxonomies] = [
	Signature.new({:sig => 'register_taxonomy'}),
	Signature.new({:sig => 'register_taxonomy_for_object_type'}),
	Signature.new({:sig => 'wp_set_object_terms'}),
	Signature.new({:sig => 'wp_insert_term'}),
	Signature.new({:sig => 'wp_update_term'}),
	Signature.new({:sig => 'wp_delete_term'}),
]

$signatures[:wordpress][:wp_users] = [
	Signature.new({:sig => 'add_cap'}),
	Signature.new({:sig => 'add_role'}),
	Signature.new({:sig => 'get_super_admins'}),
	Signature.new({:sig => 'is_super_admin'}),
	Signature.new({:sig => 'remove_cap'}),
	Signature.new({:sig => 'remove_role'}),
	Signature.new({:sig => 'user_can'}),
	Signature.new({:sig => 'auth_redirect'}),
	Signature.new({:sig => 'email_exists'}),
	Signature.new({:sig => 'get_current_user_id'}),
	Signature.new({:sig => 'get_profile'}),
	Signature.new({:sig => 'get_userdata'}),
	Signature.new({:sig => 'get_userdatabylogin'}),
	Signature.new({:sig => 'get_usernumposts'}),
	Signature.new({:sig => 'get_users'}),
	Signature.new({:sig => 'get_users_of_blog'}),
	Signature.new({:sig => 'set_current_user'}),
	Signature.new({:sig => 'user_pass_ok'}),
	Signature.new({:sig => 'username_exists'}),
	Signature.new({:sig => 'validate_username'}),
	Signature.new({:sig => 'wp_get_current_user'}),
	Signature.new({:sig => 'wp_set_current_user'}),
	Signature.new({:sig => 'get_author_posts_url'}),
]

$signatures[:wordpress][:wp_user_meta] = [
	Signature.new({:sig => 'add_user_meta'}),
	Signature.new({:sig => 'delete_user_meta'}),
	Signature.new({:sig => 'update_user_meta'}),
]

$signatures[:wordpress][:wp_user_insertion_or_removal] = [
	Signature.new({:sig => 'wp_create_user'}),
	Signature.new({:sig => 'wp_delete_user'}),
	Signature.new({:sig => 'wp_insert_user'}),
	Signature.new({:sig => 'wp_update_user'}),
]

$signatures[:wordpress][:wp_comments] = [
	Signature.new({:sig => 'add_ping'}),
	Signature.new({:sig => 'add_comment_meta'}),
	Signature.new({:sig => 'delete_comment_meta'}),
	Signature.new({:sig => 'sanitize_comment_cookies'}),
	Signature.new({:sig => 'update_comment_meta'}),
	Signature.new({:sig => 'wp_allow_comment'}),
	Signature.new({:sig => 'wp_delete_comment'}),
	Signature.new({:sig => 'wp_filter_comment'}),
	Signature.new({:sig => 'wp_insert_comment'}),
	Signature.new({:sig => 'wp_new_comment'}),
	Signature.new({:sig => 'wp_set_comment_status'}),
	Signature.new({:sig => 'wp_throttle_comment_flood'}),
	Signature.new({:sig => 'wp_update_comment'}),	
]

$signatures[:wordpress][:wp_filters] = [
	Signature.new({:sig => 'add_filter'}),
	Signature.new({:sig => 'apply_filters'}),
	Signature.new({:sig => 'remove_filter'}),
	Signature.new({:sig => 'remove_all_filters'}),	
]

$signatures[:wordpress][:wp_user_login_and_logout] = [
	Signature.new({:sig => 'is_user_logged_in'}),
	Signature.new({:sig => 'wp_login_form'}),
	Signature.new({:sig => 'wp_signon'}),
	Signature.new({:sig => 'wp_logout'}),	
]

$signatures[:wordpress][:wp_actions] = [
	Signature.new({:sig => 'add_action'}),
	Signature.new({:sig => 'do_action'}),
	Signature.new({:sig => 'do_action_ref_array'}),
	Signature.new({:sig => 'remove_action'}),
	Signature.new({:sig => 'remove_all_actions'}),
]

$signatures[:wordpress][:wp_plugins] = [
	Signature.new({:sig => 'register_activation_hook'}),
	Signature.new({:sig => 'register_deactivation_hook'}),
	Signature.new({:sig => 'register_setting'}),
	Signature.new({:sig => 'unregister_setting'}),
	Signature.new({:sig => 'menu_page_url'}),
]

$signatures[:wordpress][:wp_shortcodes] = [
	Signature.new({:sig => 'add_shortcode'}),
	Signature.new({:sig => 'do_shortcode'}),
	Signature.new({:sig => 'do_shortcode_tag'}),
	Signature.new({:sig => 'remove_shortcode'}),
	Signature.new({:sig => 'remove_all_shortcodes'}),
	Signature.new({:sig => 'strip_shortcodes'}),
]

$signatures[:wordpress][:wp_theme_functions] = [
	Signature.new({:sig => 'add_custom_background'}),
	Signature.new({:sig => 'add_custom_image_header'}),
	Signature.new({:sig => 'add_theme_support'}),
	Signature.new({:sig => 'dynamic_sidebar'}),
	Signature.new({:sig => 'load_template'}),
	Signature.new({:sig => 'register_nav_menu'}),
	Signature.new({:sig => 'register_nav_menus'}),
	Signature.new({:sig => 'register_sidebar'}),
	Signature.new({:sig => 'register_sidebars'}),
	Signature.new({:sig => 'register_theme_directory'}),
	Signature.new({:sig => 'remove_theme_mod'}),
	Signature.new({:sig => 'remove_theme_mods'}),
	Signature.new({:sig => 'require_if_theme_supports'}),
	Signature.new({:sig => 'search_theme_directories'}),
	Signature.new({:sig => 'set_theme_mod'}),
	Signature.new({:sig => 'switch_theme'}),
	Signature.new({:sig => 'unregister_nav_menu'}),
	Signature.new({:sig => 'wp_nav_menu'}),
	Signature.new({:sig => 'wp_page_menu'}),
]

$signatures[:wordpress][:wp_formatting] = [
	Signature.new({:sig => 'add_magic_quotes'}),
	Signature.new({:sig => 'addslashes_gpc'}),
	Signature.new({:sig => 'antispambot'}),
	Signature.new({:sig => 'attribute_escape'}),
	Signature.new({:sig => 'backslashit'}),
	Signature.new({:sig => 'clean_pre'}),
	Signature.new({:sig => 'clean_url'}),
	Signature.new({:sig => 'convert_chars'}),
	Signature.new({:sig => 'convert_smilies'}),
	Signature.new({:sig => 'ent2ncr'}),
	Signature.new({:sig => 'esc_attr'}),
	Signature.new({:sig => 'esc_html'}),
	Signature.new({:sig => 'esc_js'}),
	Signature.new({:sig => 'esc_textarea'}),
	Signature.new({:sig => 'esc_url'}),
	Signature.new({:sig => 'force_balance_tags'}),
	Signature.new({:sig => 'funky_javascript_fix'}),
	Signature.new({:sig => 'htmlentities2'}),
	Signature.new({:sig => 'is_email'}),
	Signature.new({:sig => 'js_escape'}),
	Signature.new({:sig => 'make_clickable'}),
	Signature.new({:sig => 'popuplinks'}),
	Signature.new({:sig => 'remove_accents'}),
	Signature.new({:sig => 'sanitize_email'}),
	Signature.new({:sig => 'sanitize_file_name'}),
	Signature.new({:sig => 'sanitize_user'}),
	Signature.new({:sig => 'sanitize_title'}),
	Signature.new({:sig => 'sanitize_title_with_dashes'}),
	Signature.new({:sig => 'seems_utf8'}),
	Signature.new({:sig => 'stripslashes_deep'}),
	Signature.new({:sig => 'trailingslashit'}),
	Signature.new({:sig => 'untrailingslashit'}),
	Signature.new({:sig => 'url_shorten'}),
	Signature.new({:sig => 'utf8_uri_encode'}),
	Signature.new({:sig => 'wp_filter_kses'}),
	Signature.new({:sig => 'wp_filter_post_kses'}),
	Signature.new({:sig => 'wp_filter_nohtml_kses'}),
	Signature.new({:sig => 'wp_iso_descrambler'}),
	Signature.new({:sig => 'wp_kses'}),
	Signature.new({:sig => 'wp_kses_array_lc'}),
	Signature.new({:sig => 'wp_kses_attr'}),
	Signature.new({:sig => 'wp_kses_bad_protocol'}),
	Signature.new({:sig => 'wp_kses_bad_protocol_once'}),
	Signature.new({:sig => 'wp_kses_bad_protocol_once2'}),
	Signature.new({:sig => 'wp_kses_check_attr_val'}),
	Signature.new({:sig => 'wp_kses_decode_entities'}),
	Signature.new({:sig => 'wp_kses_hair'}),
	Signature.new({:sig => 'wp_kses_hook'}),
	Signature.new({:sig => 'wp_kses_html_error'}),
	Signature.new({:sig => 'wp_kses_js_entities'}),
	Signature.new({:sig => 'wp_kses_no_null'}),
	Signature.new({:sig => 'wp_kses_normalize_entities'}),
	Signature.new({:sig => 'wp_kses_normalize_entities2'}),
	Signature.new({:sig => 'wp_kses_split'}),
	Signature.new({:sig => 'wp_kses_split2'}),
	Signature.new({:sig => 'wp_kses_stripslashes'}),
	Signature.new({:sig => 'wp_kses_version'}),
	Signature.new({:sig => 'wp_rel_nofollow'}),
	Signature.new({:sig => 'wp_richedit_pre'}),
	Signature.new({:sig => 'wp_specialchars'}),
	Signature.new({:sig => 'wp_trim_words'}),
	Signature.new({:sig => 'zeroise'}),
]

$signatures[:wordpress][:wp_options] = [
	Signature.new({:sig => 'add_option'}),
	Signature.new({:sig => 'delete_option'}),
	Signature.new({:sig => 'update_option'}),
	Signature.new({:sig => 'update_user_option'}),
]

$signatures[:wordpress][:wp_admin_menu] = [
	Signature.new({:sig => 'add_menu_page'}),
	Signature.new({:sig => 'remove_menu_page'}),
	Signature.new({:sig => 'add_submenu_page'}),
	Signature.new({:sig => 'remove_submenu_page'}),
	Signature.new({:sig => 'add_object_page'}),
	Signature.new({:sig => 'add_utility_page'}),
]

$signatures[:wordpress][:wp_toolbar] = [
	Signature.new({:sig => 'add_node'}),
	Signature.new({:sig => 'remove_node'}),
	Signature.new({:sig => 'add_group'}),
]

$signatures[:wordpress][:wp_nonces_and_security] = [
	Signature.new({:sig => 'check_admin_referer'}),
	Signature.new({:sig => 'check_ajax_referer'}),
	Signature.new({:sig => 'wp_create_nonce'}),
	Signature.new({:sig => 'wp_explain_nonce'}),
	Signature.new({:sig => 'wp_get_original_referer'}),
	Signature.new({:sig => 'wp_get_referer'}),
	Signature.new({:sig => 'wp_nonce_ays'}),
	Signature.new({:sig => 'wp_nonce_field'}),
	Signature.new({:sig => 'wp_nonce_url'}),
	Signature.new({:sig => 'wp_original_referer_field'}),
	Signature.new({:sig => 'wp_referer_field'}),
	Signature.new({:sig => 'wp_verify_nonce'}),
]

$signatures[:wordpress][:wp_localization] = [
	Signature.new({:sig => 'esc_attr__'}),
	Signature.new({:sig => 'esc_attr_e'}),
	Signature.new({:sig => 'load_default_textdomain'}),
	Signature.new({:sig => 'load_plugin_textdomain'}),
	Signature.new({:sig => 'load_textdomain'}),
	Signature.new({:sig => 'load_theme_textdomain'}),
]

$signatures[:wordpress][:wp_cron] = [
	Signature.new({:sig => 'spawn_cron'}),
	Signature.new({:sig => 'wp_clear_scheduled_hook'}),
	Signature.new({:sig => 'wp_cron'}),
	Signature.new({:sig => 'wp_reschedule_event'}),
	Signature.new({:sig => 'wp_schedule_event'}),
	Signature.new({:sig => 'wp_schedule_single_event'}),
	Signature.new({:sig => 'wp_unschedule_event'}),
]

$signatures[:wordpress][:wp_misc] = [
	Signature.new({:sig => 'add_query_arg'}),
	Signature.new({:sig => 'admin_url'}),
	Signature.new({:sig => 'is_ssl'}),
	Signature.new({:sig => 'log_app'}),
	Signature.new({:sig => 'site_url'}),
	Signature.new({:sig => 'wp_hash'}),
	Signature.new({:sig => 'wp_mail'}),
	Signature.new({:sig => 'wp_mkdir_p'}),
	Signature.new({:sig => 'wp_new_user_notification'}),
	Signature.new({:sig => 'wp_notify_moderator'}),
	Signature.new({:sig => 'wp_notify_postauthor'}),
	Signature.new({:sig => 'wp_redirect'}),
	Signature.new({:sig => 'wp_reset_postdata'}),
	Signature.new({:sig => 'wp_reset_query'}),
	Signature.new({:sig => 'wp_remote_fopen'}),
	Signature.new({:sig => 'wp_salt'}),
	Signature.new({:sig => 'wp_set_auth_cookie'}),
	Signature.new({:sig => 'wp_upload_bits'}),
	Signature.new({:sig => 'wp_upload_dir'}),
]

$signatures[:wordpress][:wp_mu_admin] = [
	Signature.new({:sig => 'check_import_new_users'}),
	Signature.new({:sig => 'check_upload_size'}),
	Signature.new({:sig => 'choose_primary_blog'}),
	Signature.new({:sig => 'confirm_delete_users'}),
	Signature.new({:sig => 'dashboard_quota'}),
	Signature.new({:sig => 'display_space_usage'}),
	Signature.new({:sig => 'get_site_allowed_themes'}),
	Signature.new({:sig => 'get_space_allowed'}),
	Signature.new({:sig => 'get_upload_space_available'}),
	Signature.new({:sig => 'grant_super_admin'}),
	Signature.new({:sig => 'new_user_email_admin_notice'}),
	Signature.new({:sig => 'redirect_user_to_blog'}),
	Signature.new({:sig => 'revoke_super_admin'}),
	Signature.new({:sig => 'secret_salt_warning'}),
	Signature.new({:sig => 'send_confirmation_on_profile_email'}),
	Signature.new({:sig => 'show_post_thumbnail_warning'}),
	Signature.new({:sig => 'site_admin_notice'}),
	Signature.new({:sig => 'update_option_new_admin_email'}),
	Signature.new({:sig => 'update_user_status'}),
	Signature.new({:sig => 'upload_size_limit_filter'}),
	Signature.new({:sig => 'upload_space_setting'}),
	Signature.new({:sig => 'wpmu_delete_blog'}),
	Signature.new({:sig => 'wpmu_delete_user'}),
	Signature.new({:sig => 'wpmu_get_blog_allowedthemes'}),
]

$signatures[:wordpress][:wp_mu_site] = [
	Signature.new({:sig => 'add_blog_option'}),
	Signature.new({:sig => 'delete_blog_option'}),
	Signature.new({:sig => 'restore_current_blog'}),
	Signature.new({:sig => 'switch_to_blog'}),
	Signature.new({:sig => 'update_archived'}),
	Signature.new({:sig => 'update_blog_details'}),
	Signature.new({:sig => 'update_blog_option'}),
	Signature.new({:sig => 'update_blog_status'}),
	Signature.new({:sig => 'wpmu_update_blogs_date'}),
	Signature.new({:sig => 'ms_cookie_constants'}),
	Signature.new({:sig => 'ms_file_constants'}),
	Signature.new({:sig => 'ms_subdomain_constants'}),
	Signature.new({:sig => 'ms_upload_constants'}),
	Signature.new({:sig => 'add_existing_user_to_blog'}),
	Signature.new({:sig => 'add_new_user_to_blog'}),
	Signature.new({:sig => 'add_user_to_blog'}),
	Signature.new({:sig => 'create_empty_blog'}),
	Signature.new({:sig => 'filter_SSL'}),
	Signature.new({:sig => 'fix_import_form_size'}),
	Signature.new({:sig => 'fix_phpmailer_messageid'}),
	Signature.new({:sig => 'force_ssl_content'}),
	Signature.new({:sig => 'insert_blog'}),
	Signature.new({:sig => 'install_blog'}),
	Signature.new({:sig => 'install_blog_defaults'}),
	Signature.new({:sig => 'is_blog_user'}),
	Signature.new({:sig => 'is_email_address_unsafe'}),
	Signature.new({:sig => 'is_user_member_of_blog'}),
	Signature.new({:sig => 'is_user_option_local'}),
	Signature.new({:sig => 'is_user_spammy'}),
	Signature.new({:sig => 'maybe_add_existing_user_to_blog'}),
	Signature.new({:sig => 'maybe_redirect_404'}),
	Signature.new({:sig => 'newblog_notify_siteadmin'}),
	Signature.new({:sig => 'newuser_notify_siteadmin'}),
	Signature.new({:sig => 'remove_user_from_blog'}),
	Signature.new({:sig => 'signup_nonce_check'}),
	Signature.new({:sig => 'signup_nonce_fields'}),
	Signature.new({:sig => 'update_blog_public'}),
	Signature.new({:sig => 'update_posts_count'}),
	Signature.new({:sig => 'upload_is_file_too_big'}),
	Signature.new({:sig => 'upload_is_user_over_quota'}),
	Signature.new({:sig => 'users_can_register_signup_filter'}),
	Signature.new({:sig => 'welcome_user_msg_filter'}),
	Signature.new({:sig => 'wordpressmu_wp_mail_from'}),
	Signature.new({:sig => 'wpmu_activate_signup'}),
	Signature.new({:sig => 'wpmu_admin_redirect_add_updated_param'}),
	Signature.new({:sig => 'wpmu_create_blog'}),
	Signature.new({:sig => 'wpmu_create_user'}),
	Signature.new({:sig => 'wpmu_log_new_registrations'}),
	Signature.new({:sig => 'wpmu_signup_blog'}),
	Signature.new({:sig => 'wpmu_signup_blog_notification'}),
	Signature.new({:sig => 'wpmu_signup_user'}),
	Signature.new({:sig => 'wpmu_signup_user_notification'}),
	Signature.new({:sig => 'wpmu_validate_blog_signup'}),
	Signature.new({:sig => 'wpmu_validate_user_signup'}),
	Signature.new({:sig => 'wpmu_welcome_notification'}),
	Signature.new({:sig => 'wpmu_welcome_user_notification'}),
]
