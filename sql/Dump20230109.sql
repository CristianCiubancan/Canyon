CREATE DATABASE  IF NOT EXISTS `cq` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cq`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: cq
-- ------------------------------------------------------
-- Server version	5.7.39-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad_log`
--

DROP TABLE IF EXISTS `ad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(48) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addition` int(4) unsigned NOT NULL DEFAULT '0',
  `words` varchar(300) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_queue`
--

DROP TABLE IF EXISTS `ad_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idnext` int(4) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(48) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `addition` smallint(6) unsigned NOT NULL DEFAULT '0',
  `words` varchar(300) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_achievement`
--

DROP TABLE IF EXISTS `cq_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_achievement` (
  `userid` int(4) unsigned NOT NULL DEFAULT '0',
  `point` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve1` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve2` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve3` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve4` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve5` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve6` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve7` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve8` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve9` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve10` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve11` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve12` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve13` int(4) unsigned NOT NULL DEFAULT '0',
  `achieve14` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_achievementtype`
--

DROP TABLE IF EXISTS `cq_achievementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_achievementtype` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(48) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `position` smallint(4) unsigned NOT NULL DEFAULT '0',
  `point` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `facebook` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_position` (`position`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_action`
--

DROP TABLE IF EXISTS `cq_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_action` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `id_next` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `id_nextfail` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data` int(4) NOT NULL DEFAULT '0',
  `param` varchar(1024) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ID_IDX` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic`
--

DROP TABLE IF EXISTS `cq_arenic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_point` int(4) unsigned NOT NULL DEFAULT '0',
  `cur_honor` int(4) unsigned NOT NULL DEFAULT '0',
  `history_honor` int(4) unsigned NOT NULL DEFAULT '0',
  `day_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `day_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `asyn` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic_bonus`
--

DROP TABLE IF EXISTS `cq_arenic_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `subtype` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic_honor`
--

DROP TABLE IF EXISTS `cq_arenic_honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic_honor` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `day_prise` int(4) unsigned NOT NULL DEFAULT '0',
  `month_prise` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_inauguration_condition`
--

DROP TABLE IF EXISTS `cq_ast_prof_inauguration_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_inauguration_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ast_prof_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(3) unsigned DEFAULT '0',
  `user_level` tinyint(3) unsigned DEFAULT '0',
  `itemtype1` int(10) unsigned DEFAULT '0',
  `itemtype1_num` int(10) unsigned DEFAULT '0',
  `itemtype2` int(10) unsigned DEFAULT '0',
  `itemtype2_num` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_level`
--

DROP TABLE IF EXISTS `cq_ast_prof_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ast_prof` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_promote_condition`
--

DROP TABLE IF EXISTS `cq_ast_prof_promote_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_promote_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ast_prof_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ast_prof_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(3) unsigned DEFAULT '0',
  `user_level` tinyint(3) unsigned DEFAULT '0',
  `ast_prof_level` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_auction`
--

DROP TABLE IF EXISTS `cq_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_auction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class` smallint(4) unsigned NOT NULL DEFAULT '0',
  `seller` int(10) unsigned NOT NULL DEFAULT '0',
  `seller_lookface` int(10) unsigned NOT NULL DEFAULT '0',
  `moneytype` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `buyout` int(10) unsigned NOT NULL DEFAULT '0',
  `time_out` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_auction_askbuy`
--

DROP TABLE IF EXISTS `cq_auction_askbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_auction_askbuy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `auctionid` int(10) unsigned NOT NULL DEFAULT '0',
  `buyer` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `timeout` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_bonus`
--

DROP TABLE IF EXISTS `cq_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_bonus` (
  `action` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_account` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(4) unsigned NOT NULL DEFAULT '0',
  `time` int(4) unsigned NOT NULL DEFAULT '0',
  `ordernumber` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `bonus_in_time` int(11) NOT NULL DEFAULT '0',
  `number` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ordernumber` (`ordernumber`) USING BTREE,
  KEY `bonus_in_time` (`bonus_in_time`) USING BTREE,
  KEY `number` (`number`) USING BTREE,
  KEY `index_refid` (`ref_id`) USING BTREE,
  KEY `index_ordernumber` (`ordernumber`) USING BTREE,
  KEY `idx_id_account_flag` (`id_account`,`flag`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_business`
--

DROP TABLE IF EXISTS `cq_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_business` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT '0',
  `business` int(4) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid` (`userid`) USING BTREE,
  KEY `business` (`business`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_campsite_npc`
--

DROP TABLE IF EXISTS `cq_campsite_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_campsite_npc` (
  `campsite_id` int(10) unsigned DEFAULT '0',
  `npc_id` int(10) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_card`
--

DROP TABLE IF EXISTS `cq_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_id` int(4) unsigned NOT NULL DEFAULT '0',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `itemtype` int(4) unsigned NOT NULL DEFAULT '0',
  `money` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono` int(4) unsigned NOT NULL DEFAULT '0',
  `flag` int(4) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_changename_backup`
--

DROP TABLE IF EXISTS `cq_changename_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_changename_backup` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(4) unsigned NOT NULL DEFAULT '0',
  `oldname` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `newname` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_config`
--

DROP TABLE IF EXISTS `cq_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_config` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL DEFAULT '0',
  `data1` int(4) NOT NULL DEFAULT '0',
  `data2` int(4) NOT NULL DEFAULT '0',
  `data3` int(4) NOT NULL DEFAULT '0',
  `data4` int(4) NOT NULL DEFAULT '0',
  `data5` int(4) NOT NULL DEFAULT '0',
  `describ` varchar(765) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=80801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_db`
--

DROP TABLE IF EXISTS `cq_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_db` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(4) unsigned DEFAULT '0',
  `chk_sum` int(4) unsigned DEFAULT '0',
  `time_stamp` int(4) unsigned NOT NULL DEFAULT '0',
  `used` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_accountid_chksum` (`account_id`,`chk_sum`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_db2`
--

DROP TABLE IF EXISTS `cq_db2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_db2` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(4) unsigned DEFAULT '0',
  `chk_sum` int(4) unsigned DEFAULT '0',
  `time_stamp` int(4) unsigned NOT NULL DEFAULT '0',
  `used` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_accountid_chksum` (`account_id`,`chk_sum`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_deluser`
--

DROP TABLE IF EXISTS `cq_deluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_deluser` (
  `id` int(4) unsigned NOT NULL,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `mateid` int(4) unsigned NOT NULL DEFAULT '0',
  `lookface` int(4) unsigned NOT NULL DEFAULT '0',
  `hair` smallint(2) unsigned NOT NULL DEFAULT '0',
  `money` int(4) unsigned NOT NULL DEFAULT '0',
  `money_saved` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `exp` bigint(4) unsigned NOT NULL DEFAULT '0',
  `strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `Speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT '0',
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `life` smallint(2) unsigned NOT NULL DEFAULT '0',
  `mana` smallint(2) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pk` smallint(2) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '1002',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '430',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '380',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `task_mask` int(4) unsigned NOT NULL DEFAULT '0',
  `time_of_life` datetime DEFAULT NULL,
  `virtue` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `home_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lock_key` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `god_status` datetime DEFAULT NULL,
  `exp_ball_num` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_ball_usage` int(4) unsigned NOT NULL DEFAULT '0',
  `online_time` int(4) unsigned NOT NULL DEFAULT '0',
  `auto_exercise` smallint(2) unsigned NOT NULL DEFAULT '0',
  `last_logout` datetime NOT NULL,
  `last_logout2` datetime DEFAULT NULL,
  `mete_lev` int(4) NOT NULL DEFAULT '0',
  `current_layout_type` tinyint(1) NOT NULL DEFAULT '0',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `business` datetime DEFAULT NULL,
  `send_flower_date` datetime DEFAULT NULL,
  `flower_r` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `exp_multiply` float(5,2) unsigned NOT NULL DEFAULT '1.00',
  `exp_expires` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `quiz_point` int(4) unsigned NOT NULL DEFAULT '0',
  `vip_value` int(4) unsigned NOT NULL DEFAULT '0',
  `vip_expire` datetime DEFAULT NULL,
  `flag` int(4) unsigned NOT NULL DEFAULT '0',
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_day` int(4) unsigned NOT NULL DEFAULT '0',
  `title` int(4) unsigned NOT NULL DEFAULT '0',
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `athlete_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ridepet_point` int(4) unsigned NOT NULL DEFAULT '0',
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT '0',
  `pkprotocol` tinyint(4) NOT NULL DEFAULT '0',
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT '0',
  `strength_value` int(10) unsigned NOT NULL DEFAULT '0',
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nationality` smallint(2) unsigned NOT NULL DEFAULT '0',
  `pk_setting` int(4) unsigned NOT NULL DEFAULT '0',
  `culture_value` int(10) unsigned NOT NULL DEFAULT '0',
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT '0',
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT '0',
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT '0',
  `league_contribution` int(10) unsigned NOT NULL DEFAULT '0',
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT '0',
  `channel_account` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `award_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `award_total_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `store_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `day_reset_date` int(4) unsigned NOT NULL DEFAULT '0',
  `history_max_refinelev` int(4) unsigned NOT NULL DEFAULT '0',
  `fate_task_num` int(4) unsigned NOT NULL DEFAULT '0',
  `prof_exp` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE,
  KEY `idx_mate` (`mateid`) USING BTREE,
  KEY `ID_UNIQUE` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_deluser_timeout`
--

DROP TABLE IF EXISTS `cq_deluser_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_deluser_timeout` (
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `lastname` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT '0',
  `lookface` int(4) unsigned NOT NULL DEFAULT '0',
  `hair` int(4) unsigned NOT NULL DEFAULT '0',
  `money` bigint(4) unsigned NOT NULL DEFAULT '0',
  `money_saved` bigint(4) unsigned NOT NULL DEFAULT '0',
  `coin_money` int(3) unsigned NOT NULL DEFAULT '0',
  `beans` bigint(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `exp` bigint(4) NOT NULL DEFAULT '0',
  `strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `Speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT '0',
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `life` int(4) unsigned NOT NULL DEFAULT '0',
  `mana` smallint(2) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `deed` int(4) NOT NULL DEFAULT '0',
  `pk` smallint(2) NOT NULL DEFAULT '0',
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `medal` int(4) unsigned NOT NULL DEFAULT '0',
  `medal_select` int(4) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '0',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '0',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '0',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT '0',
  `first_login` int(8) unsigned NOT NULL DEFAULT '0',
  `account` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `password` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time_of_life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `virtue` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `home_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lock_key` int(10) unsigned NOT NULL DEFAULT '0',
  `lock_cls` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `god_status` int(4) unsigned NOT NULL DEFAULT '0',
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT '0',
  `online_time` int(4) unsigned NOT NULL DEFAULT '0',
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `last_logout` int(4) unsigned NOT NULL DEFAULT '0',
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `mete_lev` int(4) NOT NULL DEFAULT '0',
  `current_layout_type` tinyint(1) NOT NULL DEFAULT '0',
  `flower` int(4) unsigned NOT NULL DEFAULT '0',
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `last_logout2` int(4) unsigned NOT NULL DEFAULT '0',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `business` int(4) unsigned NOT NULL DEFAULT '0',
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_r` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  `quiz_point` int(4) unsigned DEFAULT '0',
  `vip_value` int(4) unsigned NOT NULL DEFAULT '0',
  `flag` int(4) unsigned NOT NULL DEFAULT '0',
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_day` int(4) unsigned NOT NULL DEFAULT '0',
  `title` int(4) unsigned NOT NULL DEFAULT '0',
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `athlete_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ridepet_point` int(4) unsigned DEFAULT '0',
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT '0',
  `pkprotocol` tinyint(4) NOT NULL DEFAULT '0',
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT '0',
  `strength_value` int(10) unsigned NOT NULL DEFAULT '0',
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nationality` smallint(2) unsigned NOT NULL DEFAULT '0',
  `pk_setting` int(4) unsigned NOT NULL DEFAULT '0',
  `culture_value` int(10) unsigned NOT NULL DEFAULT '0',
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT '0',
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT '0',
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT '0',
  `league_contribution` int(10) unsigned NOT NULL DEFAULT '0',
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT '0',
  `channel_account` varchar(222) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `award_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `award_total_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `store_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `day_reset_date` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_depot`
--

DROP TABLE IF EXISTS `cq_depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_depot` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT '0',
  `playerid` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `pwd` varchar(96) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_2` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_disdain`
--

DROP TABLE IF EXISTS `cq_disdain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_disdain` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `delta_lev` int(4) NOT NULL DEFAULT '0',
  `usr_atk_mst` int(4) NOT NULL DEFAULT '0',
  `mst_atk` int(4) NOT NULL DEFAULT '0',
  `max_atk` int(4) NOT NULL DEFAULT '0',
  `max_xp_atk` int(4) NOT NULL DEFAULT '0',
  `exp_factor` int(4) NOT NULL DEFAULT '0',
  `xp_exp_factor` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usr_min` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usr_max` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usr_overadj` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usrx_min` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usrx_max` int(4) NOT NULL DEFAULT '0',
  `usr_atk_usrx_overadj` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usr_min` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usr_max` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usr_overadj` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usrx_min` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usrx_max` int(4) NOT NULL DEFAULT '0',
  `usrx_atk_usrx_overadj` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_global_data`
--

DROP TABLE IF EXISTS `cq_dyna_global_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_global_data` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `data0` int(4) NOT NULL DEFAULT '0',
  `data1` int(4) NOT NULL DEFAULT '0',
  `data2` int(4) NOT NULL DEFAULT '0',
  `data3` int(4) NOT NULL DEFAULT '0',
  `data4` int(4) NOT NULL DEFAULT '0',
  `data5` int(4) NOT NULL DEFAULT '0',
  `datastr0` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `datastr1` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `datastr2` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `datastr3` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `datastr4` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `datastr5` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `time0` int(4) unsigned NOT NULL DEFAULT '0',
  `time1` int(4) unsigned NOT NULL DEFAULT '0',
  `time2` int(4) unsigned NOT NULL DEFAULT '0',
  `time3` int(4) unsigned NOT NULL DEFAULT '0',
  `time4` int(4) unsigned NOT NULL DEFAULT '0',
  `time5` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=80213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_prize`
--

DROP TABLE IF EXISTS `cq_dyna_rank_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_start` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_end` int(10) unsigned NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_rec`
--

DROP TABLE IF EXISTS `cq_dyna_rank_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_rec` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Rank_type` int(4) unsigned NOT NULL DEFAULT '0',
  `Value` bigint(4) NOT NULL DEFAULT '0',
  `Obj_id` int(4) unsigned NOT NULL DEFAULT '0',
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `server_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Rank_type` (`Rank_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_type`
--

DROP TABLE IF EXISTS `cq_dyna_rank_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Rank_type` int(4) unsigned NOT NULL DEFAULT '0',
  `Rank_num` smallint(4) unsigned NOT NULL DEFAULT '0',
  `Rank_date_min` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dynamap`
--

DROP TABLE IF EXISTS `cq_dynamap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dynamap` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT 'undefined',
  `describe_text` varchar(381) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `mapdoc` int(4) unsigned NOT NULL DEFAULT '0',
  `type` bigint(20) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(4) unsigned NOT NULL DEFAULT '0',
  `mapgroup` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `idxserver` int(4) NOT NULL DEFAULT '-1',
  `weather` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bgmusic` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bgmusic_show` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal0_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal0_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `reborn_mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `reborn_portal` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `res_lev` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link_map` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `link_x` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `link_y` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `color` int(4) unsigned zerofill DEFAULT '4294967295',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dynanpc`
--

DROP TABLE IF EXISTS `cq_dynanpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dynanpc` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT '0',
  `ownertype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(35) NOT NULL DEFAULT '',
  `type` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `lookface` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `idxserver` tinyint(3) NOT NULL DEFAULT '-1',
  `mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `cellx` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `celly` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `task0` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task1` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task2` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task3` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task4` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task5` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task6` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `task7` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data0` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data1` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data2` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data3` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `datastr` varchar(128) NOT NULL DEFAULT '',
  `linkid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `maxlife` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `base` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `sort` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `itemid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `serverid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `owner_name` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `default_owner_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `defence` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `magic_def` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `harvest_date` int(10) unsigned NOT NULL DEFAULT '0',
  `new_defence` int(4) unsigned NOT NULL DEFAULT '0',
  `anti_crit` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=500012 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_enemy`
--

DROP TABLE IF EXISTS `cq_enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_enemy` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `enemy` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_userid_enemy` (`userid`,`enemy`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_enemy_timeout`
--

DROP TABLE IF EXISTS `cq_enemy_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_enemy_timeout` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `enemy` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fact`
--

DROP TABLE IF EXISTS `cq_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fact` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `priority` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `datetime` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `durable` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_exp`
--

DROP TABLE IF EXISTS `cq_fate_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_exp` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attrib1` int(4) unsigned NOT NULL DEFAULT '0',
  `attrib2` int(4) unsigned NOT NULL DEFAULT '0',
  `attrib3` int(4) unsigned NOT NULL DEFAULT '0',
  `attrib4` int(4) unsigned NOT NULL DEFAULT '0',
  `min_score` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_score` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reduce_cost_rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  `luck_rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  `daily_give_inc` smallint(2) unsigned NOT NULL DEFAULT '0',
  `max_value_inc` smallint(2) unsigned NOT NULL DEFAULT '0',
  `prize_itemtype` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_player`
--

DROP TABLE IF EXISTS `cq_fate_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fate1_attrib1` int(10) unsigned NOT NULL DEFAULT '0',
  `fate1_attrib2` int(10) unsigned NOT NULL DEFAULT '0',
  `fate1_attrib3` int(10) unsigned NOT NULL DEFAULT '0',
  `fate1_attrib4` int(10) unsigned NOT NULL DEFAULT '0',
  `fate2_attrib1` int(10) unsigned NOT NULL DEFAULT '0',
  `fate2_attrib2` int(10) unsigned NOT NULL DEFAULT '0',
  `fate2_attrib3` int(10) unsigned NOT NULL DEFAULT '0',
  `fate2_attrib4` int(10) unsigned NOT NULL DEFAULT '0',
  `fate3_attrib1` int(10) unsigned NOT NULL DEFAULT '0',
  `fate3_attrib2` int(10) unsigned NOT NULL DEFAULT '0',
  `fate3_attrib3` int(10) unsigned NOT NULL DEFAULT '0',
  `fate3_attrib4` int(10) unsigned NOT NULL DEFAULT '0',
  `fate4_attrib1` int(10) unsigned NOT NULL DEFAULT '0',
  `fate4_attrib2` int(10) unsigned NOT NULL DEFAULT '0',
  `fate4_attrib3` int(10) unsigned NOT NULL DEFAULT '0',
  `fate4_attrib4` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_lock_info` int(10) unsigned NOT NULL DEFAULT '0',
  `history_max_total_score` int(10) unsigned NOT NULL DEFAULT '0',
  `fate1_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fate2_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fate3_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fate4_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_protect`
--

DROP TABLE IF EXISTS `cq_fate_protect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_protect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expiry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_no1` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_no2` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_no3` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_no4` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rand`
--

DROP TABLE IF EXISTS `cq_fate_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rand` (
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `range_no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `range_rate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fate_no`,`range_no`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rank`
--

DROP TABLE IF EXISTS `cq_fate_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attrib1` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib2` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib3` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib4` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_fate_rank` (`fate_no`,`sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rule`
--

DROP TABLE IF EXISTS `cq_fate_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attib_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appear_weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attrib_value_min` int(10) unsigned NOT NULL DEFAULT '0',
  `attrib_value_max` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_fate_rule` (`fate_no`,`attib_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_task`
--

DROP TABLE IF EXISTS `cq_fate_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_forbidname`
--

DROP TABLE IF EXISTS `cq_forbidname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_forbidname` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `check` varchar(48) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_friend`
--

DROP TABLE IF EXISTS `cq_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_friend` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `friend` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_userid_friend` (`userid`,`friend`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_friend_timeout`
--

DROP TABLE IF EXISTS `cq_friend_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_friend_timeout` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `friend` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fuse`
--

DROP TABLE IF EXISTS `cq_fuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fuse` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `sort` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lev` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `quality` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `chance` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_generator`
--

DROP TABLE IF EXISTS `cq_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_generator` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_cx` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_cy` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `maxnpc` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `rest_secs` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `max_per_gen` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `npctype` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `timer_begin` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `timer_end` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `born_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `born_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `mask` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `cluster_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attribute` int(3) unsigned NOT NULL DEFAULT '0',
  `data` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mapid` (`mapid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_globalvariable`
--

DROP TABLE IF EXISTS `cq_globalvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_globalvariable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `str` varchar(675) COLLATE utf8mb4_bin DEFAULT NULL,
  `desc` varchar(675) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_golden_league_data`
--

DROP TABLE IF EXISTS `cq_golden_league_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_golden_league_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `current_point` int(10) unsigned NOT NULL DEFAULT '0',
  `total_point` int(10) unsigned NOT NULL DEFAULT '0',
  `new_point` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_goods`
--

DROP TABLE IF EXISTS `cq_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_goods` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned DEFAULT '0',
  `itemtype` int(4) unsigned DEFAULT '0',
  `moneytype` int(4) unsigned DEFAULT '0',
  `monopoly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `honor_price` int(10) unsigned NOT NULL DEFAULT '0',
  `compete_place` smallint(5) unsigned NOT NULL DEFAULT '0',
  `riding_price` int(4) unsigned NOT NULL DEFAULT '0',
  `goldenleague_price` int(4) unsigned NOT NULL DEFAULT '0',
  `server_type_flag` int(4) unsigned NOT NULL DEFAULT '0',
  `start_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `end_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4179 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_hair_color_type`
--

DROP TABLE IF EXISTS `cq_hair_color_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_hair_color_type` (
  `hair_id` int(4) unsigned NOT NULL DEFAULT '0',
  `color_id` int(4) unsigned NOT NULL DEFAULT '0',
  `cost_type` int(4) unsigned NOT NULL DEFAULT '0',
  `cost_type_id` int(4) unsigned NOT NULL DEFAULT '0',
  `cost_value` bigint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hair_id`,`color_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_init_fate_attrib`
--

DROP TABLE IF EXISTS `cq_init_fate_attrib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_init_fate_attrib` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prof_sort` int(10) unsigned DEFAULT '0',
  `fate1_attrib1` int(10) DEFAULT '0',
  `fate1_attrib2` int(10) DEFAULT '0',
  `fate1_attrib3` int(10) DEFAULT '0',
  `fate1_attrib4` int(10) DEFAULT '0',
  `fate2_attrib1` int(10) DEFAULT '0',
  `fate2_attrib2` int(10) DEFAULT '0',
  `fate2_attrib3` int(10) DEFAULT '0',
  `fate2_attrib4` int(10) DEFAULT '0',
  `fate3_attrib1` int(10) DEFAULT '0',
  `fate3_attrib2` int(10) DEFAULT '0',
  `fate3_attrib3` int(10) DEFAULT '0',
  `fate3_attrib4` int(10) DEFAULT '0',
  `fate4_attrib1` int(10) DEFAULT '0',
  `fate4_attrib2` int(10) DEFAULT '0',
  `fate4_attrib3` int(10) DEFAULT '0',
  `fate4_attrib4` int(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `prof_sort` (`prof_sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item`
--

DROP TABLE IF EXISTS `cq_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(4) unsigned NOT NULL DEFAULT '0',
  `amount` smallint(2) unsigned NOT NULL DEFAULT '100',
  `amount_limit` smallint(2) unsigned NOT NULL DEFAULT '100',
  `ident` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gem1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gem2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `magic1` int(4) unsigned NOT NULL DEFAULT '0',
  `magic2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `magic3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data` int(4) NOT NULL DEFAULT '0',
  `reduce_dmg` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `add_life` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `anti_monster` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `plunder` datetime DEFAULT NULL,
  `SpecialFlag` int(4) unsigned NOT NULL DEFAULT '0',
  `Addlevel_exp` int(4) unsigned NOT NULL DEFAULT '0',
  `color` int(4) unsigned NOT NULL DEFAULT '0',
  `monopoly` tinyint(1) NOT NULL DEFAULT '0',
  `syndicate` int(4) unsigned NOT NULL DEFAULT '0',
  `del_time` bigint(4) NOT NULL DEFAULT '0',
  `save_time` int(4) unsigned NOT NULL DEFAULT '0',
  `accumulate_num` int(4) unsigned NOT NULL DEFAULT '1',
  `refine_lev` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `refine_exp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `refine_owner_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `refine_owner_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `refine_comment` varchar(96) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `rune_exp` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `data1` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `data2` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `data3` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `data4` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `data5` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `spirit` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=59220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_limit`
--

DROP TABLE IF EXISTS `cq_item_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_limit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `limit_level` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_value_type`
--

DROP TABLE IF EXISTS `cq_item_value_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_value_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `data1` int(4) unsigned NOT NULL DEFAULT '0',
  `value1` int(4) unsigned NOT NULL DEFAULT '0',
  `value2` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4097 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemaddition`
--

DROP TABLE IF EXISTS `cq_itemaddition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemaddition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `life` smallint(6) unsigned NOT NULL DEFAULT '0',
  `attack_max` smallint(6) unsigned NOT NULL DEFAULT '0',
  `attack_min` smallint(6) unsigned NOT NULL DEFAULT '0',
  `defense` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magic_atk` smallint(6) unsigned NOT NULL DEFAULT '0',
  `magic_def` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dexterity` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dodge` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `typeid` (`typeid`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14005 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemstatus`
--

DROP TABLE IF EXISTS `cq_itemstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemstatus` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iditem` int(4) unsigned NOT NULL DEFAULT '0',
  `userid` int(4) unsigned NOT NULL DEFAULT '0',
  `statu` int(4) unsigned NOT NULL DEFAULT '0',
  `lev` int(4) unsigned NOT NULL DEFAULT '0',
  `power1` int(4) unsigned NOT NULL DEFAULT '0',
  `power2` int(4) unsigned NOT NULL DEFAULT '0',
  `realsecs` int(4) unsigned NOT NULL DEFAULT '0',
  `data` int(4) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_iditem` (`iditem`) USING BTREE,
  KEY `idx_position_userid` (`position`,`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemstatus_timeout`
--

DROP TABLE IF EXISTS `cq_itemstatus_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemstatus_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iditem` int(4) unsigned NOT NULL DEFAULT '0',
  `userid` int(4) unsigned NOT NULL DEFAULT '0',
  `statu` int(4) unsigned NOT NULL DEFAULT '0',
  `lev` int(4) unsigned NOT NULL DEFAULT '0',
  `power1` int(4) unsigned NOT NULL DEFAULT '0',
  `power2` int(4) unsigned NOT NULL DEFAULT '0',
  `realsecs` int(4) unsigned NOT NULL DEFAULT '0',
  `data` int(4) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_iditem` (`iditem`) USING BTREE,
  KEY `idx_position_userid` (`position`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemtype`
--

DROP TABLE IF EXISTS `cq_itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemtype` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `req_profession` int(4) unsigned NOT NULL DEFAULT '0',
  `req_weaponskill` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `req_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `req_sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `req_force` smallint(2) unsigned NOT NULL DEFAULT '0',
  `req_speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `req_health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `req_soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `monopoly` int(4) unsigned NOT NULL DEFAULT '0',
  `price` int(4) unsigned NOT NULL DEFAULT '0',
  `id_action` int(4) unsigned NOT NULL DEFAULT '0',
  `attack_max` smallint(2) unsigned NOT NULL DEFAULT '0',
  `attack_min` smallint(2) unsigned NOT NULL DEFAULT '0',
  `defense` smallint(2) NOT NULL DEFAULT '0',
  `dexterity` smallint(2) NOT NULL DEFAULT '0',
  `dodge` smallint(2) NOT NULL DEFAULT '0',
  `life` smallint(2) NOT NULL DEFAULT '0',
  `mana` smallint(2) NOT NULL DEFAULT '0',
  `amount` smallint(2) unsigned NOT NULL DEFAULT '1',
  `amount_limit` smallint(2) unsigned NOT NULL DEFAULT '1',
  `ident` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gem1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gem2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `magic1` int(4) unsigned NOT NULL DEFAULT '0',
  `magic2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `magic3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data` int(4) unsigned NOT NULL DEFAULT '0',
  `magic_atk` smallint(2) unsigned NOT NULL DEFAULT '0',
  `magic_def` smallint(2) unsigned NOT NULL DEFAULT '0',
  `atk_range` smallint(2) unsigned zerofill NOT NULL DEFAULT '01',
  `atk_speed` smallint(2) unsigned zerofill NOT NULL DEFAULT '800',
  `fray_mode` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `repair_mode` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `type_mask` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `emoney_price` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono_price` int(4) unsigned NOT NULL DEFAULT '0',
  `save_time` int(4) NOT NULL DEFAULT '0',
  `critical_rate` smallint(4) unsigned NOT NULL DEFAULT '0',
  `magic_critical_rate` smallint(4) unsigned NOT NULL DEFAULT '0',
  `anti_critical_rate` smallint(4) unsigned NOT NULL DEFAULT '0',
  `magic_penetration` smallint(2) unsigned NOT NULL DEFAULT '0',
  `shield_block` int(4) unsigned NOT NULL DEFAULT '0',
  `crash_attack` smallint(4) unsigned NOT NULL DEFAULT '0',
  `stable_defence` smallint(4) unsigned NOT NULL DEFAULT '0',
  `accumulate_limit` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_metal` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_wood` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_water` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_fire` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_earth` int(4) unsigned NOT NULL DEFAULT '0',
  `type_desc` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_desc` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  `color_index` int(4) unsigned NOT NULL DEFAULT '0',
  `godsoullev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `meteor_count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recover_energy` int(10) unsigned NOT NULL DEFAULT '0',
  `auction_class` smallint(4) unsigned NOT NULL DEFAULT '0',
  `final_dmg_add` smallint(5) unsigned NOT NULL DEFAULT '0',
  `final_dmg_add_mgc` smallint(5) unsigned NOT NULL DEFAULT '0',
  `final_dmg_reduce` smallint(5) unsigned NOT NULL DEFAULT '0',
  `final_dmg_reduce_mgc` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jail_log`
--

DROP TABLE IF EXISTS `cq_jail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jail_log` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `time` int(8) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_attrib_rand`
--

DROP TABLE IF EXISTS `cq_jianghu_attrib_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_attrib_rand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `power_attrib` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_caltivate_condition`
--

DROP TABLE IF EXISTS `cq_jianghu_caltivate_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_caltivate_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `need_power_value` smallint(6) unsigned NOT NULL DEFAULT '0',
  `need_caltivate_value` int(11) unsigned NOT NULL DEFAULT '0',
  `crit_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `high_crit_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `keep_cost` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_caltivate_times`
--

DROP TABLE IF EXISTS `cq_jianghu_caltivate_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_caltivate_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `free_times` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `paid_times` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_player`
--

DROP TABLE IF EXISTS `cq_jianghu_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `enter_jianghu_flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gongfu_name` varchar(16) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `power_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `genuine_qi_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `free_caltivate_param` int(10) unsigned NOT NULL DEFAULT '0',
  `total_power_value` int(10) unsigned NOT NULL DEFAULT '0',
  `history_max_total_power_value` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_player_power`
--

DROP TABLE IF EXISTS `cq_jianghu_player_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_player_power` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `type1` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality1` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type2` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality2` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type3` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality3` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type4` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality4` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type5` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality5` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type6` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality6` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type7` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality7` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type8` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality8` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `type9` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `quality9` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_level` (`player_id`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_power_effect`
--

DROP TABLE IF EXISTS `cq_jianghu_power_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_power_effect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attrib_value` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_quality_rand`
--

DROP TABLE IF EXISTS `cq_jianghu_quality_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_quality_rand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `power_quality` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `common_rate` smallint(6) unsigned NOT NULL DEFAULT '0',
  `crit_rate` smallint(6) unsigned NOT NULL DEFAULT '0',
  `high_crit_rate` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_killmonster`
--

DROP TABLE IF EXISTS `cq_killmonster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_killmonster` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `event_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `timestamp` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_leaveword`
--

DROP TABLE IF EXISTS `cq_leaveword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_leaveword` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `recv_id` int(4) unsigned DEFAULT '0',
  `send_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown',
  `time` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '00000000000000',
  `words` varchar(765) COLLATE utf8mb4_bin NOT NULL DEFAULT 'undefined',
  `lookface` int(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_time` (`time`) USING BTREE,
  KEY `idx_recv_id` (`recv_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_levexp`
--

DROP TABLE IF EXISTS `cq_levexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_levexp` (
  `level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `exp` bigint(4) NOT NULL DEFAULT '0',
  `up_lev_time` int(4) NOT NULL DEFAULT '0',
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT '0',
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_log`
--

DROP TABLE IF EXISTS `cq_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_log` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `task_id` int(4) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `time` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_login_rcd`
--

DROP TABLE IF EXISTS `cq_login_rcd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_login_rcd` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(4) unsigned DEFAULT '0',
  `user_id` int(4) unsigned DEFAULT '0',
  `session_secs` int(4) unsigned DEFAULT '0',
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL,
  `server_version` varchar(64) DEFAULT '1.0.0.0-alpha',
  `mac_addr` varchar(32) DEFAULT NULL,
  `ip_addr` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_lottery`
--

DROP TABLE IF EXISTS `cq_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_lottery` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `chance` int(4) unsigned NOT NULL DEFAULT '0',
  `prize_name` varchar(96) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `prize_item` int(4) unsigned NOT NULL DEFAULT '0',
  `color` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hole_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addition_lev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic`
--

DROP TABLE IF EXISTS `cq_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `exp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `unlearn` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `old_level` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `current_effect_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `available_effect_type` int(10) unsigned zerofill NOT NULL DEFAULT '0000000001',
  `effect_monopoly` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `effect_exorbitant` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_magic` (`ownerid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic_group_rate`
--

DROP TABLE IF EXISTS `cq_magic_group_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic_group_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `single_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `single_cd` smallint(5) unsigned NOT NULL DEFAULT '0',
  `three_seq_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `three_seq_cd` smallint(5) unsigned NOT NULL DEFAULT '0',
  `five_seq_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `five_seq_cd` smallint(5) unsigned NOT NULL DEFAULT '0',
  `three_onetime_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `three_onetime_cd` smallint(5) unsigned NOT NULL DEFAULT '0',
  `five_onetime_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `five_onetime_cd` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `score` (`score`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic_timeout`
--

DROP TABLE IF EXISTS `cq_magic_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic_timeout` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `exp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `unlearn` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `old_level` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `current_effect_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `available_effect_type` int(10) unsigned zerofill NOT NULL DEFAULT '0000000001',
  `effect_monopoly` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `effect_exorbitant` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_magic` (`ownerid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictype`
--

DROP TABLE IF EXISTS `cq_magictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictype` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `sort` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `name` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `crime` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `ground` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `multi` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `target` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `use_mp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `power` int(4) NOT NULL DEFAULT '0',
  `intone_speed` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `percent` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `step_secs` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `range` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `distance` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `status` int(4) NOT NULL DEFAULT '0',
  `need_prof` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `need_exp` int(4) NOT NULL DEFAULT '0',
  `need_time` int(10) unsigned NOT NULL DEFAULT '0',
  `need_level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `use_xp` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `weapon_subtype` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `active_times` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `auto_active` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `floor_attr` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `auto_learn` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `learn_level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `drop_weapon` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `use_ep` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `weapon_hit` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `use_item` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `next_magic` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `delay_ms` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `use_item_num` int(4) unsigned zerofill NOT NULL DEFAULT '0001',
  `status_data0` int(4) unsigned NOT NULL DEFAULT '0',
  `status_data1` int(4) unsigned NOT NULL DEFAULT '0',
  `status_data2` int(4) unsigned NOT NULL DEFAULT '0',
  `attr_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attr_power` int(4) unsigned NOT NULL DEFAULT '0',
  `target_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `need_ast_prof` int(4) unsigned NOT NULL DEFAULT '0',
  `need_ast_prof_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `width` int(4) unsigned DEFAULT '0',
  `data` int(10) unsigned NOT NULL DEFAULT '0',
  `dur_time` int(10) unsigned DEFAULT '0',
  `atk_interval` int(10) unsigned DEFAULT '0',
  `coldtime` int(10) unsigned NOT NULL DEFAULT '0',
  `req_uplevtime` int(10) unsigned NOT NULL DEFAULT '0',
  `first_magic` int(10) unsigned NOT NULL DEFAULT '0',
  `combo_delay` int(10) unsigned NOT NULL DEFAULT '0',
  `combo_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `magictypeex_id` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11941 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictype_ex`
--

DROP TABLE IF EXISTS `cq_magictype_ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictype_ex` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `data1` int(4) unsigned NOT NULL DEFAULT '0',
  `data2` int(4) unsigned NOT NULL DEFAULT '0',
  `data3` int(4) unsigned NOT NULL DEFAULT '0',
  `data4` int(4) unsigned NOT NULL DEFAULT '0',
  `data5` int(4) unsigned NOT NULL DEFAULT '0',
  `data6` int(4) unsigned NOT NULL DEFAULT '0',
  `data7` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictypeop`
--

DROP TABLE IF EXISTS `cq_magictypeop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictypeop` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `rebirth_time` int(1) NOT NULL DEFAULT '0',
  `profession_ago` int(2) NOT NULL DEFAULT '0',
  `profession_now` int(2) NOT NULL DEFAULT '0',
  `magictype_op` int(1) NOT NULL DEFAULT '0',
  `skill_1` int(4) NOT NULL DEFAULT '0',
  `skill_2` int(4) NOT NULL DEFAULT '0',
  `skill_3` int(4) NOT NULL DEFAULT '0',
  `skill_4` int(4) NOT NULL DEFAULT '0',
  `skill_5` int(4) NOT NULL DEFAULT '0',
  `skill_6` int(4) NOT NULL DEFAULT '0',
  `skill_7` int(4) NOT NULL DEFAULT '0',
  `skill_8` int(4) NOT NULL DEFAULT '0',
  `skill_9` int(4) NOT NULL DEFAULT '0',
  `skill_10` int(4) NOT NULL DEFAULT '0',
  `skill_11` int(4) NOT NULL DEFAULT '0',
  `skill_12` int(4) NOT NULL DEFAULT '0',
  `skill_13` int(4) NOT NULL DEFAULT '0',
  `skill_14` int(4) NOT NULL DEFAULT '0',
  `skill_15` int(4) NOT NULL DEFAULT '0',
  `skill_16` int(4) NOT NULL DEFAULT '0',
  `skill_17` int(4) NOT NULL DEFAULT '0',
  `skill_18` int(4) NOT NULL DEFAULT '0',
  `skill_19` int(4) NOT NULL DEFAULT '0',
  `skill_20` int(4) NOT NULL DEFAULT '0',
  `skill_21` int(4) NOT NULL DEFAULT '0',
  `skill_22` int(4) NOT NULL DEFAULT '0',
  `skill_23` int(4) NOT NULL DEFAULT '0',
  `skill_24` int(4) NOT NULL DEFAULT '0',
  `skill_25` int(4) NOT NULL DEFAULT '0',
  `skill_26` int(4) NOT NULL DEFAULT '0',
  `skill_27` int(4) NOT NULL DEFAULT '0',
  `skill_28` int(4) NOT NULL DEFAULT '0',
  `skill_29` int(4) NOT NULL DEFAULT '0',
  `skill_30` int(4) NOT NULL DEFAULT '0',
  `skill_31` int(4) NOT NULL DEFAULT '0',
  `skill_32` int(4) NOT NULL DEFAULT '0',
  `skill_33` int(4) NOT NULL DEFAULT '0',
  `skill_34` int(4) NOT NULL DEFAULT '0',
  `skill_35` int(4) NOT NULL DEFAULT '0',
  `skill_36` int(4) NOT NULL DEFAULT '0',
  `skill_37` int(4) NOT NULL DEFAULT '0',
  `skill_38` int(4) NOT NULL DEFAULT '0',
  `skill_39` int(4) NOT NULL DEFAULT '0',
  `skill_40` int(4) NOT NULL DEFAULT '0',
  `skill_41` int(4) NOT NULL DEFAULT '0',
  `skill_42` int(4) NOT NULL DEFAULT '0',
  `skill_43` int(4) NOT NULL DEFAULT '0',
  `skill_44` int(4) NOT NULL DEFAULT '0',
  `skill_45` int(4) NOT NULL DEFAULT '0',
  `skill_46` int(4) NOT NULL DEFAULT '0',
  `skill_47` int(4) NOT NULL DEFAULT '0',
  `skill_48` int(4) NOT NULL DEFAULT '0',
  `skill_49` int(4) NOT NULL DEFAULT '0',
  `skill_50` int(4) NOT NULL DEFAULT '0',
  `skill_51` int(4) NOT NULL DEFAULT '0',
  `skill_52` int(4) NOT NULL DEFAULT '0',
  `skill_53` int(4) NOT NULL DEFAULT '0',
  `skill_54` int(4) NOT NULL DEFAULT '0',
  `skill_55` int(4) NOT NULL DEFAULT '0',
  `skill_56` int(4) NOT NULL DEFAULT '0',
  `skill_57` int(4) NOT NULL DEFAULT '0',
  `skill_58` int(4) NOT NULL DEFAULT '0',
  `skill_59` int(4) NOT NULL DEFAULT '0',
  `skill_60` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_mail`
--

DROP TABLE IF EXISTS `cq_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_mail` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_id` int(4) unsigned NOT NULL DEFAULT '0',
  `Sender_name` varchar(96) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `title` varchar(192) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(765) COLLATE utf8mb4_bin NOT NULL,
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `action` int(4) unsigned NOT NULL DEFAULT '0',
  `expiration_date` int(4) unsigned NOT NULL DEFAULT '0',
  `item_id` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_record_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_receiver_id` (`receiver_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_map`
--

DROP TABLE IF EXISTS `cq_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_map` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT 'None',
  `describe_text` varchar(128) DEFAULT NULL,
  `mapdoc` int(4) unsigned NOT NULL DEFAULT '0',
  `type` bigint(20) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(4) unsigned NOT NULL DEFAULT '0',
  `mapgroup` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `idxserver` int(4) NOT NULL DEFAULT '-1',
  `weather` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bgmusic` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bgmusic_show` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal0_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal0_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `reborn_map` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `reborn_portal` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `res_lev` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `owner_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `link_map` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `link_x` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `link_y` smallint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `del_flag` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `color` int(4) unsigned zerofill NOT NULL DEFAULT '4294967295',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `idx` (`idxserver`,`mapgroup`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_meedrecord`
--

DROP TABLE IF EXISTS `cq_meedrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_meedrecord` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned NOT NULL DEFAULT '0',
  `userid` int(4) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `point` smallint(4) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_synid` (`synid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_message_log`
--

DROP TABLE IF EXISTS `cq_message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_message_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target_id` int(10) unsigned DEFAULT '0',
  `target_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'ALLUSERS',
  `channel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1893 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_mine_rate`
--

DROP TABLE IF EXISTS `cq_mine_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_mine_rate` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(4) unsigned NOT NULL DEFAULT '0',
  `req_lev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `req_pro` tinyint(1) unsigned NOT NULL,
  `req_money` int(4) unsigned NOT NULL DEFAULT '0',
  `req_emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `req_itemtype` int(4) unsigned NOT NULL DEFAULT '0',
  `req_itemname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_task_id` int(4) unsigned NOT NULL DEFAULT '0',
  `req_task_complete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `chance_x` int(4) unsigned NOT NULL DEFAULT '1',
  `chance_y` int(4) unsigned NOT NULL DEFAULT '100',
  `itemtype_begin` int(4) unsigned NOT NULL DEFAULT '0',
  `itemtype_end` int(4) unsigned NOT NULL DEFAULT '0',
  `timeout` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_minectrl`
--

DROP TABLE IF EXISTS `cq_minectrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_minectrl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `req_lev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `req_pro` tinyint(1) unsigned NOT NULL,
  `req_money` int(4) unsigned NOT NULL DEFAULT '0',
  `req_emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `req_itemtype` int(4) unsigned NOT NULL DEFAULT '0',
  `req_itemname` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `req_task_id` int(4) unsigned NOT NULL DEFAULT '0',
  `req_task_complete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `percent` int(10) unsigned NOT NULL DEFAULT '0',
  `interval` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount_limit` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monster_kill`
--

DROP TABLE IF EXISTS `cq_monster_kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monster_kill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `monstertype` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `usrmst` (`user_id`,`monstertype`) USING BTREE,
  KEY `usrid` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monster_type_magic`
--

DROP TABLE IF EXISTS `cq_monster_type_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monster_type_magic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monstertype` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `magic_type` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `magic_lev` int(4) unsigned NOT NULL DEFAULT '0',
  `cold_time` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `warning_time` smallint(5) unsigned zerofill NOT NULL DEFAULT '00000',
  `status_magic_type` int(4) unsigned NOT NULL DEFAULT '0',
  `status_magic_lev` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5773 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monstertype`
--

DROP TABLE IF EXISTS `cq_monstertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monstertype` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `name` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lookface` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `mana` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `attack_max` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_min` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `defence` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `dexterity` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `dodge` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `helmet_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `armor_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `weaponr_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `weaponl_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_range` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `view_range` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `escape_life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_speed` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `move_speed` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_user` int(1) unsigned NOT NULL DEFAULT '3',
  `drop_money` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `drop_itemtype` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `size_add` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `action` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `run_speed` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `drop_armet` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_necklace` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_armor` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_ring` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_weapon` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_shield` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_shoes` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `drop_hp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `drop_mp` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_def` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_hitrate` int(4) unsigned zerofill NOT NULL DEFAULT '0100',
  `ai_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `defence2` int(4) unsigned zerofill NOT NULL DEFAULT '10000',
  `stc_type` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `anti_monster` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `extra_battlelev` smallint(2) unsigned NOT NULL DEFAULT '0',
  `extra_exp` smallint(2) NOT NULL DEFAULT '0',
  `extra_damage` smallint(2) NOT NULL DEFAULT '0',
  `species_type` tinyint(3) unsigned DEFAULT '0',
  `attr_metal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attr_wood` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attr_water` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attr_fire` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attr_earth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `vs_callpet` int(4) unsigned NOT NULL DEFAULT '0',
  `transform_flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `transform_condition` int(10) unsigned NOT NULL DEFAULT '0',
  `transform_monster` int(10) unsigned NOT NULL DEFAULT '0',
  `attack_new` int(10) unsigned NOT NULL DEFAULT '0',
  `defence_new` int(10) unsigned NOT NULL DEFAULT '0',
  `stable_defence` smallint(2) unsigned NOT NULL DEFAULT '0',
  `critical_rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  `magic_critical_rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  `anti_critical_rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  `final_dmg_add` smallint(2) unsigned NOT NULL DEFAULT '0',
  `final_dmg_add_mgc` smallint(2) unsigned NOT NULL DEFAULT '0',
  `final_dmg_reduce` smallint(2) unsigned NOT NULL DEFAULT '0',
  `final_dmg_reduce_mgc` smallint(2) unsigned NOT NULL DEFAULT '0',
  `item_drop_rule1` int(10) unsigned NOT NULL DEFAULT '0',
  `item_drop_rule2` int(10) unsigned NOT NULL DEFAULT '0',
  `item_drop_rule3` int(10) unsigned NOT NULL DEFAULT '0',
  `item_drop_rule4` int(10) unsigned NOT NULL DEFAULT '0',
  `extra_magic_injury` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_newbie_info`
--

DROP TABLE IF EXISTS `cq_newbie_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_newbie_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profession` int(10) unsigned NOT NULL DEFAULT '0',
  `lweapon` int(10) unsigned NOT NULL DEFAULT '0',
  `rweapon` int(10) unsigned NOT NULL DEFAULT '0',
  `head` int(10) unsigned NOT NULL DEFAULT '0',
  `boot` int(10) unsigned NOT NULL DEFAULT '0',
  `neck` int(10) unsigned NOT NULL DEFAULT '0',
  `ring` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `item0` int(10) unsigned NOT NULL DEFAULT '0',
  `number0` int(10) unsigned NOT NULL DEFAULT '0',
  `item1` int(10) unsigned NOT NULL DEFAULT '0',
  `number1` int(10) unsigned NOT NULL DEFAULT '0',
  `item2` int(10) unsigned NOT NULL DEFAULT '0',
  `number2` int(10) unsigned NOT NULL DEFAULT '0',
  `item3` int(10) unsigned NOT NULL DEFAULT '0',
  `number3` int(10) unsigned NOT NULL DEFAULT '0',
  `item4` int(10) unsigned NOT NULL DEFAULT '0',
  `number4` int(10) unsigned NOT NULL DEFAULT '0',
  `item5` int(10) unsigned NOT NULL DEFAULT '0',
  `number5` int(10) unsigned NOT NULL DEFAULT '0',
  `item6` int(10) unsigned NOT NULL DEFAULT '0',
  `number6` int(10) unsigned NOT NULL DEFAULT '0',
  `item7` int(10) unsigned NOT NULL DEFAULT '0',
  `number7` int(10) unsigned NOT NULL DEFAULT '0',
  `item8` int(10) unsigned NOT NULL DEFAULT '0',
  `number8` int(10) unsigned NOT NULL DEFAULT '0',
  `item9` int(10) unsigned NOT NULL DEFAULT '0',
  `number9` int(10) unsigned NOT NULL DEFAULT '0',
  `magic0` int(10) unsigned NOT NULL DEFAULT '0',
  `magic1` int(10) unsigned NOT NULL DEFAULT '0',
  `magic2` int(10) unsigned NOT NULL DEFAULT '0',
  `magic3` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_profession` (`profession`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_newbie_rand_reborn`
--

DROP TABLE IF EXISTS `cq_newbie_rand_reborn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_newbie_rand_reborn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_npc`
--

DROP TABLE IF EXISTS `cq_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_npc` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ownerid` int(4) unsigned DEFAULT '0',
  `playerid` int(4) unsigned DEFAULT '0',
  `name` varchar(32) DEFAULT 'Unnamed',
  `type` int(4) unsigned zerofill DEFAULT '0000',
  `lookface` int(4) unsigned zerofill DEFAULT '0000',
  `idxserver` int(4) DEFAULT '-1',
  `mapid` int(4) unsigned zerofill DEFAULT '0000',
  `cellx` int(4) unsigned zerofill DEFAULT '0000',
  `celly` int(4) unsigned zerofill DEFAULT '0000',
  `task0` int(4) unsigned zerofill DEFAULT '0000',
  `task1` int(4) unsigned zerofill DEFAULT '0000',
  `task2` int(4) unsigned zerofill DEFAULT '0000',
  `task3` int(4) unsigned zerofill DEFAULT '0000',
  `task4` int(4) unsigned zerofill DEFAULT '0000',
  `task5` int(4) unsigned zerofill DEFAULT '0000',
  `task6` int(4) unsigned zerofill DEFAULT '0000',
  `task7` int(4) unsigned zerofill DEFAULT '0000',
  `data0` int(4) NOT NULL DEFAULT '0',
  `data1` int(4) NOT NULL DEFAULT '0',
  `data2` int(4) NOT NULL DEFAULT '0',
  `data3` int(4) NOT NULL DEFAULT '0',
  `datastr` varchar(16) DEFAULT '',
  `linkid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `life` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `maxlife` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `base` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `sort` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `itemid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `serverid` int(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_passway`
--

DROP TABLE IF EXISTS `cq_passway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_passway` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `passway_idx` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `passway_mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `passway_mapportal` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mapid` (`mapid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172320 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_peerage`
--

DROP TABLE IF EXISTS `cq_peerage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_peerage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'None',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `first_donation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_idx` (`user_id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='This table stores information about the nobility ranking.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pet`
--

DROP TABLE IF EXISTS `cq_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pet` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ownertype` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `generatorid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `typeid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `life` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `mana` smallint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '0',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '0',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '0',
  `data` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_recordmap_id` (`recordmap_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_bonus`
--

DROP TABLE IF EXISTS `cq_pk_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_bonus` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Target` int(4) unsigned NOT NULL DEFAULT '0',
  `Target_name` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `Hunter` int(4) unsigned NOT NULL DEFAULT '0',
  `Hunter_name` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `B_type` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  `Bonus` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_target` (`Target`) USING BTREE,
  KEY `index_hunter` (`Hunter`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_info`
--

DROP TABLE IF EXISTS `cq_pk_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `pk1` int(4) unsigned NOT NULL DEFAULT '0',
  `pk1_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk2` int(4) unsigned NOT NULL DEFAULT '0',
  `pk2_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk3` int(4) unsigned NOT NULL DEFAULT '0',
  `pk3_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk4` int(4) unsigned NOT NULL DEFAULT '0',
  `pk4_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk5` int(4) unsigned NOT NULL DEFAULT '0',
  `pk5_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk6` int(4) unsigned NOT NULL DEFAULT '0',
  `pk6_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk7` int(4) unsigned NOT NULL DEFAULT '0',
  `pk7_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `pk8` int(4) unsigned NOT NULL DEFAULT '0',
  `pk8_name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_type_subtype` (`type`,`subtype`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_item`
--

DROP TABLE IF EXISTS `cq_pk_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_item` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `item` int(4) unsigned NOT NULL DEFAULT '0',
  `target` int(4) NOT NULL DEFAULT '0',
  `target_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `hunter` int(4) NOT NULL DEFAULT '0',
  `hunter_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `manhunt_time` int(4) NOT NULL DEFAULT '0',
  `bonus` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hunter_item` (`hunter`,`item`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_item_timeout`
--

DROP TABLE IF EXISTS `cq_pk_item_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_item_timeout` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `item` int(4) unsigned NOT NULL DEFAULT '0',
  `target` int(4) NOT NULL DEFAULT '0',
  `target_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `hunter` int(4) NOT NULL DEFAULT '0',
  `hunter_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `manhunt_time` int(4) NOT NULL DEFAULT '0',
  `bonus` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hunter_item` (`hunter`,`item`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_mapgroup`
--

DROP TABLE IF EXISTS `cq_pk_mapgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_mapgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned zerofill DEFAULT '000',
  `name` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `map_id1` int(10) unsigned zerofill DEFAULT '0000000000',
  `map_id2` int(10) unsigned zerofill DEFAULT '0000000000',
  `map_id3` int(10) unsigned zerofill DEFAULT '0000000000',
  `map_id4` int(10) unsigned zerofill DEFAULT '0000000000',
  `map_id5` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_statistic`
--

DROP TABLE IF EXISTS `cq_pk_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `killer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pk_time` int(10) unsigned NOT NULL DEFAULT '0',
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target_battle_effect` smallint(5) unsigned NOT NULL DEFAULT '0',
  `kill_times` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_killer_id` (`killer_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_point_allot`
--

DROP TABLE IF EXISTS `cq_point_allot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_point_allot` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `profession` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `force` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `Speed` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `health` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `soul` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx` (`profession`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_portal`
--

DROP TABLE IF EXISTS `cq_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_portal` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal_idx` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `portal_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mapid` (`mapid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_quiz`
--

DROP TABLE IF EXISTS `cq_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_quiz` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `level` tinyint(4) unsigned DEFAULT NULL,
  `term` tinyint(4) unsigned DEFAULT NULL,
  `question` varchar(765) COLLATE utf8mb4_bin DEFAULT NULL,
  `answer1` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `answer2` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `answer3` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `answer4` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_rebirth`
--

DROP TABLE IF EXISTS `cq_rebirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_rebirth` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `need_prof` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `new_prof` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `need_level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `new_level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `metepsychosis` tinyint(2) unsigned zerofill NOT NULL DEFAULT '00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_redeem_exp`
--

DROP TABLE IF EXISTS `cq_redeem_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_redeem_exp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `killer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `killer_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT ' ',
  `kill_date` int(10) unsigned NOT NULL DEFAULT '0',
  `kill_times` int(10) unsigned NOT NULL DEFAULT '0',
  `lose_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_region`
--

DROP TABLE IF EXISTS `cq_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_region` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_cx` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_cy` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `datastr` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data0` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data1` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data2` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data3` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `actionid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=414 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_rule`
--

DROP TABLE IF EXISTS `cq_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_rule` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `mode` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `condition` varchar(765) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `result` varchar(765) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `possible` tinyint(3) unsigned zerofill NOT NULL DEFAULT '050',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_scenarior_screen`
--

DROP TABLE IF EXISTS `cq_scenarior_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_scenarior_screen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scenario_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `timestamp` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_setmeed`
--

DROP TABLE IF EXISTS `cq_setmeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_setmeed` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `synid` int(4) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statistic`
--

DROP TABLE IF EXISTS `cq_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statistic` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `event_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE,
  KEY `event_type` (`event_type`) USING BTREE,
  KEY `data_type` (`data_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_status`
--

DROP TABLE IF EXISTS `cq_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_status` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) NOT NULL DEFAULT '0',
  `status` int(4) unsigned NOT NULL DEFAULT '0',
  `power` int(4) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `leave_times` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `remain_time` int(4) unsigned NOT NULL DEFAULT '0',
  `end_time` datetime NOT NULL,
  `interval_time` int(4) unsigned NOT NULL DEFAULT '0',
  `data` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_status_immune`
--

DROP TABLE IF EXISTS `cq_status_immune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_status_immune` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status_immune` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statustype`
--

DROP TABLE IF EXISTS `cq_statustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statustype` (
  `id` int(4) NOT NULL DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `priorty` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_student_type`
--

DROP TABLE IF EXISTS `cq_student_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_student_type` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `Student_lev` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `User_lev_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `User_lev_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Uplevtime` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `God_time` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Addlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_super_flag`
--

DROP TABLE IF EXISTS `cq_super_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_super_flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `posindex` int(10) unsigned NOT NULL DEFAULT '0',
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_x` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_y` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(93) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_item_id` (`item_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_superman`
--

DROP TABLE IF EXISTS `cq_superman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_superman` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `number` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_advertising_info`
--

DROP TABLE IF EXISTS `cq_syn_advertising_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_advertising_info` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `idsyn` int(4) unsigned NOT NULL DEFAULT '0',
  `content` varchar(765) COLLATE utf8mb4_bin DEFAULT NULL,
  `expense` int(4) unsigned NOT NULL DEFAULT '0',
  `end_date` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_recruit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `condition_level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `condition_metem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `condition_prof` smallint(2) unsigned NOT NULL DEFAULT '0',
  `condition_sex` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `condition_battle` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_ally`
--

DROP TABLE IF EXISTS `cq_syn_ally`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_ally` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `synname` varchar(16) NOT NULL DEFAULT '',
  `allyid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `allyname` varchar(16) NOT NULL DEFAULT '',
  `stabilish_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_enemy`
--

DROP TABLE IF EXISTS `cq_syn_enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_enemy` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `synname` varchar(16) NOT NULL DEFAULT '',
  `enemyid` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `enemyname` varchar(16) NOT NULL DEFAULT '',
  `stabilish_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_history`
--

DROP TABLE IF EXISTS `cq_syn_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `syn_id` int(10) unsigned NOT NULL,
  `join_date` datetime NOT NULL,
  `leave_date` datetime NOT NULL,
  `silver` bigint(20) NOT NULL,
  `emoney` int(10) unsigned NOT NULL,
  `pk` int(10) unsigned NOT NULL,
  `guide` int(10) unsigned NOT NULL,
  `rank` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `USERIDX` (`user_id`) USING BTREE,
  KEY `SYNIDX` (`syn_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synattr`
--

DROP TABLE IF EXISTS `cq_synattr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synattr` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `syn_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `rank` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `proffer` bigint(20) unsigned zerofill NOT NULL DEFAULT '00000000000000000000',
  `proffer_emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_edu` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_pk` int(4) NOT NULL DEFAULT '0',
  `proffer_totem` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_his` bigint(20) unsigned NOT NULL DEFAULT '0',
  `proffer_emoney_his` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_edu_his` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_pk_his` int(4) NOT NULL DEFAULT '0',
  `flower` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  `duty_time_limit` datetime DEFAULT NULL,
  `assistant_id` int(10) unsigned NOT NULL DEFAULT '0',
  `master_id` int(10) unsigned NOT NULL DEFAULT '0',
  `proffer_merit` int(4) unsigned NOT NULL DEFAULT '0',
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proffer_plant` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_cultivation` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_fish` int(4) unsigned NOT NULL DEFAULT '0',
  `proffer_build` int(4) unsigned NOT NULL DEFAULT '0',
  `profession` int(4) unsigned NOT NULL DEFAULT '0',
  `last_logout` datetime DEFAULT NULL,
  `salary_flag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_syn_id` (`syn_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syncompeterank`
--

DROP TABLE IF EXISTS `cq_syncompeterank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syncompeterank` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `synid` int(4) unsigned NOT NULL DEFAULT '0',
  `relation` smallint(4) unsigned NOT NULL DEFAULT '0',
  `point` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syndicate`
--

DROP TABLE IF EXISTS `cq_syndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syndicate` (
  `id` smallint(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `name` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `announce` varchar(128) NOT NULL DEFAULT 'This is a new guild!',
  `announce_date` datetime NOT NULL,
  `leader_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `leader_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `money` bigint(8) NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `del_flag` datetime DEFAULT NULL,
  `amount` int(4) unsigned zerofill NOT NULL DEFAULT '0001',
  `totem_pole` int(4) NOT NULL DEFAULT '0',
  `last_totem` datetime DEFAULT NULL,
  `condition_level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `condition_metem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `condition_prof` int(4) unsigned NOT NULL DEFAULT '0',
  `synrank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `index_money` (`money`) USING BTREE,
  KEY `index_aniybt` (`amount`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syndomain`
--

DROP TABLE IF EXISTS `cq_syndomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syndomain` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'undefined',
  `map_id` int(4) unsigned NOT NULL DEFAULT '0',
  `enter_x` int(4) NOT NULL DEFAULT '0',
  `enter_y` int(4) NOT NULL DEFAULT '0',
  `enter_cx` int(4) unsigned NOT NULL DEFAULT '0',
  `enter_cy` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_sys_leaveword`
--

DROP TABLE IF EXISTS `cq_sys_leaveword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_sys_leaveword` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `send_name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown',
  `time` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `words` varchar(765) COLLATE utf8mb4_bin NOT NULL DEFAULT 'undefined',
  `item_id` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `index_userid` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_task`
--

DROP TABLE IF EXISTS `cq_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_task` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `id_next` int(4) unsigned zerofill DEFAULT '0000',
  `id_nextfail` int(4) unsigned zerofill DEFAULT '0000',
  `itemname1` char(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `itemname2` char(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `money` int(4) unsigned DEFAULT '0',
  `profession` int(4) unsigned DEFAULT '0',
  `sex` int(4) unsigned DEFAULT '0',
  `min_pk` int(4) DEFAULT '0',
  `max_pk` int(4) DEFAULT '0',
  `team` int(4) unsigned zerofill DEFAULT '0000',
  `metempsychosis` int(4) unsigned zerofill DEFAULT '0000',
  `query` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `marriage` tinyint(4) NOT NULL DEFAULT '-1',
  `client_active` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `remote_transfer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_totem_add`
--

DROP TABLE IF EXISTS `cq_totem_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_totem_add` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `totem_type` int(4) unsigned NOT NULL DEFAULT '0',
  `owner_id` int(4) unsigned NOT NULL DEFAULT '0',
  `battle_add` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `time_limit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trade`
--

DROP TABLE IF EXISTS `cq_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trade` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `target_id` int(4) unsigned NOT NULL DEFAULT '0',
  `user_money` int(4) unsigned NOT NULL DEFAULT '0',
  `target_money` int(4) unsigned NOT NULL DEFAULT '0',
  `user_emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `target_emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `map_id` int(4) unsigned NOT NULL DEFAULT '0',
  `user_x` smallint(2) unsigned NOT NULL DEFAULT '0',
  `user_y` smallint(2) unsigned NOT NULL DEFAULT '0',
  `target_x` smallint(2) unsigned NOT NULL DEFAULT '0',
  `target_y` smallint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  `user_ip_addr` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `user_mac_addr` varchar(32) NOT NULL DEFAULT '000000000000',
  `target_ip_addr` varchar(16) NOT NULL,
  `target_mac_addr` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trade_item`
--

DROP TABLE IF EXISTS `cq_trade_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trade_item` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `trade_id` int(4) unsigned NOT NULL DEFAULT '0',
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `item_id` int(4) unsigned NOT NULL DEFAULT '0',
  `itemtype` int(4) unsigned NOT NULL DEFAULT '0',
  `chksum` int(4) unsigned NOT NULL DEFAULT '0',
  `json_data` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trap`
--

DROP TABLE IF EXISTS `cq_trap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trap` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `look` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `owner_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `map_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `pos_x` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `pos_y` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `data` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `bound_cx` int(4) unsigned NOT NULL DEFAULT '0',
  `bound_cy` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_map_id` (`map_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_traptype`
--

DROP TABLE IF EXISTS `cq_traptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_traptype` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `sort` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `look` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `action_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `level` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_max` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_min` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `dexterity` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `attack_speed` int(4) unsigned zerofill NOT NULL DEFAULT '1000',
  `active_times` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_lev` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `magic_hitrate` int(4) unsigned zerofill NOT NULL DEFAULT '0100',
  `size` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `atk_mode` int(3) unsigned zerofill NOT NULL DEFAULT '001',
  `life_max` int(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'trap',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor`
--

DROP TABLE IF EXISTS `cq_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT '0',
  `Student_id` int(4) unsigned DEFAULT '0',
  `Betrayal_flag` int(4) unsigned DEFAULT '0',
  `Date` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE,
  KEY `index_tutor` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_access`
--

DROP TABLE IF EXISTS `cq_tutor_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT '0',
  `Exp` bigint(4) unsigned DEFAULT '0',
  `God_time` smallint(2) unsigned DEFAULT '0',
  `Addlevel` smallint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_tutor_id` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_access_timeout`
--

DROP TABLE IF EXISTS `cq_tutor_access_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_access_timeout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT '0',
  `Exp` bigint(4) unsigned DEFAULT '0',
  `God_time` smallint(2) unsigned DEFAULT '0',
  `Addlevel` smallint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_tutor` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_battle_limit_type`
--

DROP TABLE IF EXISTS `cq_tutor_battle_limit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_battle_limit_type` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `Battle_lev_limit` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_contributions`
--

DROP TABLE IF EXISTS `cq_tutor_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_contributions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT '0',
  `Student_id` int(4) unsigned DEFAULT '0',
  `God_time` smallint(2) unsigned DEFAULT '0',
  `Exp` bigint(4) unsigned DEFAULT '0',
  `Addlevel` smallint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_contributions2`
--

DROP TABLE IF EXISTS `cq_tutor_contributions2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_contributions2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT '0',
  `Student_id` int(4) unsigned DEFAULT '0',
  `God_time` smallint(2) unsigned DEFAULT '0',
  `Exp` bigint(4) unsigned DEFAULT '0',
  `Addlevel` smallint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_type`
--

DROP TABLE IF EXISTS `cq_tutor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_type` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `User_lev_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `User_lev_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Student_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Battle_lev_share` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_unlawful_name`
--

DROP TABLE IF EXISTS `cq_unlawful_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_unlawful_name` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `word` varchar(48) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user`
--

DROP TABLE IF EXISTS `cq_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `mateid` int(4) unsigned NOT NULL DEFAULT '0',
  `lookface` int(4) unsigned NOT NULL DEFAULT '0',
  `hair` smallint(2) unsigned NOT NULL DEFAULT '0',
  `money` int(4) unsigned NOT NULL DEFAULT '0',
  `money_saved` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `exp` bigint(4) unsigned NOT NULL DEFAULT '0',
  `strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `Speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT '0',
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `life` smallint(2) unsigned NOT NULL DEFAULT '0',
  `mana` smallint(2) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pk` smallint(2) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '1002',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '430',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '380',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `task_mask` int(4) unsigned NOT NULL DEFAULT '0',
  `time_of_life` datetime DEFAULT NULL,
  `virtue` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `home_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lock_key` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `god_status` datetime DEFAULT NULL,
  `exp_ball_num` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_ball_usage` int(4) unsigned NOT NULL DEFAULT '0',
  `online_time` int(4) unsigned NOT NULL DEFAULT '0',
  `auto_exercise` smallint(2) unsigned NOT NULL DEFAULT '0',
  `last_logout` datetime NOT NULL,
  `last_logout2` datetime DEFAULT NULL,
  `mete_lev` int(4) NOT NULL DEFAULT '0',
  `current_layout_type` tinyint(1) NOT NULL DEFAULT '0',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `business` datetime DEFAULT NULL,
  `send_flower_date` datetime DEFAULT NULL,
  `flower_r` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `exp_multiply` float(5,2) unsigned NOT NULL DEFAULT '1.00',
  `exp_expires` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `quiz_point` int(4) unsigned NOT NULL DEFAULT '0',
  `vip_value` int(4) unsigned NOT NULL DEFAULT '0',
  `vip_expire` datetime DEFAULT NULL,
  `flag` int(4) unsigned NOT NULL DEFAULT '0',
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_day` int(4) unsigned NOT NULL DEFAULT '0',
  `title` int(4) unsigned NOT NULL DEFAULT '0',
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `athlete_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ridepet_point` int(4) unsigned NOT NULL DEFAULT '0',
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT '0',
  `pkprotocol` tinyint(4) NOT NULL DEFAULT '0',
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT '0',
  `strength_value` int(10) unsigned NOT NULL DEFAULT '0',
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nationality` smallint(2) unsigned NOT NULL DEFAULT '0',
  `pk_setting` int(4) unsigned NOT NULL DEFAULT '0',
  `culture_value` int(10) unsigned NOT NULL DEFAULT '0',
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT '0',
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT '0',
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT '0',
  `league_contribution` int(10) unsigned NOT NULL DEFAULT '0',
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT '0',
  `channel_account` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `award_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `award_total_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `store_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `day_reset_date` int(4) unsigned NOT NULL DEFAULT '0',
  `history_max_refinelev` int(4) unsigned NOT NULL DEFAULT '0',
  `fate_task_num` int(4) unsigned NOT NULL DEFAULT '0',
  `prof_exp` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE,
  KEY `idx_mate` (`mateid`) USING BTREE,
  KEY `ID_UNIQUE` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000020 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_timeout`
--

DROP TABLE IF EXISTS `cq_user_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_timeout` (
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `lastname` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT '0',
  `lookface` int(4) unsigned NOT NULL DEFAULT '0',
  `hair` int(4) unsigned NOT NULL DEFAULT '0',
  `money` bigint(4) unsigned NOT NULL DEFAULT '0',
  `money_saved` bigint(4) unsigned NOT NULL DEFAULT '0',
  `coin_money` int(3) unsigned NOT NULL DEFAULT '0',
  `beans` bigint(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `exp` bigint(4) NOT NULL DEFAULT '0',
  `strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `Speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT '0',
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `life` int(4) unsigned NOT NULL DEFAULT '0',
  `mana` smallint(2) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `deed` int(4) NOT NULL DEFAULT '0',
  `pk` smallint(2) NOT NULL DEFAULT '0',
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `medal` int(4) unsigned NOT NULL DEFAULT '0',
  `medal_select` int(4) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '0',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '0',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '0',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT '0',
  `first_login` int(8) unsigned NOT NULL DEFAULT '0',
  `account` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `password` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time_of_life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `virtue` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `home_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lock_key` int(10) unsigned NOT NULL DEFAULT '0',
  `lock_cls` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `god_status` int(4) unsigned NOT NULL DEFAULT '0',
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT '0',
  `online_time` int(4) unsigned NOT NULL DEFAULT '0',
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `last_logout` int(4) unsigned NOT NULL DEFAULT '0',
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `mete_lev` int(4) NOT NULL DEFAULT '0',
  `current_layout_type` tinyint(1) NOT NULL DEFAULT '0',
  `flower` int(4) unsigned NOT NULL DEFAULT '0',
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `last_logout2` int(4) unsigned NOT NULL DEFAULT '0',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `business` int(4) unsigned NOT NULL DEFAULT '0',
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_r` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  `quiz_point` int(4) unsigned DEFAULT '0',
  `vip_value` int(4) unsigned NOT NULL DEFAULT '0',
  `flag` int(4) unsigned NOT NULL DEFAULT '0',
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT '0',
  `mentor_day` int(4) unsigned NOT NULL DEFAULT '0',
  `title` int(4) unsigned NOT NULL DEFAULT '0',
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `athlete_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT '0',
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT '0',
  `emoney_mono` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `ridepet_point` int(4) unsigned DEFAULT '0',
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT '0',
  `pkprotocol` tinyint(4) NOT NULL DEFAULT '0',
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT '0',
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT '0',
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT '0',
  `strength_value` int(10) unsigned NOT NULL DEFAULT '0',
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nationality` smallint(2) unsigned NOT NULL DEFAULT '0',
  `pk_setting` int(4) unsigned NOT NULL DEFAULT '0',
  `culture_value` int(10) unsigned NOT NULL DEFAULT '0',
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT '0',
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT '0',
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT '0',
  `league_contribution` int(10) unsigned NOT NULL DEFAULT '0',
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT '0',
  `channel_account` varchar(222) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `award_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `award_total_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `store_exp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `day_reset_date` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_timeout1`
--

DROP TABLE IF EXISTS `cq_user_timeout1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_timeout1` (
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `mate` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `lookface` int(4) unsigned NOT NULL DEFAULT '0',
  `hair` smallint(2) unsigned NOT NULL DEFAULT '0',
  `money` int(4) unsigned NOT NULL DEFAULT '0',
  `money_saved` int(4) unsigned NOT NULL DEFAULT '0',
  `coin_money` int(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `exp` bigint(4) NOT NULL DEFAULT '0',
  `strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `old_prof` smallint(2) unsigned NOT NULL DEFAULT '0',
  `Speed` smallint(2) unsigned NOT NULL DEFAULT '0',
  `health` smallint(2) unsigned NOT NULL DEFAULT '0',
  `soul` smallint(2) unsigned NOT NULL DEFAULT '0',
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT '0',
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `life` smallint(2) unsigned NOT NULL DEFAULT '0',
  `mana` smallint(2) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `deed` int(4) NOT NULL DEFAULT '0',
  `pk` smallint(2) NOT NULL DEFAULT '0',
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `medal` int(4) unsigned NOT NULL DEFAULT '0',
  `medal_select` int(4) unsigned NOT NULL DEFAULT '0',
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `syndicate_id` int(4) unsigned NOT NULL DEFAULT '0',
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT '0',
  `recordx` smallint(2) unsigned NOT NULL DEFAULT '0',
  `recordy` smallint(2) unsigned NOT NULL DEFAULT '0',
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT '0',
  `account` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `password` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `time_of_life` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `virtue` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `home_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `lock_key` int(10) unsigned NOT NULL DEFAULT '0',
  `lock_cls` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney` int(4) unsigned NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `god_status` int(4) unsigned NOT NULL DEFAULT '0',
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT '0',
  `online_time` int(4) unsigned NOT NULL DEFAULT '0',
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `last_logout` int(4) unsigned NOT NULL DEFAULT '0',
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT '0',
  `mete_lev` int(4) NOT NULL DEFAULT '0',
  `current_layout_type` tinyint(1) NOT NULL DEFAULT '0',
  `flower` int(4) unsigned NOT NULL DEFAULT '0',
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `last_logout2` int(4) unsigned NOT NULL DEFAULT '0',
  `donation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `business` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE,
  KEY `index_mate` (`mate`) USING BTREE,
  KEY `idx_mate` (`mate`) USING BTREE,
  KEY `idx_syndicate_id` (`syndicate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_title`
--

DROP TABLE IF EXISTS `cq_user_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_title` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT '0',
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `title_id` int(4) unsigned NOT NULL DEFAULT '0',
  `status` int(4) unsigned NOT NULL DEFAULT '0',
  `del_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_viptranspoint`
--

DROP TABLE IF EXISTS `cq_viptranspoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_viptranspoint` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map_id` int(4) unsigned NOT NULL DEFAULT '0',
  `map_x` smallint(5) unsigned NOT NULL DEFAULT '0',
  `map_y` smallint(5) unsigned NOT NULL DEFAULT '0',
  `point_name` varchar(105) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_wanted`
--

DROP TABLE IF EXISTS `cq_wanted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_wanted` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `target_name` varchar(48) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_lev` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `target_pro` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000',
  `target_syn` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `payer` varchar(48) COLLATE utf8mb4_bin DEFAULT NULL,
  `bounty` int(4) unsigned zerofill DEFAULT NULL,
  `order_time` int(4) unsigned zerofill DEFAULT NULL,
  `hunter` varchar(48) COLLATE utf8mb4_bin DEFAULT NULL,
  `finish_time` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill`
--

DROP TABLE IF EXISTS `cq_weapon_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill` (
  `type` int(4) unsigned zerofill DEFAULT '0000',
  `level` tinyint(2) unsigned zerofill DEFAULT '00',
  `exp` int(4) unsigned zerofill DEFAULT '0000',
  `old_level` tinyint(2) unsigned zerofill DEFAULT '00',
  `owner_id` int(4) unsigned zerofill DEFAULT '0000',
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unlearn` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_ownerid_type` (`owner_id`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill_timeout`
--

DROP TABLE IF EXISTS `cq_weapon_skill_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill_timeout` (
  `type` int(4) unsigned zerofill DEFAULT '0000',
  `level` tinyint(2) unsigned zerofill DEFAULT '00',
  `exp` int(4) unsigned zerofill DEFAULT '0000',
  `old_level` tinyint(2) unsigned zerofill DEFAULT '00',
  `owner_id` int(4) unsigned zerofill DEFAULT '0000',
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `unlearn` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill_up`
--

DROP TABLE IF EXISTS `cq_weapon_skill_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill_up` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `weapontype` int(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `req_exp` int(4) unsigned NOT NULL DEFAULT '0',
  `req_uplevtime` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_orderby` (`weapontype`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_reset`
--

DROP TABLE IF EXISTS `daily_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `run_time` datetime NOT NULL,
  `ms` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dyna_rank_rec`
--

DROP TABLE IF EXISTS `dyna_rank_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dyna_rank_rec` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(4) unsigned NOT NULL DEFAULT '0',
  `value` bigint(4) NOT NULL DEFAULT '0',
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dyna_rank_type`
--

DROP TABLE IF EXISTS `dyna_rank_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dyna_rank_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(4) unsigned NOT NULL DEFAULT '0',
  `rank_num` smallint(2) unsigned NOT NULL DEFAULT '0',
  `rank_data_min` int(4) unsigned NOT NULL DEFAULT '0',
  `reset_time_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(60) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_money`
--

DROP TABLE IF EXISTS `e_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_money` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_source` int(4) unsigned NOT NULL DEFAULT '0',
  `id_target` int(4) unsigned NOT NULL DEFAULT '0',
  `number` int(4) unsigned NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `time_stamp` int(4) unsigned NOT NULL DEFAULT '0',
  `source_balance` int(4) unsigned NOT NULL DEFAULT '0',
  `target_balance` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_time_stamp` (`time_stamp`) USING BTREE,
  KEY `idx_id_source` (`id_source`) USING BTREE,
  KEY `idx_id_target` (`id_target`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_money_mono`
--

DROP TABLE IF EXISTS `e_money_mono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_money_mono` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_source` int(4) unsigned NOT NULL DEFAULT '0',
  `id_target` int(4) unsigned NOT NULL DEFAULT '0',
  `number` int(4) unsigned NOT NULL DEFAULT '0',
  `chk_sum` int(4) unsigned NOT NULL DEFAULT '0',
  `time_stamp` int(4) unsigned NOT NULL DEFAULT '0',
  `source_balance` int(4) unsigned NOT NULL DEFAULT '0',
  `target_balance` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_time_stamp` (`time_stamp`) USING BTREE,
  KEY `idx_id_source` (`id_source`) USING BTREE,
  KEY `idx_id_target` (`id_target`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `family_name` varchar(105) COLLATE utf8mb4_bin DEFAULT '0',
  `rank` tinyint(1) unsigned DEFAULT '0',
  `lead_id` int(4) unsigned NOT NULL DEFAULT '0',
  `annouce` varchar(765) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` bigint(4) unsigned DEFAULT '0',
  `repute` int(4) unsigned DEFAULT '0',
  `amount` tinyint(3) unsigned DEFAULT '0',
  `enemy_family_0_id` int(4) unsigned DEFAULT '0',
  `enemy_family_1_id` int(4) unsigned DEFAULT '0',
  `enemy_family_2_id` int(4) unsigned DEFAULT '0',
  `enemy_family_3_id` int(4) unsigned DEFAULT '0',
  `enemy_family_4_id` int(4) unsigned DEFAULT '0',
  `ally_family_0_id` int(4) unsigned DEFAULT '0',
  `ally_family_1_id` int(4) unsigned DEFAULT '0',
  `ally_family_2_id` int(4) unsigned DEFAULT '0',
  `ally_family_3_id` int(4) unsigned DEFAULT '0',
  `ally_family_4_id` int(4) unsigned DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_name` varchar(45) COLLATE utf8mb4_bin DEFAULT '0',
  `challenge_map` int(4) unsigned DEFAULT '0',
  `family_map` int(4) unsigned DEFAULT '0',
  `star_tower` tinyint(1) unsigned DEFAULT '0',
  `challenge` int(4) unsigned NOT NULL DEFAULT '0',
  `occupy` int(4) unsigned NOT NULL DEFAULT '0',
  `del_flag` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`family_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_attr`
--

DROP TABLE IF EXISTS `family_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_attr` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `family_id` int(4) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `proffer` int(4) unsigned NOT NULL DEFAULT '0',
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auto_exercise` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exp_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `family_id` (`family_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_battle_effect_share_limit`
--

DROP TABLE IF EXISTS `family_battle_effect_share_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_battle_effect_share_limit` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `share_limit` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flower`
--

DROP TABLE IF EXISTS `flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flower` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_r` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_w` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_lily` int(4) unsigned NOT NULL DEFAULT '0',
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_log`
--

DROP TABLE IF EXISTS `item_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_log` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `time` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `item_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `item_type` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `owner_id` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `event` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_rcd`
--

DROP TABLE IF EXISTS `login_rcd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_rcd` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(4) unsigned NOT NULL DEFAULT '0',
  `login_time` bigint(15) unsigned zerofill DEFAULT NULL,
  `online_second` int(4) unsigned NOT NULL DEFAULT '0',
  `mac_adr` varchar(36) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ip_adr` varchar(45) COLLATE utf8mb4_bin NOT NULL DEFAULT '""',
  `res_src` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_family`
--

DROP TABLE IF EXISTS `records_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_family` (
  `Identity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `FamilyIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(64) NOT NULL DEFAULT '',
  `LeaderIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `Count` int(10) unsigned NOT NULL DEFAULT '0',
  `Money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  `ChallengeMap` int(10) unsigned NOT NULL DEFAULT '0',
  `DominatedMap` int(10) unsigned NOT NULL DEFAULT '0',
  `Level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BpTower` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_guild_war`
--

DROP TABLE IF EXISTS `records_guild_war`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_guild_war` (
  `Identity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `SyndicateIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `LeaderIdentity` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_syndicate`
--

DROP TABLE IF EXISTS `records_syndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_syndicate` (
  `Id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `SyndicateIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(16) NOT NULL,
  `LeaderIdentity` int(4) unsigned NOT NULL DEFAULT '0',
  `Count` int(4) unsigned NOT NULL DEFAULT '0',
  `CreatedAt` datetime NOT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_user`
--

DROP TABLE IF EXISTS `records_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_user` (
  `Id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `UserIdentity` int(11) unsigned NOT NULL,
  `AccountIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(16) NOT NULL,
  `MateId` int(4) unsigned NOT NULL,
  `Level` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Experience` bigint(16) unsigned NOT NULL DEFAULT '0',
  `Profession` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `OldProfession` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NewProfession` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Strength` smallint(2) unsigned NOT NULL DEFAULT '0',
  `Agility` smallint(2) unsigned NOT NULL DEFAULT '0',
  `Vitality` smallint(2) unsigned NOT NULL DEFAULT '0',
  `Spirit` smallint(2) unsigned NOT NULL DEFAULT '0',
  `AdditionalPoints` smallint(2) unsigned NOT NULL DEFAULT '0',
  `SyndicateIdentity` int(4) unsigned NOT NULL DEFAULT '0',
  `SyndicatePosition` smallint(2) unsigned NOT NULL DEFAULT '0',
  `NobilityDonation` bigint(16) unsigned NOT NULL DEFAULT '0',
  `NobilityRank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SupermanCount` int(4) unsigned NOT NULL DEFAULT '0',
  `DeletedAt` datetime DEFAULT NULL,
  `Money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `WarehouseMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `ConquerPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `FamilyIdentity` int(10) unsigned NOT NULL DEFAULT '0',
  `FamilyRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `IdIdx` (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_detail`
--

DROP TABLE IF EXISTS `task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_detail` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `task_id` int(4) unsigned NOT NULL DEFAULT '0',
  `complete_flag` smallint(1) unsigned NOT NULL DEFAULT '0',
  `notify_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data1` int(4) NOT NULL DEFAULT '0',
  `data2` int(4) NOT NULL DEFAULT '0',
  `data3` int(4) NOT NULL DEFAULT '0',
  `data4` int(4) NOT NULL DEFAULT '0',
  `data5` int(4) NOT NULL DEFAULT '0',
  `data6` int(4) NOT NULL DEFAULT '0',
  `data7` int(4) NOT NULL DEFAULT '0',
  `task_overtime` int(4) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `max_accumulate_times` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=630 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_detail_timeout`
--

DROP TABLE IF EXISTS `task_detail_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_detail_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT '0',
  `task_id` int(4) unsigned NOT NULL DEFAULT '0',
  `complete_flag` smallint(1) unsigned NOT NULL DEFAULT '0',
  `notify_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data1` int(4) NOT NULL DEFAULT '0',
  `data2` int(4) NOT NULL DEFAULT '0',
  `data3` int(4) NOT NULL DEFAULT '0',
  `data4` int(4) NOT NULL DEFAULT '0',
  `data5` int(4) NOT NULL DEFAULT '0',
  `data6` int(4) NOT NULL DEFAULT '0',
  `data7` int(4) NOT NULL DEFAULT '0',
  `task_overtime` int(4) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `max_accumulate_times` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `winsyndicate`
--

DROP TABLE IF EXISTS `winsyndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winsyndicate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `SyndicateID` int(11) DEFAULT NULL,
  `SyndicateName` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `LeaderID` int(11) DEFAULT NULL,
  `LeaderName` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `MemberCount` int(11) DEFAULT NULL,
  `Fund` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `idx_leadername` (`LeaderName`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 17:22:41
