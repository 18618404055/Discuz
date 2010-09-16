<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: lang_admincp_msg.php 16600 2010-09-10 03:44:46Z monkey $
 */

$lang = array
(
	'undefined_action' => ' 未定義操作。',
	'noaccess' => '你沒有權限訪問管理中心。',
	'noaccess_isfounder' => '你沒有權限訪問該設置，出於安全考慮此設置只有站點創始人可以使用，請檢查 config/config_global.php 文件內創始人的設置。',
	'noaccess_ip' => '對不起，站長設定了只有特定 IP 地址範圍才能訪問管理中心，你的地址不在被允許的範圍內。',
	'action_noaccess' => '對不起，站長限制你無權使用本功能。',
	'action_noaccess_config' => '對不起，出於系統安全考慮，站長關閉了該功能，如需要打開請自行修改 config/config_global.php 文件內對應的相關安全配置信息。',
	'action_access_noexists' => '站點缺少安全設置，請對照標準程序的 config/config_global.php 仔細修改你的配置文件。否則無法使用本功能。',
	'import_data_invalid' => '數據無法識別，請返回。',
	'import_data_typeinvalid' => '數據類型錯誤，請返回。',

	'setting_gzip_invalid' => '當前 PHP 版本不支持 Gzip 壓縮，請返回修改。',
	'setting_maxonlines_invalid' => '指定的最大在線人數必須填寫且不得超過 65535，請返回修改。',
	'setting_creditsformula_invalid' => '積分公式包含無效變量或運算符，請返回修改。',
	'setting_ipaccess_invalid' => '操作錯誤！你必須將自己的 IP 加入到允許訪問站點的 IP 列表中，請返回修改。',
	'setting_adminipaccess_invalid' => '操作錯誤！你必須將自己的 IP 加入到允許訪問後台的 IP 列表中，請返回修改。',
	'setting_credits_title_invalid' => '你沒有為全部被啟用的積分設置積分名稱，請返回修改。',
	'setting_creditstrans_invalid' => '交易積分必須是已經被啟用的積分類型，請返回修改。',
	'setting_update_succeed' => '當前設置成功更新。',
	'setting_seccodewidthheight_invalid' => '驗證碼圖片寬度或者高度超出限定的範圍，請返回修改。',
	'setting_extcredits_must_available' => '你需要至少開啟一種擴展積分，請返回修改。',
	'setting_district_edit_success' => '修改地區數據成功。',
	'setting_domain_http_error' => '填寫的域名不要以「http://」、「.」開頭或者以「/」、「.」結尾，請返回修改。',
	'setting_domain_allowspacedomain_error' => '開啟個人空間二級域名失敗，請先設置二級域名的根域名',
	'setting_domain_repeat_error' => '配置中存在重複的域名，請返回修改。',
	'setting_seccode_ttf_lost' => '驗證碼缺少顯示所需的字庫文件，請上傳字庫文件至 {path} 目錄。',

	'uc_database_connect_error' => '連接用戶中心數據庫服務器失敗，請返回檢查設置。',
	'uc_database_select_db_error' => '選擇用戶中心數據庫失敗，可能不存在該數據庫，請返回檢查設置。',
	'uc_config_write_error' => '配置文件寫入失敗，請返回檢查設置。',

	'forums_add_category_succeed' => '添加新分類 <b>$newcat</b> 成功。',
	'forums_add_forum_succeed' => '添加新版塊 <b>$newforum</b> 成功。',
	'forums_update_succeed' => '版塊設置成功更新。',
	'forums_copy_source_invalid' => '你沒有選擇要複製的源版塊，請返回修改。',
	'forums_copy_target_invalid' => '你沒有選擇要複製的目標版塊，請返回修改。',
	'forums_copy_options_invalid' => '你沒有選擇要複製的項目，請返回修改。',
	'forums_copy_succeed' => '版塊設置成功複製。',
	'forums_moderators_update_succeed' => '版主設置成功更新。',
	'forums_merge_source_sub_notnull' => '源版塊下級版塊不為空，請先返回修改相關下級版塊的上級設置。',
	'forums_merge_succeed' => '版塊合併成功。',
	'forums_edit_name_invalid' => '你沒有輸入分類名稱，請返回修改。',
	'forums_edit_sub_notnull' => '下級版塊不為空，不能修改本版塊的上級版塊歸屬，請返回。',
	'forums_edit_succeed' => '版塊設置成功更新。',
	'forums_delete_sub_notnull' => '下級版塊不為空，請先返回刪除本分類或版塊的下級論壇。',
	'forums_delete_confirm' => '本操作不可恢復，你確定要刪除該版塊，清除其中帖子和附件嗎？<br />注意: 刪除論壇並不會更新用戶發帖數和積分',
	'forums_delete_succeed' => '版塊成功刪除。',
	'forums_nonexistence' => '指定的版塊不存在，請返回修改',
	'forums_threadtypes_duplicate' => '新增主題分類與現有重複，請返回修改。',
	'forums_threadtypes_succeed' => '主題分類成功更新。',
	'forums_threadsorts_duplicate' => '不允許發表多種分類信息，請返回修改。',
	'forums_rules_nopermission' => '對不起，管理員設置了版主無法編輯版塊規則。',
	'forums_rules_succeed' => '版塊規則成功編輯。',
	'forums_noparent' => '對不起，你沒有選擇該版塊的分類或者上級版塊，請返回修改。',
	'forums_name_toolong' => '輸入版塊名稱超過50個字符，請返回修改。',
	'forums_formulaperm_error' => '權限表達式無效，請返回修改。',
	'forums_delete_alarm' => '本操作不可恢復，正在刪除版塊數據... ...',
	'forums_edit_nonexistence' => '請先選擇你要進行操作的版塊：',
	'forums_edit_threadsort_nonexistence' => '沒有選擇默認的分類信息，請返回修改。',


	'announce_nonexistence' => '指定的公告不存在或無權編輯，請返回。',
	'announce_time_invalid' => '對不起，你沒有輸入起始時間或你輸入的終止時間不正確，請返回修改。',
	'announce_invalid' => '你必須輸入公告標題和內容，請返回修改。',
	'announce_succeed' => '站點公告成功編輯。',
	'announce_update_succeed' => '站點公告成功更新。',

	'modcp_ann_empty' => '你必須輸入公告標題和內容，請返回修改。',
	'modcp_ann_urlerror' => '網址鏈接無效，請返回修改。',

	'admingroups_edit_succeed' => '管理組權限設置成功更新。',
	'admingroups_edit_nonexistence' => '請先選擇你要進行操作的管理組：',

	'usergroups_update_credits_invalid' => '缺少積分下限為負數或 0 的會員用戶組，請返回修改。',
	'usergroups_update_credits_duplicate' => '會員用戶組積分下限設置重複，請返回修改。',
	'usergroups_update_succeed' => '用戶組成功更新。如你添加了新的用戶組，<br />請不要忘記修改其相應的權限設置。',
	'usergroups_edit_public_invalid' => '公眾用戶組不能關聯管理組，否則將產生安全隱患，請返回修改。',
	'usergroups_edit_creditstrans_disabled' => '你需要先在 全局設置中啟用交易積分才能設置收費公眾用戶組的相關功能，請返回修改。',
	'usergroups_edit_rate_invalid' => '用戶組評分上下限或 24 小時最大評分數設置有誤，請返回修改。',
	'usergroups_edit_succeed' => '用戶組權限設置成功更新。',
	'usergroups_type_nonexistence' => '用戶組類型錯誤，請返回',
	'usergroups_edit_nonexistence' => '請先選擇你要進行操作的用戶組：',
	'usergroups_nonexistence' => '指定的用戶組不存在，請返回修改',
	'usergroups_edit_fail' => '你沒有權限編輯擁有管理權限的用戶組，請返回',
	'usergroups_copy_source_invalid' => '你沒有選擇要複製的源用戶組，請返回修改。',
	'usergroups_copy_target_invalid' => '你沒有選擇要複製的目標用戶組，請返回修改。',
	'usergroups_copy_options_invalid' => '你沒有選擇要複製的項目，請返回修改。',
	'usergroups_copy_succeed' => '用戶組設置成功複製。',

	'members_add_toolong' => '對不起，你的用戶名超過 15 個字符，請返回輸入一個較短的用戶名。',
	'members_add_tooshort' => '對不起，你輸入的用戶名小於3個字符, 請返回輸入一個較長的用戶名。',
	'members_add_illegal' => '用戶名包含敏感字符或被系統屏蔽，請返回重新填寫。',
	'members_username_protect' => '用戶名包含被系統屏蔽的字符，請返回重新填寫。',
	'members_add_invalid' => '你沒有填寫完整用戶資料，請返回修改。',
	'members_add_username_duplicate' => '用戶名已經存在，請返回修改。',
	'members_add_username_activation' => '用戶名已經存在，但尚未激活，是否需要激活？<br />激活的用戶可用以前的用戶密碼登錄',
	'members_email_duplicate' => '該 Email 地址已經被註冊，請返回重新填寫。',
	'members_email_illegal' => 'Email 地址無效，請返回重新填寫。',
	'members_email_domain_illegal' => 'Email 包含不可使用的郵箱域名，請返回重新填寫。',
	'members_add_succeed' => '用戶 {username}(UID {uid}) 添加成功。',
	'members_search_invalid' => '你沒有提供搜索的條件，請返回修改。',
	'members_search_noresults' => '沒有找到符合條件的會員。',
	'members_delete_confirm' => '本操作不可恢復，你確定要刪除符合條件的 {membernum} 個用戶嗎？',
	'members_delete_succeed' => '符合條件的 {numdeleted} 個用戶被成功刪除。',
	'members_edit_nonexistence' => '指定用戶不存在，請返回。',
	'members_edit_illegal' => '該用戶為「{grouptitle}」成員，你不能直接禁止該用戶，請返回<a href="'.ADMINSCRIPT.'?action=members&operation=search&uid={uid}&submit=yes&frames=yes" target="_blank">編輯</a>去掉其特殊用戶組身份。',
	'members_edit_reason_invalid' => '你沒有輸入執行此變更的理由，請返回修改。',
	'members_edit_duplicate' => '新用戶名與現有用戶重複，請返回修改。',
	'members_edit_succeed' => '用戶資料成功更新。',
	'members_edit_groups_toomany' => '你設置了過多的擴展用戶組，已超出系統允許的存儲容量，請返回修改。',
	'members_edit_groups_illegal' => '過期用戶組和用戶當前所屬用戶組相同，請返回修改。',
	'members_edit_groups_succeed' => '用戶的用戶組屬性編輯成功。',
	'members_edit_credits_succeed' => '用戶積分成功編輯。',
	'members_edit_medals_nonexistence' => '目前沒有可用的勳章，請到「勳章中心」啟用勳章後再進行此操作。',
	'members_edit_medals_succeed' => '用戶勳章成功編輯。',
	'members_newsletter_sm_invalid' => '你沒有輸入消息的標題或內容，請返回修改。',
	'members_newsletter_notify_succeed' => '站點通知成功發送。',
	'members_reward_invalid' => '你沒有對用戶積分進行獎懲，請返回修改。',
	'members_reward_succeed' => '用戶積分獎懲成功執行。',
	'members_reward_notify_succeed' => '用戶積分獎懲成功執行，並已通知相關用戶。',
	'members_confermedal_succeed' => '頒發勳章成功執行。',
	'members_confermedal_notify_succeed' => '頒發勳章成功執行，並已通知相關用戶。',
	'members_sameness' => '對不起，原用戶名不能與目標用戶名相同，請返回修改。',
	'members_add_admin_none' => '對不起，出於安全性考慮，不允許直接添加管理員，請返回修改。',
	'members_add_ban_all_none' => '對不起，不允許添加禁止訪問、禁止IP、遊客用戶組，請返回修改。',
	'members_no_find_deluser' => '對不起，沒有搜索到需要刪除的用戶，請返回修改搜索條件或者重新選擇要刪除的用戶。',
	'members_dont_contain_admin_merge' => '源用戶中包含管理員身份會員，請首先將他的管理員身份解除後再進行合併操作，否則合併無法進行，請返回更改。',
	'members_super_edit_admin_allow' => '只有站點創始人才能編輯修改管理員的資料，請返回。',
	'members_access_succeed' => '指定用戶站點權限成功更新。',
	'members_ipban_nopermission' => '只有管理員可以使用「*」通配符，請返回。',
	'members_ipban_illegal' => '操作錯誤！你自己的 IP 已經存在於禁止列表中，請返回修改。',
	'members_ipban_invalid' => '新的禁止 IP 已經存在於列表中，請返回。',
	'members_ipban_succeed' => 'IP 禁止列表成功更新。',
	'members_nonexistence' => '請先輸入你要進行操作的用戶名：',
	'members_profile_edit_succeed' => '用戶欄目成功更新',
	'members_profile_edit_title_empty_error' => '欄目標題不能為空',
	'members_verify_security_not_exist' => '指定的審核項不存在',
	'members_verify_pass_success' => '指定項目已成功通過審核',
	'members_verify_ignore_success' => '已忽略指定項目',
	'members_verify_null_selection' => '請至少選擇一個審核項目',
	'members_verify_null_operation' => '請選擇一項操作',
	'members_stat_bad_fieldid' => '指定的資料項不正確',
	'members_stat_null_operation' => '請選擇一項操作',
	'members_stat_update_option_succeed' => '更新統計項成功。',
	'members_stat_update_data_succeed' => '更新統計數據成功。',
	'members_stat_do_stepstat_prepared' => '準備更新統計數據，共 {t} 項。此過程將自動完成，請稍候',
	'members_stat_do_stepstat' => '更新統計數據中({i} / {t})，請稍候',

	'members_verify_title_invalid' => '你沒有為全部被啟用的認證設置認證名稱，請返回修改。',
	'members_verify_update_succeed' => '認證設置更新成功',
	'members_verify_succeed' => '資料審核成功',

	'moderate_members_succeed' => '審核操作成功，共 {numvalidated} 個用戶被通過，{numinvalidated} 個用戶被否決，{numdeleted} 個用戶被刪除。',
	'moderate_threads_succeed' => '審核操作成功，共 {validates} 個主題被通過，{ignores} 個主題被忽略，{recycles} 個主題被放入回收站，{deletes} 個主題被刪除。',
	'moderate_replies_succeed' => '審核操作成功，共 {validates} 個回復被通過，{ignores} 個回復被忽略，{deletes} 個回復被刪除。',
	'moderate_blogs_succeed' => '審核操作成功，共 {validates} 個日誌被通過，{ignores} 個日誌被忽略，{deletes} 個日誌被刪除。',
	'moderate_pictures_succeed' => '審核操作成功，共 {validates} 個圖片被通過，{ignores} 個圖片被忽略，{deletes} 個圖片被刪除。',
	'moderate_doings_succeed' => '審核操作成功，共 {validates} 個記錄被通過，{ignores} 個記錄被忽略，{deletes} 個記錄被刪除。',
	'moderate_shares_succeed' => '審核操作成功，共 {validates} 個分享被通過，{ignores} 個分享被忽略，{deletes} 個分享被刪除。',
	'moderate_comments_succeed' => '審核操作成功，共 {validates} 個留言被通過，{ignores} 個留言被忽略，{deletes} 個留言被刪除。',
	'moderate_articles_succeed' => '審核操作成功，共 {validates} 個文章被通過，{ignores} 個文章被忽略，{deletes} 個文章被刪除。',
	'moderate_articlecomments_succeed' => '審核操作成功，共 {validates} 個評論被通過，{ignores} 個評論被忽略，{deletes} 個評論被刪除。',
	'moderate_posts_no_access_all' => '你沒有審核任何欄目帖子的權利，請返回。',
	'moderate_posts_no_access_this' => '你沒有審核此欄目的權限，請返回。',
	'threads_move_invalid' => '你沒有選擇或選擇的目標版塊/分類不存在，請返回。',
	'threads_forumstick_del_succeed' => '置頂主題列表更新成功。',
	'threads_forumstick_del_invalid' => '你沒有選擇要取消置頂的主題，請返回。',
	'threads_forumstick_edit_succeed' => '目標版塊更改成功。',
	'threads_forumstick_add_succeed' => '主題添加成功。',
	'threads_forumstick_targets_empty' => '請選擇一個或多個目標版塊',
	'threads_forumstick_url_invalid' => '你輸入的URL無效',
	'threads_forumstick_del_nochoice' => '你沒有選擇要取消置頂的主題，請返回。',

	'recyclebin_succeed' => '回收站更新成功，共 {threadsdel} 個主題被刪除，{threadsundel} 個主題被恢復。',
	'recyclebin_none_selected' => '沒有選擇要操作的帖子。',

	'google_succeed' => 'Google 搜索設置成功更新。',

	'alipay_ratio_invalid' => '你輸入的現金/積分兌換比率小於 0，請返回修改。',
	'alipay_account_invalid' => '你輸入的收款支付寶賬號格式不正確，請返回修改。',
	'alipay_securitycode_invalid' => '你輸入的支付寶安全校驗碼格式不正確，請返回修改。',
	'alipay_succeed' => '支付寶功能成功設定。',
	'alipay_not_contract' => '請輸入支付寶簽約用戶信息。',
	'tenpay_bargainor_invalid' => '請輸入 10 位數字的財付通商戶號。',
	'tenpay_key_invalid' => '密鑰只能用32位字母或數字組成，請返回修改。',
	'tenpay_succeed' => '財付通功能成功設定。',
	'ec_credit_succeed' => '信用評價體系成功設定。',

	'orders_disabled' => '你沒有啟用交易積分或支付寶積分充值功能，無法對訂單進行管理。',
	'orders_validate_succeed' => '訂單處理成功。',

	'magics_config_succeed' => '道具基本設置更新。',
	'magics_data_succeed' => '道具資料更新。',
	'magics_parameter_invalid' => '道具參數填寫不全，請返回修改。',
	'magics_identifier_invalid' => '道具唯一標識重複，請返回修改。',
	'magics_filename_illegal' => '你輸入的道具腳本文件名包含非法字符，請返回修改。',
	'magics_filename_invalid' => '你指定的道具腳本文件({magicfile})不存在或包含語法錯誤，請返回修改。',
	'magics_present_invalid' => '禮包類道具必須包含至少一種其他道具，請返回修改。',

	'medals_succeed' => '勳章成功編輯。',
	'medals_validate_succeed' => '勳章申請審核通過。',
	'medals_invalidate_succeed' => '勳章申請已被否決。',
	'medals_add_succeed' => '成功添加勳章。',
	'medals_please_input' => '請選擇需要操作的勳章',

	'tasks_succeed' => '任務成功添加或更新。',
	'tasks_setting_invalid' => '部分任務設置不合理無法啟用，請重新設置。',
	'tasks_noscript_or_nocfg' => '指定的任務配置文件或腳本文件不存在。',
	'tasks_basic_invalid' => '任務設置不完整，請返回！',
	'tasks_time_invalid' => '上線時間或下線時間設置不合理，請返回！',
	'tasks_reward_invalid' => '任務獎勵設置不合理，請返回！',
	'tasks_del_confirm' => '你確定要刪除當前任務嗎？',
	'tasks_del' => '任務成功刪除',
	'tasks_code_invalid' => '任務腳本代碼不符合規範，無法安裝，請與作者聯繫。',
	'tasks_install_duplicate' => '指定的任務腳本已安裝，請返回。',
	'tasks_installed' => '指定任務成功安裝！',
	'tasks_uninstall_confirm' => '該操作將卸載當前任務類型並刪除其下所有任務，請確認！',
	'tasks_noscript' => '指定的任務腳本文件不存在。',
	'tasks_uninstalled' => '指定任務成功卸載！',
	'tasks_newest' => '請上傳更高版本的任務腳本，然後刷新本頁。',
	'tasks_updated' => '指定任務成功升級！',
	'tasks_newbie_setting_invalid_tid' => '你必須設置一個指定的主題，請返回修改。',
	'tasks_newbie_setting_invalid_fid' => '你必須設置一個指定的版塊，請返回修改。',
	'tasks_newbie_setting_invalid_uid' => '你必須設置一個指定的會員，請返回修改。',

	'counter_forum_succeed' => '論壇帖數重建完成。',
	'counter_digest_succeed' => '精華帖數重建完成。',
	'counter_member_succeed' => '用戶發帖數重建完成。',
	'counter_thread_succeed' => '主題帖數重建完成。',
	'counter_moved_thread_succeed' => '移動標記清理完成。',
	'counter_moved_favorites_logs_succeed' => '清理收藏夾和日誌數據完成。',
	'counter_special_arrange_succeed' => '分類信息數據整理完成。',
	'counter_groupmember_num_succeed' => '群組成員數重建完成。',
	'counter_groupmember_post_succeed' => '群組成員發帖數重建完成。',
	'counter_groupnum_succeed' => '分類群組數重建完成。',
	'counter_blog_replynum_succeed' => '日誌回複數重建完成。',
	'counter_friendnum_succeed' => '空間好友數重建完成',
	'counter_album_picnum_succeed' => '相冊圖片數重建完成',

	'database_export_custom_invalid' => '你至少需要選擇一個數據表進行備份，請返回修改。',
	'database_export_file_invalid' => '數據文件無法保存到服務器，請檢查目錄屬性。',
	'database_export_multivol_redirect' => '分卷備份: 數據文件 #{volume} 成功創建，程序將自動繼續。',
	'database_export_succeed' => '數據成功備份至服務器 <a href="{filename}">{filename}</a> 中。',
	'database_export_filename_invalid' => '你沒有輸入備份文件名或文件名中使用了敏感的擴展名，請返回修改。',
	'database_export_multivol_succeed' => '恭喜你，全部 {volume} 個備份文件成功創建，備份完成。<br /> {filelist}',
	'database_export_zip_succeed' => '數據成功備份並壓縮至服務器 <a href="{filename}">{filename}</a> 中。',
	'database_export_dest_invalid' => '目錄不存在或無法訪問，請檢查 ./data/ 目錄。',
	'database_import_multivol_succeed' => '分卷數據成功導入站點數據庫。',
	'database_import_file_illegal' => '數據文件不存在: 可能服務器不允許上傳文件或尺寸超過限制。',
	'database_import_format_illegal' => '數據文件非 Discuz! 格式，無法導入。',
	'database_import_file_succeed' => '數據文件導入成功。',
	'database_import_multivol_prompt' => '分卷數據第一捲成功導入數據庫，你需要自動導入本次備份的其他分卷嗎？',
	'database_import_multivol_redirect' => '數據文件 #{volume} 成功導入，程序將自動繼續。',
	'database_import_confirm' => '導入和當前 Discuz! 版本不一致的數據極有可能產生無法解決的故障，你確定繼續嗎？',
	'database_import_unzip' => '{info}<br />備份文件解壓縮完畢，你需要自動導入備份嗎？導入後解壓縮的文件將會被刪除。',
	'database_import_multivol_unzip' => '{info}<br />備份文件解壓縮完畢，你需要自動解壓縮其他的分卷文件嗎？',
	'database_import_multivol_unzip_redirect' => '數據文件 #{multivol} 成功解壓縮，程序將自動繼續。',
	'database_import_multivol_confirm' => '所有分卷文件解壓縮完畢，你需要自動導入備份嗎？導入後解壓縮的文件將會被刪除。',
	'database_import_succeed' => '數據成功導入站點數據庫。',
	'database_shell_fail' => 'Shell 權限被禁止或服務器不支持，無法使用 MySQL Dump 方式備份或恢複數據，請返回。',
	'database_file_delete_succeed' => '指定備份文件成功刪除。',
	'database_file_delete_invalid' => '你沒有選擇要刪除的備份文件，請返回。',
	'database_run_query_invalid' => '升級錯誤，MySQL 提示: {sqlerror} ，請返回。',
	'database_run_query_succeed' => 'Discuz! 數據結構成功升級，影響的記錄行數 {affected_rows}，請返回。',

	'adv_config_succeed' => '廣告設置成功更新。',
	'adv_title_invalid' => '你沒有填寫廣告標題，請返回修改。',
	'adv_endtime_invalid' => '你輸入的廣告結束時間早於當前時間或廣告起始時間，請返回修改。',
	'adv_parameter_invalid' => '你沒有完成與展現方式相對應的必填內容，請返回修改。',
	'adv_update_succeed' => '廣告列表成功更新。',
	'adv_succeed' => '廣告成功添加或更新。',
	'adv_title_more' => '對不起，你的廣告標題超過 50 個字符，請返回修改。',

	'crons_filename_illegal' => '你輸入的任務腳本文件名包含非法字符，請返回修改。',
	'crons_filename_invalid' => '你指定的任務腳本文件({cronfile})不存在或包含語法錯誤，請返回修改。',
	'crons_time_invalid' => '你沒有指定計劃任務執行的時間或條件，請返回修改。',
	'crons_succeed' => '計劃任務成功更新。',
	'crons_run_invalid' => '你要運行任務的腳本文件({cronfile})不存在或包含語法錯誤，任務無法運行，請返回。',
	'crons_run_succeed' => '計劃任務成功執行。',

	'onlinelist_succeed' => '在線列表項目成功更新。',
	'forumlinks_succeed' => '友情鏈接成功更新。',
	'censor_succeed' => '詞語過濾成功更新。',
	'censor_batch_add_succeed' => '批量導入詞語完畢。總共新增詞語 <b>({newcount})</b>, 更新詞語 <b>({updatecount})</b>, 忽略詞語 <b>({ignorecount})</b>。',
	'censor_keywords_tooshort' => '添加關鍵詞長度過短(少於 3 個字節)，請返回修改。',
	'censor_keywords_existence' => '當前詞庫中已經有此關鍵詞，請勿添加重複詞語，請返回修改',
	'smilies_type_nonexistence' => '指定的表情分類不存在。',
	'smilies_delete_invalid' => '你不能直接刪除非空的表情分類，請先返回刪除本分類下的所有表情。',
	'smilies_edit_succeed' => '表情列表成功更新。',
	'smilies_import_succeed_renamed' => '導入表情分類名稱與現有重複，已被自動重命名。表情成功導入。',
	'smilies_import_succeed' => '表情成功導入。',
	'smilies_directory_invalid' => '表情目錄 {smurl} 不存在，你可以通過 FTP 創建目錄 {smurl} 並上傳相應的表情圖片。請返回。',
	'smilies_update_succeed' => '更新成功，在 {smurl} 目錄中共搜索到 {num} 個尚未啟用的表情，已自動添加到表情分類「{typename}」。',
	'smilies_update_error' => '目錄 {smurl} 中沒有找到尚未使用的表情圖片，請返回。<br />添加表情請通過 FTP 上傳表情圖片到 {smurl} 目錄，然後刷新本頁。',
	'thread_icon_succeed' => '主題圖標成功更新。',
	'thread_stamp_succeed' => '主題圖章成功更新。',
	'attachtypes_duplicate' => '新增擴展名與現有重複，請返回修改。',
	'attachtypes_succeed' => '附件類型成功更新。',

	'credits_update_succeed' => '積分規則成功更新。',

	'styles_export_invalid' => '指定的風格不存在，無法導出。',
	'styles_delete_invalid' => '你不能直接刪除系統默認的風格，請返回選擇其他風格為默認後再進行刪除。',
	'styles_delete_invalid_default' => '請勿刪除 ID 為 1 的風格，這是系統內置風格。如果你不喜歡這款風格，可以禁用它。',
	'styles_edit_succeed' => '界面方案成功更新。',
	'styles_import_version_invalid' => '本風格適用於 Discuz! {cur_version} 與當前版本({set_version})不一致，請返回。',
	'styles_import_version_invalid_confirm' => '本風格適用於 Discuz! {cur_version} 與當前版本({set_version})不一致，你確定要安裝嗎？',
	'styles_import_directory_invalid' => '模板目錄無法自動建立，請設置 {basedir} 目錄屬性為 777<br />或通過 FTP 建立目錄 {directory} 並設置屬性為 777。',
	'styles_import_succeed_renamed' => '導入風格或模板名稱與現有重複，已被自動重命名。界面方案成功導入。',
	'styles_import_succeed' => '界面方案導入完畢！',
	'styles_install_succeed' => '界面方案安裝完畢！',
	'styles_restore_succeed' => '界面方案已恢復成初始設置！',
	'styles_edit_variable_duplicate' => '新增的替換變量名已經存在，請返回修改。',
	'styles_edit_variable_illegal' => '新增的替換變量名稱不合法，請返回修改。',
	'styles_copy_succeed' => '界面方案成功複製。',
	'styles_nonexistence' => '請先選擇你要進行操作的界面方案：',

	'tpl_directory_invalid' => '模板目錄 {directory} 不存在於 ./templates 中，或以 \"/\" 結尾，請返回修改。',
	'tpl_new_directory_invalid' => '你沒有填寫模板所在目錄，請返回修改。',
	'tpl_default_directory_invalid' => '你不能修改默認模板的目錄設置，請返回。',
	'tpl_delete_invalid' => '你不能刪除默認模板，請返回。',
	'tpl_update_succeed' => '模板套系成功更新。',

	'fields_edit_succeed' => '用戶資料欄目成功更新。',
	'fields_edit_invalid' => '項目名稱和長度不能為空，請返回修改。',

	'dzcode_edit_succeed' => 'Discuz! 代碼成功更新。',
	'dzcode_edit_tag_invalid' => '代碼標籤為空或包含非法字符，請返回修改。',
	'dzcode_edit_range_invalid' => '代碼參數個數或嵌套層數範圍無效，請返回修改。',

	'plugins_setting_module_nonexistence' => '指定的插件管理模塊文件({modfile})不存在或存在語法錯誤，請檢查是否已將插件完整上傳。',
	'plugins_setting_succeed' => '插件參數設置成功更新。',
	'plugins_edit_name_invalid' => '你沒有輸入插件名稱，請返回修改。',
	'plugins_edit_directory_invalid' => '你輸入的插件目錄不合法或沒有使用 \"/\" 結尾，請返回修改。',
	'plugins_edit_identifier_invalid' => '你輸入的唯一標識符不合法或與現有插件重複，請返回修改。',
	'plugins_edit_modules_duplicated' => '你輸入的程序模塊名稱與現有模塊重複，請返回修改。',
	'plugins_edit_modules_name_invalid' => '你輸入的程序模塊名稱不合法，請返回修改。',
	'plugins_edit_modules_url_invalid' => '你沒有輸入直接鏈接 URL，請返回修改。',
	'plugins_edit_modules_menu_invalid' => '你沒有輸入菜單名稱，請返回修改。',
	'plugins_edit_hooks_title_invalid' => '你輸入的鉤子名稱不合法或與現有鉤子重複，請返回修改。',
	'plugins_edit_language_invalid' => '插件語言包文件({langfile})不存在。',
	'plugins_edit_hooks_succeed' => '插件鉤子成功更新。',
	'plugins_edit_var_invalid' => '你輸入的配置變量名不合法或重複，請返回修改。',
	'plugins_edit_var_title_invalid' => '你沒有輸入配置名稱，請返回修改。',
	'plugins_edit_vars_succeed' => '插件變量配置成功更新。',
	'plugins_edit_succeed' => '插件配置成功更新。',
	'plugins_add_succeed' => '插件已成功添加，請繼續進行詳細設置。',
	'plugins_import_version_invalid' => '本插件適用於 Discuz! {cur_version} 與當前版本({set_version})不一致，請返回。',
	'plugins_import_version_invalid_confirm' => '本插件適用於 Discuz! {cur_version} 與當前版本({set_version})不一致，你確定要安裝嗎？<br />如果本插件的安裝說明中不包含修改文件的內容則說明此插件為綠色插件，你可放心安裝。',
	'plugins_import_identifier_duplicated' => '你要導入的插件({plugin_name})已經安裝，請返回。',
	'plugins_import_succeed' => '插件數據成功導入！<br />為了正常使用此插件，你可能還需要上傳或修改相應的文件或模板，詳情請查看本插件的安裝說明',
	'plugins_import_hooks_title_invalid' => '插件的鉤子名稱不合法，無法導入。',
	'plugins_import_var_invalid' => '插件的鉤子名稱不合法，無法導入。',
	'plugins_install_succeed' => '插件成功安裝！<br />為了正常使用此插件，你可能還需要上傳或修改相應的文件或模板，詳情請查看本插件的安裝說明',
	'plugins_nonexistence' => '你即將進行的操作：設計插件。請先選擇插件：',
	'plugins_delete_confirm' => '你確定要卸載此插件嗎？',
	'plugins_delete_succeed' => '插件成功卸載！<br />為了正常使用此插件，你可能還需要刪除或修改相應的文件或模板，詳情請查看本插件的安裝說明',
	'plugins_upgrade_hooks_title_invalid' => '插件的鉤子名稱不合法，無法升級。',
	'plugins_upgrade_var_invalid' => '插件的鉤子名稱不合法，無法升級。',
	'plugins_upgrade_succeed' => '插件成功升級到 {toversion}！',

	'addons_provider_nonexistence' => '資源提供商不存在，請返回。',
	'addons_provider_disabled' => '資源提供商不存在或已被關閉，請返回',
	'addons_provider_apiinvalid' => '資源提供商資源連接錯誤，請返回。',
	'addons_provider_removesucceed' => '資源提供商已經移除。',
	'addons_provider_exists' => '資源提供商已經存在。',
	'addons_provider_addsucceed' => '資源提供商成功添加。',

	'trade_fee_error' => '交易設置有誤，請返回修改。',
	'reward_credits_error' => '懸賞交易積分設置有誤，請返回修改。',

	'update_cache_succeed' => '全部緩存更新完畢。',
	'csscache_update' => 'CSS 緩存文件已更新。',
	'ranklistcache_update' => '排行榜緩存文件已更新。',

	'jswizard_succeed' => '數據調用成功更新。',

	'creditwizard_resetusercredit_warning' => '<font color=\"FF0000\"><b>警告：</b></font>此操作將重置所有用戶的擴展積分 extcredits{resetcredit} 為 {initcredits}，你是否確認此操作？',
	'creditwizard_resetusercredit_ok' => '所有用戶的積分已重置',
	'creditwizard_edit_rate_invalid' => '{grouptitle} 評分上下限或 24 小時最大評分數設置有誤，請返回修改。',
	'creditwizard_edit_succeed' => '積分項目設置成功更新。',

	'filecheck_nofound_md5file' => '不存在校驗文件，無法進行此操作。',

	'dbcheck_permissions_invalid' => '你的服務器環境不允許執行數據庫校驗，無法進行此操作。',
	'dbcheck_checking' => '正在進行數據庫校驗，請稍候......',
	'dbcheck_nofound_md5file' => '不存在校驗文件，無法進行此操作。',
	'dbcheck_ok' => '你的數據庫完整無誤',
	'dbcheck_repair_completed' => '數據庫修復成功。',
	'dbcheck_repair_error' => '數據庫修復成功，但仍有 {errorcount} 個數據字段修復失敗，請返回。<br /><br />{error}',

	'faq_list_update' => '幫助列表更新',
	'faq_no_title' => '你沒有填寫幫助標題，請返回修改。',
	'faq_identifier_invalid' => '幫助標識重複，請返回修改。',
	'faq_keyword_toolong' => '幫助關鍵詞過長，請返回修改。',

	'ftp_password_short' => 'FTP 密碼不得少於 3 位，請返回修改。',
	'cachethread_dir_noexists' => '對不起，你所指定的目錄 {cachethreaddir} 不存在或者不可寫！請返回並嘗試通過 FTP 將其屬性改為 777。',

	'project_update_forum' => '站點全局設置更新。',
	'project_import_succeed' => '設置方案成功導入',
	'project_no_title' => '沒有填寫方案名稱，請返回。',
	'project_no_usergroup' => '你選擇的用戶組不存在。',
	'project_no_item' => '沒有填寫要保存的項目，請返回。',
	'project_sava_succeed' => '成功保存設置方案。',
	'project_target_item_invalid' => '沒有指定目標項目，請返回。',
	'project_no_scheme' => '你選擇的設置方案不存在，請返回。',
	'project_scheme_succeed' => '目標設置方案更新。',
	'project_invalid' => '站點方案參數非法，請返回。',


	'watermarkpreview_error' => '水印功能未啟用，無法預覽',
	'watermarkpreview_fontpath_error' => '文本水印 TrueType 字體文件不存在',
	'watermarkpreview_createerror' => '水印圖片無法生成或不符合生成水印的條件，請檢查設置',
	'thumbpreview_error' => '縮略圖功能未啟用，無法預覽',
	'thumbpreview_createerror' => '縮略圖片無法生成，請檢查設置',
	'imagepreview_errorcode_0' => '圖片不符合處理條件，無需處理',
	'imagepreview_errorcode_-1' => '無效的圖片，無法處理',
	'imagepreview_errorcode_-2' => '文件讀寫權限不足，無法處理圖片',
	'imagepreview_errorcode_-3' => '系統設置錯誤，無法處理圖片',
	'imagepreview_errorcode_-4' => '服務器缺少處理圖片所需的功能，無法處理圖片',

	'ecommerce_invalidcredit' => '信用度必須大於 0 才能進行評級！請返回修改。',
	'ecommerce_must_larger' => '信用等級 {rank} 的信用度必須大於上一等級的信用度！請返回修改。',

	'tags_updated' => '主題標籤設置成功更新。',
	'tags_not_open' => '主題標籤(TAG)功能沒有開啟。',

	'threadtype_infotypes_succeed' => '分類選項成功更新',
	'threadtype_infotypes_optionvariable_invalid' => '分類選項變量名重複，請返回修改',
	'threadtype_infotypes_optionvariable_iskeyword' => '選項變量名不被允許使用，請返回修改',
	'threadtype_infotypes_noexist' => '主題選項分類不存在',
	'threadtype_infotypes_option_succeed' => '分類擴展選項成功更新',
	'threadtype_infotypes_option_invalid' => '分類擴展選項名稱或者變量名為空，請返回修改。',
	'threadtype_infotypes_invalid' => '分類信息至少應該有一個選項，請返回修改。',
	'threadtype_infotypes_model_succeed' => '分類信息模型成功更新',

	'threadtype_content_no_choice' => '沒有選擇分類信息',
	'threadtype_content_delete_succeed' => '數據刪除完成',

	'search_result_noexists' => '對不起，沒有找到相關設置或管理操作！<br />輸入多個詞語搜索(不同字詞之間用一個空格隔開，不區分大小寫)，可以獲得更精確的搜索結果。',
	'search_keyword_noexists' => '請輸入要搜索的關鍵詞！',

	'nav_add_succeed' => '導航欄成功更新。',

	'focus_update_succeed' => '站長推薦成功更新。',
	'focus_add_num_limit' => '對不起，最多只能添加 10 條站長推薦。',
	'focus_add_succeed' => '站長推薦添加成功。',
	'focus_topic_noexists' => '指定的站長推薦不存在。',
	'focus_topic_exists' => '添加的站長推薦已存在。',
	'focus_edit_succeed' => '站長推薦編輯成功。',
	'focus_conf_succeed' => '站長推薦設置成功。',
	'focus_topic_addrequired' => '添加站長推薦，連接、標題、內容均不能為空，請返回填寫。',

	'delete_position_succeed' => '刪除帖子索引成功。',
	'select_thread_empty' => '沒有選擇主題，請返回重新選擇。',
	'add_postposition_succeed' => '添加帖子索引成功。',
	'addpostposition_continue' => '正在添加帖子索引，切勿關閉瀏覽器！',
	'delete_position_gotu_add' => '已經刪除了帖子索引，正轉向重新創建帖子索引，切勿關閉瀏覽器！',

	'portalcategory_delete_succeed' => '刪除分類成功。',
	'portalcategory_move_succeed' => '移動文章成功。',
	'portalcategory_update_succeed' => '更新分類成功。',
	'portalcategory_move_empty_error' => '該分類下沒有任何文章',
	'portalcategory_move_category_failed' => '無法移動文章到所選分類',
	'article_trash_succeed' => '文章移入垃圾箱成功。',
	'article_choose_at_least_one_article' => '請至少選擇一篇文章',
	'article_choose_at_least_one_operation' => '請選擇操作',
	'article_trash_recover_succeed' => '恢覆文章成功。',
	'article_trash_delete_succeed' => '選中文章已經徹底刪除',
	'article_move_succeed' => '已成功移動文章到指定分類',
	'portalcategory_move_succeed' => '移動文章成功。',
	'portalcategory_catgory_not_found' => '分類不存在或沒有選擇分類',
	'update_articletag_succeed' => '更新聚合標籤名稱成功',
	'portal_delete_confirm' => '本操作不可恢復，你確定要刪除該分類下文章嗎？',

	'block_delete_succeed' => '刪除模塊成功。',
	'block_clear_unused_succeed' => '清理無用模塊成功。',
	'blockstyle_create_succeed' => '創建模塊模板成功。',
	'blockstyle_edit_succeed' => '編輯模塊模板成功。',
	'blockstyle_should_be_kept' => '每個模塊類需要保留至少一個樣式',
	'blockstyle_blockclass_not_match' => '選擇的新樣式和原樣式不屬於同一模塊類',
	'blockstyle_delete_succeed' => '刪除模塊模板成功。',
	'block_manage_no_access' => '你沒有權限管理模塊',
	'block_choose_at_least_one_block' => '請至少選擇一個模塊',
	'blockstyle_manage_no_access' => '你沒有權限管理模塊模板',
	'topic_choose_at_least_one_topic' => '請至少選擇一個專題',
	'topic_choose_at_least_one_optype' => '請選擇一個操作項',
	'topic_delete_succeed' => '刪除專題成功。',
	'topic_close_succeed' => '關閉專題成功。',
	'topic_open_succeed' => '開啟專題成功。',

	'blogcategory_update_succeed' => '更新日誌分類成功。',
	'blogcategory_delete_succeed' => '刪除日誌分類成功。',
	'blogcategory_catgory_not_found' => '指定的日誌分類不存在',
	'blogcategory_move_category_failed' => '無法移動日誌到指定分類',
	'blogcategory_manage_no_access' => '你沒有權限管理日誌分類',
	'blog_choose_at_least_one_blog' => '請至少選擇一篇日誌',
	'blog_choose_at_least_one_operation' => '請選擇操作',
	'blog_move_succeed' => '已成功移動日誌到指定分類',

	'albumcategory_update_succeed' => '更新相冊分類成功。',
	'albumcategory_delete_succeed' => '刪除相冊分類成功。',
	'albumcategory_catgory_not_found' => '指定的相冊分類不存在',
	'albumcategory_move_category_failed' => '無法移動相冊到指定分類',
	'albumcategory_manage_no_access' => '你沒有權限管理相冊分類',
	'album_choose_at_least_one_album' => '請至少選擇一個相冊',
	'album_choose_at_least_one_operation' => '請選擇操作',
	'album_move_succeed' => '已成功移動相冊到指定分類',

	'founder_perm_group_update_succeed' => '管理團隊職務資料已成功更新。',
	'founder_perm_group_name_duplicate' => '團隊職務 {name} 已經存在，請返回更改。',
	'founder_perm_groupperm_update_succeed' => '職務權限成功更新。',
	'founder_perm_member_update_succeed' => '管理團隊成員資料已成功更新。',
	'founder_perm_member_noexists' => '指定的用戶 {name} 不存在，請返回更改。',
	'founder_perm_member_duplicate' => '用戶 {name} 已經存在，請返回更改。',
	'founder_perm_gperm_update_succeed' => '管理團隊權限資料已成功更新。',
	'founder_perm_member_noexists' => '用戶不存在，請返回。',

	'postsplit_no_prime_table' => '必須指定唯一一個表作為主表',
	'postsplit_more_addition_table' => '最多只能有一個表作為副表',
	'postsplit_table_type_update_succeed' => '更新分表類型成功。',
	'postsplit_forum_must_be_closed' => '請在論壇關閉狀態下進行帖子移動操作',
	'postsplit_no_target_table' => '必須選擇要移動到的目標帖子表',
	'postsplit_moving' => '已經移動了 {count} 個主題，共有 {total} 個主題<br /><input type="hidden" name="tids" value="{tids}" /><input type="hidden" name="conditions" value="{conditions}" /><input type="hidden" name="threads_per_time" value="{threads_per_time}" />',
	'postsplit_move_succeed' => '移動完成',
	'postsplit_table_create_succeed' => '新的帖子表創建成功，請返回',
	'postsplit_table_no_exists' => '{table} 表不存在，請返回。',
	'postsplit_drop_table_forum_post_error' => '不能刪除 {table} 表。',
	'postsplit_drop_table_no_empty_error' => '不能刪除非空的post表',
	'postsplit_drop_table_succeed' => '刪除 {table} 表成功。',
	'postsplit_primary_table_confirm' => '創建新的主表為使從此以後發的主題帖都存放在新的主表中，一旦主表裡有了新帖子，它就不能刪除了。確定要斷續嗎？',
	'postsplit_resetpid_succeed' => 'Post ID重置完成',

	'threadsplit_moving' => '已經移動了 {count} 個主題，共有 {total} 個主題<br /><input type="hidden" name="conditions" value="{conditions}" /><input type="hidden" name="threads_per_time" value="{threads_per_time}" />',
	'threadsplit_table_create_succeed' => '主題存檔表創建成功。',
	'threadsplit_table_no_exists' => '要刪除的表不存在，請返回。',
	'threadsplit_drop_table_no_empty_error' => '不能刪除非空的主題表。',
	'threadsplit_drop_table_succeed' => '主題存檔表刪除成功。',
	'threadsplit_manage_update_succeed' => '更新信息成功。',
	'threadsplit_move_succeed' => '主題移動完成，下面更新版塊存檔區。',
	'threadsplit_move_source_target_no_same' => '目標表和原始表不能相同',
	'threadsplit_manage_forum_processing' => '已處理完 {table}，請稍候……',
	'threadsplit_manage_forum_complete' => '已更新所有版塊存檔區',
	'threadsplit_forum_must_be_closed' => '移動主題前請先關閉論壇',
	'threadsplit_no_target_table' => '請選擇目標數據表',

	'my_register_error' => '開啟漫遊應用服務失敗，原因：<br>{errMessage} (ERRCODE:{errCode})<br><br><a href="http://www.discuz.net/index.php?gid=141" target="_blank">如果有疑問，請訪問我們的技術論壇尋求幫助</a>。',
	'my_app_status_off' => '請先正常開啟漫遊功能',

	'group_status_off' => '請先開啟群組功能，現在轉到群組設置頁。',
	'group_level_update_credits_duplicate' => '群組等級積分下限設置重複，請返回修改。',
	'group_level_update_credits_invalid' => '缺少積分下限為負數或 0 的群組等級，請返回修改。',
	'group_level_update_succeed' => '群組等級成功更新。如你添加了新的等級，<br />請不要忘記修改其相應的設置。',
	'group_level_noexist' => '群組等級不存在。',
	'group_level_succeed_except_all_levels' => '操作成功，但不允許除所有的群組等級。',
	'group_nonexist' => '群組不存在',
	'group_name_exist' => '群組名稱已經存在!',
	'group_edit_succeed' => '群組編輯成功!',
	'group_thread_removing' => '正在刪除群組內的帖子，請勿關閉瀏覽器！',
	'group_delete_succeed' => '群組刪除成功。',
	'group_delete_confirm' => '刪除群組操作不可恢復，確認要刪除嗎？',
	'group_delete_no_choice' => '沒有選擇要刪除的群組，請返回。',
	'group_userperm_succeed' => '操作成功。',
	'group_update_succeed' => '群組分類設置成功更新。',
	'group_mergetype_target_error' => '目標分類錯誤。',
	'group_mergetype_succeed' => '分類合併成功。',
	'group_mergetype_confirm' => '合併群組操作不可恢復，確認要合併嗎？',

	'grouptype_delete_succeed' => '群組分類刪除成功。',
	'grouptype_delete_sub_notnull' => '下級分類不為空，請先返回刪除本分類或分類的下級群組。',
	'grouptype_delete_confirm' => '本操作不可恢復，你確定要刪除該分類，清除其中帖子和附件嗎？<br />注意: 刪除群組並不會更新用戶發帖數和積分',
	'grouptype_delete_alarm' => '本操作不可恢復，正在刪除群組數據... ...',

	'feed_global_add_success' => '動態發佈成功，請返回',
	'sitefeed_error' => '請正確添加動態標題、動態內容再提交發佈',

	'report_resolve_succeed' => '處理成功,現在返回列表頁。',
	'report_receive_succeed' => '操作成功。',

	'two_domain_length_not_more_than_30_characters' => '設置的二級域名長度不能超過30個字符，請返回修改。',
	'only_two_names_from_english_composition_and_figures' => '設置的二級域名需要由英文字母開頭且只由英文和數字構成，請返回修改。',
	'two_domain_have_been_occupied' => '設置的二級域名已經有人使用了，請返回修改。',

	'custommenu_add_succeed' => '菜單 {title} 已成功添加到常用操作，即將返回上一頁，你可以<a href="'.ADMINSCRIPT.'?action=misc&operation=custommenu">點這裡編輯常用操作</a>',

	'forum_name_duplicate' => '表單名稱設置不能重複，請重新設置',

	'robots_output' => '請下載此文件，並上傳至您站點的根目錄下 <a href="http://'.$_SERVER['HTTP_HOST'].'/robots.txt" target="_blank">http://'.$_SERVER['HTTP_HOST'].'/robots.txt</a> 位置處。',
);

?>