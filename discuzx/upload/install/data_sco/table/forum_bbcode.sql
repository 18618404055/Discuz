
# 可設定參數類型 資料陣列以 \t 分隔
ALTER TABLE `pre_forum_bbcode` ADD `pattern` VARCHAR( 30 ) NOT NULL COMMENT '可設定參數類型 資料陣列以 \\t 分隔';

# 使 icon 可以接受更長的值
ALTER TABLE `pre_forum_bbcode` CHANGE `icon` `icon` TEXT NOT NULL ;
