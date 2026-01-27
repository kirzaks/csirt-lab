-- Adminer 5.4.1 PostgreSQL 18.1 dump
-- DROP DATABASE IF EXISTS "rt6";
CREATE DATABASE "rt6";

\connect "rt6";

DROP TABLE IF EXISTS "acl";
DROP SEQUENCE IF EXISTS acl_id_seq;
CREATE SEQUENCE acl_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 175 CACHE 1;

CREATE TABLE "public"."acl" (
    "id" integer DEFAULT nextval('acl_id_seq') NOT NULL,
    "principaltype" character varying(25) NOT NULL,
    "principalid" integer NOT NULL,
    "rightname" character varying(25) NOT NULL,
    "objecttype" character varying(25) NOT NULL,
    "objectid" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "acl_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX acl1 ON public.acl USING btree (rightname, objecttype, objectid, principaltype, principalid);

INSERT INTO "acl" ("id", "principaltype", "principalid", "rightname", "objecttype", "objectid", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'Group',	2,	'SuperUser',	'RT::System',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(2,	'Group',	7,	'OwnTicket',	'RT::System',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(3,	'Group',	15,	'SuperUser',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(4,	'Group',	4,	'ShowApprovalsTab',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(5,	'Group',	4,	'ShowSearchAdvanced',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(6,	'Group',	4,	'ShowSearchBulkUpdate',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(7,	'Group',	4,	'SeeSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(8,	'Owner',	30,	'ModifyTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(9,	'Owner',	34,	'ModifyTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(10,	'Owner',	38,	'ModifyTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(11,	'Owner',	42,	'ModifyTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(12,	'Group',	27,	'CreateTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(13,	'Group',	27,	'ShowTemplate',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(14,	'Group',	27,	'OwnTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(15,	'Group',	27,	'CommentOnTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(16,	'Group',	27,	'SeeQueue',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(17,	'Group',	27,	'ShowTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(18,	'Group',	27,	'ShowTicketComments',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(19,	'Group',	27,	'StealTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(20,	'Group',	27,	'TakeTicket',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(21,	'Group',	27,	'Watch',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(22,	'Group',	27,	'ShowOutgoingEmail',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(23,	'Group',	27,	'ForwardMessage',	'RT::Queue',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(24,	'Group',	27,	'CreateTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(25,	'Group',	27,	'ShowTemplate',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(26,	'Group',	27,	'OwnTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(27,	'Group',	27,	'CommentOnTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(28,	'Group',	27,	'SeeQueue',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(29,	'Group',	27,	'ShowTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(30,	'Group',	27,	'ShowTicketComments',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(31,	'Group',	27,	'StealTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(32,	'Group',	27,	'TakeTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(33,	'Group',	27,	'Watch',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(34,	'Group',	27,	'ShowOutgoingEmail',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(35,	'Group',	27,	'ForwardMessage',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(36,	'Group',	27,	'CreateTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(37,	'Group',	27,	'ShowTemplate',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(38,	'Group',	27,	'OwnTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(39,	'Group',	27,	'CommentOnTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(40,	'Group',	27,	'SeeQueue',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(41,	'Group',	27,	'ShowTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(42,	'Group',	27,	'ShowTicketComments',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(43,	'Group',	27,	'StealTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(44,	'Group',	27,	'TakeTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(45,	'Group',	27,	'Watch',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(46,	'Group',	27,	'ShowOutgoingEmail',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(47,	'Group',	27,	'ForwardMessage',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(48,	'Group',	27,	'CreateTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(49,	'Group',	27,	'ShowTemplate',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(50,	'Group',	27,	'OwnTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(51,	'Group',	27,	'CommentOnTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(52,	'Group',	27,	'SeeQueue',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(53,	'Group',	27,	'ShowTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(54,	'Group',	27,	'ShowTicketComments',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(55,	'Group',	27,	'StealTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(56,	'Group',	27,	'TakeTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(57,	'Group',	27,	'Watch',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(58,	'Group',	27,	'ShowOutgoingEmail',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(59,	'Group',	27,	'ForwardMessage',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(60,	'Group',	3,	'ReplyToTicket',	'RT::Queue',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(61,	'Group',	3,	'CreateTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(62,	'Group',	3,	'ReplyToTicket',	'RT::Queue',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(63,	'Group',	3,	'ReplyToTicket',	'RT::Queue',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(64,	'Group',	27,	'ModifySelf',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(65,	'Group',	27,	'SeeOwnSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(66,	'Group',	27,	'AdminOwnSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(67,	'Group',	27,	'SeeGroupSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(68,	'Group',	27,	'AdminGroupSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(69,	'Group',	27,	'SeeOwnDashboard',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(70,	'Group',	27,	'AdminOwnDashboard',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(71,	'Group',	27,	'SeeGroupDashboard',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(72,	'Group',	27,	'AdminGroupDashboard',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(73,	'Group',	27,	'LoadSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(74,	'Group',	27,	'AdminSavedSearch',	'RT::System',	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(75,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(76,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(77,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(78,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(155,	'Group',	4,	'ModifySelf',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(79,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(80,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(81,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(82,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(83,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(84,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	6,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(85,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	7,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(86,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	7,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(87,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	8,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(88,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	8,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(89,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	9,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(90,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	9,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(91,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	10,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(92,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	10,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(93,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	11,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(94,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	11,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(95,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	12,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(96,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	12,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(97,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	13,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(98,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	13,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(99,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	14,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(100,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	14,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(101,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	15,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(102,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	15,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(103,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	16,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(104,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	16,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(105,	'Group',	27,	'SeeCustomField',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(106,	'Group',	27,	'SeeCustomField',	'RT::CustomField',	17,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(107,	'Group',	27,	'ModifyCustomField',	'RT::CustomField',	17,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(108,	'Group',	27,	'AdminClass',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(109,	'Group',	27,	'AdminTopics',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(110,	'Group',	27,	'CreateArticle',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(111,	'Group',	27,	'ModifyArticle',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(112,	'Group',	27,	'ModifyArticleTopics',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(113,	'Group',	27,	'SeeClass',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(114,	'Group',	27,	'ShowArticle',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(115,	'Group',	27,	'ShowArticleHistory',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(116,	'Group',	27,	'ShowArticlesMenu',	'RT::System',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(117,	'Group',	27,	'ShowArticle',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(118,	'Group',	27,	'SeeCustomField',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(119,	'Group',	27,	'AdminClass',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(120,	'Group',	27,	'AdminTopics',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(121,	'Group',	27,	'CreateArticle',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(122,	'Group',	27,	'ModifyArticle',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(123,	'Group',	27,	'ModifyArticleTopics',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(124,	'Group',	27,	'SeeClass',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(125,	'Group',	27,	'ShowArticleHistory',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(126,	'Group',	4,	'SetInitialCustomField',	'RT::System',	1,	14,	'2026-01-18 17:29:45',	14,	'2026-01-18 17:29:45'),
(127,	'Group',	4,	'ShowTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(128,	'Group',	4,	'StealTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(129,	'Group',	4,	'ReassignTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(130,	'Group',	4,	'DeleteTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(131,	'Group',	4,	'Watch',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(132,	'Group',	4,	'SeeQueue',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(133,	'Group',	4,	'ModifyArticleTopics',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(134,	'Group',	4,	'CommentOnTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(135,	'Group',	4,	'ModifyOwnMembership',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(136,	'Group',	4,	'ModifyAsset',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(137,	'Group',	4,	'ManageAuthTokens',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(138,	'Group',	4,	'ShowArticle',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(139,	'Group',	4,	'ModifyTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(140,	'Group',	4,	'SeeDashboard',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(141,	'Group',	4,	'SeeGroupDashboard',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(142,	'Group',	4,	'CreateArticle',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(143,	'Group',	4,	'ShowArticleHistory',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(144,	'Group',	4,	'SeeClass',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(145,	'Group',	4,	'ModifyGroupLinks',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(146,	'Group',	4,	'AdminOwnDashboard',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(147,	'Group',	4,	'AdminOwnSavedSearch',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(148,	'Group',	4,	'ShowArticlesMenu',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(149,	'Group',	4,	'SeeGroupSavedSearch',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(150,	'Group',	4,	'ShowAssetsMenu',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(151,	'Group',	4,	'OwnTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(152,	'Group',	4,	'ReplyToTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(153,	'Group',	4,	'CreateTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(154,	'Group',	4,	'ModifyArticle',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(156,	'Group',	4,	'ForwardMessage',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(157,	'Group',	4,	'SeeOwnDashboard',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(158,	'Group',	4,	'DisableArticle',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(159,	'Group',	4,	'SubscribeDashboard',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(160,	'Group',	4,	'ShowGlobalTemplates',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(161,	'Group',	4,	'CreateAsset',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(162,	'Group',	4,	'ShowAsset',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(163,	'Group',	4,	'ShowOutgoingEmail',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(164,	'Group',	4,	'SeeOwnSavedSearch',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(165,	'Group',	4,	'ShowUserHistory',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(166,	'Group',	4,	'LoadSavedSearch',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(167,	'Group',	4,	'ShowTicketComments',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(168,	'Group',	4,	'SeeGroup',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(169,	'Group',	4,	'ShowCatalog',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(170,	'Group',	4,	'SeeSelfServiceGroupTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(171,	'Group',	4,	'WatchAsAdminCc',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(172,	'Group',	4,	'TakeTicket',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(173,	'Group',	4,	'SeeCustomField',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46'),
(174,	'Group',	4,	'ModifyCustomField',	'RT::System',	1,	14,	'2026-01-18 17:29:46',	14,	'2026-01-18 17:29:46');

DROP TABLE IF EXISTS "articles";
DROP SEQUENCE IF EXISTS articles_id_seq;
CREATE SEQUENCE articles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 7 CACHE 1;

CREATE TABLE "public"."articles" (
    "id" integer DEFAULT nextval('articles_id_seq') NOT NULL,
    "name" character varying(255) DEFAULT '' NOT NULL,
    "summary" character varying(255) DEFAULT '' NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "class" integer DEFAULT '0' NOT NULL,
    "parent" integer DEFAULT '0' NOT NULL,
    "uri" character varying(255),
    "disabled" smallint DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "articles_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "articles" ("id", "name", "summary", "sortorder", "class", "parent", "uri", "disabled", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'Spam Process',	'This is the summary of the process for handling spam',	0,	3,	0,	'fsck.com-article://my.local/article/1',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38'),
(2,	'System Compromise Process',	'This is the summary of the process for handling system compromise',	0,	3,	0,	'fsck.com-article://my.local/article/2',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38'),
(3,	'Query Process',	'This is the summary of the process for handling queries',	0,	3,	0,	'fsck.com-article://my.local/article/3',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38'),
(4,	'Scan Process',	'This is the summary of the process for handling scans',	0,	3,	0,	'fsck.com-article://my.local/article/4',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38'),
(5,	'Denial of Service Process',	'This is the summary of the process for handling denial of service',	0,	3,	0,	'fsck.com-article://my.local/article/5',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38'),
(6,	'Piracy Process',	'This is the summary of the process for handling piracy',	0,	3,	0,	'fsck.com-article://my.local/article/6',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:38');

DROP TABLE IF EXISTS "assets";
DROP SEQUENCE IF EXISTS assets_id_seq;
CREATE SEQUENCE assets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."assets" (
    "id" integer DEFAULT nextval('assets_id_seq') NOT NULL,
    "name" character varying(255) DEFAULT '' NOT NULL,
    "catalog" integer DEFAULT '0' NOT NULL,
    "status" character varying(64) DEFAULT '' NOT NULL,
    "description" character varying(255) DEFAULT '' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "assets_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX assetsname ON public.assets USING btree (lower((name)::text));

CREATE INDEX assetsstatus ON public.assets USING btree (status);

CREATE INDEX assetscatalog ON public.assets USING btree (catalog);


DROP TABLE IF EXISTS "attachments";
DROP SEQUENCE IF EXISTS attachments_id_seq;
CREATE SEQUENCE attachments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."attachments" (
    "id" bigint DEFAULT nextval('attachments_id_seq') NOT NULL,
    "transactionid" bigint NOT NULL,
    "parent" bigint DEFAULT '0' NOT NULL,
    "messageid" character varying(160),
    "subject" character varying(255),
    "filename" character varying(255),
    "contenttype" character varying(80),
    "contentencoding" character varying(80),
    "content" text,
    "headers" text,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    CONSTRAINT "attachments_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX attachments1 ON public.attachments USING btree (parent);

CREATE INDEX attachments2 ON public.attachments USING btree (transactionid);

CREATE INDEX attachments3 ON public.attachments USING btree (parent, transactionid);

CREATE INDEX attachments4 ON public.attachments USING btree (filename);


DROP TABLE IF EXISTS "attributes";
DROP SEQUENCE IF EXISTS attributes_id_seq;
CREATE SEQUENCE attributes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 20 CACHE 1;

CREATE TABLE "public"."attributes" (
    "id" integer DEFAULT nextval('attributes_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" character varying(255),
    "content" text,
    "contenttype" character varying(16),
    "objecttype" character varying(64),
    "objectid" integer,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "attributes_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX attributes1 ON public.attributes USING btree (name);

CREATE INDEX attributes2 ON public.attributes USING btree (objecttype, objectid);

INSERT INTO "attributes" ("id", "name", "description", "content", "contenttype", "objecttype", "objectid", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(4,	'ReportsInMenu',	'Content of the Reports menu',	'BQsCAAAABQQDAAAAAwoPcmVzb2x2ZWRieW93bmVyAAAAAmlkCh0vUmVwb3J0cy9SZXNvbHZlZEJ5
T3duZXIuaHRtbAAAAARwYXRoChFSZXNvbHZlZCBieSBvd25lcgAAAAV0aXRsZQQDAAAAAwoTcmVz
b2x2ZWRpbmRhdGVyYW5nZQAAAAJpZAodL1JlcG9ydHMvUmVzb2x2ZWRCeURhdGVzLmh0bWwAAAAE
cGF0aAoWUmVzb2x2ZWQgaW4gZGF0ZSByYW5nZQAAAAV0aXRsZQQDAAAAAwoSY3JlYXRlZGluZGF0
ZXJhbmdlAAAAAmlkChwvUmVwb3J0cy9DcmVhdGVkQnlEYXRlcy5odG1sAAAABHBhdGgKF0NyZWF0
ZWQgaW4gYSBkYXRlIHJhbmdlAAAABXRpdGxlBAMAAAADCgl1c2VyX3RpbWUAAAACaWQKHi9SZXBv
cnRzL1RpbWVXb3JrZWRSZXBvcnQuaHRtbAAAAARwYXRoChBVc2VyIHRpbWUgd29ya2VkAAAABXRp
dGxlBAMAAAADChd0aW1lX3dvcmtlZF9mcm9tX3NlYXJjaAAAAAJpZAoYL1JlcG9ydHMvVGltZVNl
YXJjaC5odG1sAAAABHBhdGgKF1RpbWUgd29ya2VkIGZyb20gc2VhcmNoAAAABXRpdGxl
',	'storable',	'RT::System',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(5,	'DefaultDashboard',	'Default Dashboard',	'1',	'',	'RT::System',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(6,	'Skip-EscapeHTML',	NULL,	'1',	'',	'RT::Class',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(7,	'LinkValueTo',	NULL,	'https://nvd.nist.gov/vuln/detail/__CustomField__#vulnCurrentDescriptionTitle',	'',	'RT::CustomField',	7,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(8,	'LinkValueTo',	NULL,	'__WebPath__/RTIR/Tools/Lookup.html?type=ip&q=__CustomField__&ticket=__id__',	'',	'RT::CustomField',	10,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(9,	'LinkValueTo',	NULL,	'__WebPath__/RTIR/Tools/Lookup.html?type=host&q=__CustomField__&ticket=__id__',	'',	'RT::CustomField',	16,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(10,	'Skip-Name',	NULL,	'1',	'',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(11,	'Skip-Summary',	NULL,	'1',	'',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(12,	'Skip-CF-Title-17',	NULL,	'1',	'',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(13,	'Skip-CF-Title-1',	NULL,	'1',	'',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(14,	'Skip-CF-Value-1',	NULL,	'1',	'',	'RT::Class',	2,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(15,	'RTIRDefaultDashboard',	'RTIR Default Dashboard',	'2',	'',	'RT::System',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(16,	'Skip-Name',	NULL,	'1',	'',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(17,	'Skip-Summary',	NULL,	'1',	'',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(18,	'Skip-LinkToTicket',	NULL,	'1',	'',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(19,	'Skip-CF-Title-1',	NULL,	'1',	'',	'RT::Class',	3,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(1,	'UpgradeHistory',	NULL,	'BQsDAAAAAgQCAAAAAgQDAAAACAoGaW5zZXJ0AAAABmFjdGlvbgEAAKzwIyBJbml0aWFsIGRhdGEg
Zm9yIGEgZnJlc2ggUlQgaW5zdGFsbGF0aW9uLgoKQFVzZXJzID0gKAogICAgeyAgTmFtZSAgICAg
ICAgICAgICA9PiAncm9vdCcsCiAgICAgICBHZWNvcyAgICAgICAgICAgID0+ICdyb290JywKICAg
ICAgIFJlYWxOYW1lICAgICAgICAgPT4gJ0Vub2NoIFJvb3QnLAogICAgICAgUGFzc3dvcmQgICAg
ICAgICA9PiAncGFzc3dvcmQnLAogICAgICAgRW1haWxBZGRyZXNzICAgICA9PiAicm9vdFxAbG9j
YWxob3N0IiwKICAgICAgIENvbW1lbnRzICAgICAgICAgPT4gJ1N1cGVyVXNlcicsCiAgICAgICBQ
cml2aWxlZ2VkICAgICAgID0+ICcxJywKICAgICAgIFNraXBDYW5vbmljYWxpemUgPT4gJzEnLAog
ICAgfSwKKTsKCkBHcm91cHMgPSAoCik7CgpAUXVldWVzID0gKHsgTmFtZSAgICAgICAgICAgICAg
PT4gJ0dlbmVyYWwnLAogICAgICAgICAgICAgRGVzY3JpcHRpb24gICAgICAgPT4gJ1RoZSBkZWZh
dWx0IHF1ZXVlJywKICAgICAgICAgICAgIENvcnJlc3BvbmRBZGRyZXNzID0+ICIiLAogICAgICAg
ICAgICAgQ29tbWVudEFkZHJlc3MgICAgPT4gIiIsIH0sCiAgICAgICAgICAgeyBOYW1lICAgICAg
ICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgICAgICAgIExpZmVjeWNsZSAgID0+ICdhcHByb3Zh
bHMnLAogICAgICAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0Egc3lzdGVtLWludGVybmFsIHF1ZXVl
IGZvciB0aGUgYXBwcm92YWxzIHN5c3RlbScsCiAgICAgICAgICAgICBEaXNhYmxlZCAgICA9PiAy
LCB9ICk7CgpAQ2F0YWxvZ3MgPSAoewogICAgTmFtZSAgICAgICAgPT4gIkdlbmVyYWwgYXNzZXRz
IiwgICAgICAjIGxvYwogICAgRGVzY3JpcHRpb24gPT4gIlRoZSBkZWZhdWx0IGNhdGFsb2ciLCAj
IGxvYwp9KTsKCkBTY3JpcEFjdGlvbnMgPSAoCgogICAgeyAgTmFtZSAgICAgICAgPT4gJ0F1dG9y
ZXBseSBUbyBSZXF1ZXN0b3JzJywgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+CidBbHdh
eXMgc2VuZHMgYSBtZXNzYWdlIHRvIHRoZSByZXF1ZXN0b3JzIGluZGVwZW5kZW50IG9mIG1lc3Nh
Z2Ugc2VuZGVyJyAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj
IGxvYwogICAgICAgRXhlY01vZHVsZSA9PiAnQXV0b3JlcGx5JywKICAgICAgIEFyZ3VtZW50ICAg
PT4gJ1JlcXVlc3RvcicgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3Jz
JywgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBh
IG1lc3NhZ2UgdG8gdGhlIHJlcXVlc3RvcnMnLCAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9
PiAnTm90aWZ5JywKICAgICAgQXJndW1lbnQgICAgPT4gJ1JlcXVlc3RvcicgfSwKICAgIHsgTmFt
ZSAgICAgICAgPT4gJ05vdGlmeSBPd25lciBhcyBDb21tZW50JywgICAgICAgICAgICAgICMgbG9j
CiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBtYWlsIHRvIHRoZSBvd25lcicsICAgICAgICAg
ICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAg
QXJndW1lbnQgICAgPT4gJ093bmVyJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93
bmVyJywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4g
J1NlbmRzIG1haWwgdG8gdGhlIG93bmVyJywgICAgICAgICAgICAgICMgbG9jCiAgICAgIEV4ZWNN
b2R1bGUgID0+ICdOb3RpZnknLAogICAgICBBcmd1bWVudCAgICA9PiAnT3duZXInIH0sCiAgICB7
IE5hbWUgICAgICAgID0+ICdOb3RpZnkgQ2NzIGFzIENvbW1lbnQnLCAgICAgICAgICAgICAgIyBs
b2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmRzIG1haWwgdG8gdGhlIENjcyBhcyBhIGNvbW1l
bnQnLCAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAg
QXJndW1lbnQgICAgPT4gJ0NjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IENjcycs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlv
biA9PiAnU2VuZHMgbWFpbCB0byB0aGUgQ2NzJywgICAgICAgICAgICAgICAgICAgICAgICAjIGxv
YwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5JywKICAgICAgQXJndW1lbnQgICAgPT4gJ0Nj
JyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IEFkbWluQ2NzIGFzIENvbW1lbnQnLCAg
ICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBt
YWlsIHRvIHRoZSBhZG1pbmlzdHJhdGl2ZSBDY3MgYXMgYSBjb21tZW50JywgIyBsb2MKICAgICAg
RXhlY01vZHVsZSAgPT4gJ05vdGlmeUFzQ29tbWVudCcsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdB
ZG1pbkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IEFkbWluQ2NzJywgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdT
ZW5kcyBtYWlsIHRvIHRoZSBhZG1pbmlzdHJhdGl2ZSBDY3MnLCAgICAgICAgICAgICAgIyBsb2MK
ICAgICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdBZG1p
bkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVyIGFuZCBBZG1pbkNjcycs
ICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5k
cyBtYWlsIHRvIHRoZSBPd25lciBhbmQgYWRtaW5pc3RyYXRpdmUgQ2NzJywgICAgIyBsb2MKICAg
ICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdPd25lcixB
ZG1pbkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVyIG9yIEFkbWluQ2Nz
JywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1Nl
bmRzIG1haWwgdG8gdGhlIE93bmVyIGlmIHNldCwgb3RoZXJ3aXNlIGFkbWluaXN0cmF0aXZlIENj
cycsICAgICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgID0+ICdOb3RpZnlPd25lck9yQWRtaW5DYycs
CiAgICB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IFJlcXVlc3RvcnMgYW5kIENjcyBh
cyBDb21tZW50JywgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5k
IG1haWwgdG8gcmVxdWVzdG9ycyBhbmQgQ2NzIGFzIGEgY29tbWVudCcsICAgICAgIyBsb2MKICAg
ICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeUFzQ29tbWVudCcsCiAgICAgIEFyZ3VtZW50ICAgID0+
ICdSZXF1ZXN0b3IsQ2MnIH0sCgogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IFJlcXVlc3Rv
cnMgYW5kIENjcycsICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0
aW9uID0+ICdTZW5kIG1haWwgdG8gcmVxdWVzdG9ycyBhbmQgQ2NzJywgICAgICAgICAgICAgICAg
ICAgIyBsb2MKICAgICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAg
ID0+ICdSZXF1ZXN0b3IsQ2MnIH0sCgogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVy
LCBSZXF1ZXN0b3JzLCBDY3MgYW5kIEFkbWluQ2NzIGFzIENvbW1lbnQnLCAgICAjIGxvYwogICAg
ICBEZXNjcmlwdGlvbiA9PiAnU2VuZCBtYWlsIHRvIG93bmVyIGFuZCBhbGwgd2F0Y2hlcnMgYXMg
YSAiY29tbWVudCInLCAgICAgICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5
QXNDb21tZW50JywKICAgICAgQXJndW1lbnQgICAgPT4gJ0FsbCcgfSwKICAgIHsgTmFtZSAgICAg
ICAgPT4gJ05vdGlmeSBPd25lciwgUmVxdWVzdG9ycywgQ2NzIGFuZCBBZG1pbkNjcycsICAgICAg
ICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmQgbWFpbCB0byBvd25lciBh
bmQgYWxsIHdhdGNoZXJzJywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRXhl
Y01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdBbGwnIH0sCiAgICB7
IE5hbWUgICAgICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cyBhcyBDb21tZW50JywgICAg
ICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmRzIG1haWwgdG8gZXhw
bGljaXRseSBsaXN0ZWQgQ2NzIGFuZCBCY2NzJywgICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxl
ICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAgQXJndW1lbnQgICAgPT4gJ090aGVyUmVjaXBp
ZW50cycgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ05vdGlmeSBPdGhlciBSZWNpcGllbnRzJywg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnU2Vu
ZHMgbWFpbCB0byBleHBsaWNpdGx5IGxpc3RlZCBDY3MgYW5kIEJjY3MnLCAgICAgICMgbG9jCiAg
ICAgIEV4ZWNNb2R1bGUgID0+ICdOb3RpZnknLAogICAgICBBcmd1bWVudCAgICA9PiAnT3RoZXJS
ZWNpcGllbnRzJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+
ICdQZXJmb3JtIGEgdXNlci1kZWZpbmVkIGFjdGlvbicsICAgICAgICAgICAgICAgICAgICAgIyBs
b2MKICAgICAgRXhlY01vZHVsZSAgPT4gJ1VzZXJEZWZpbmVkJywgfSwKICAgIHsgIE5hbWUgICAg
ICAgID0+ICdDcmVhdGUgVGlja2V0cycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+CiAgICAgICAgICdDcmVhdGUgbmV3IHRpY2tl
dHMgYmFzZWQgb24gdGhpcyBzY3JpcFwncyB0ZW1wbGF0ZScsICAgICAgICAgICAgICMgbG9jCiAg
ICAgICBFeGVjTW9kdWxlID0+ICdDcmVhdGVUaWNrZXRzJywgfSwKICAgIHsgTmFtZSAgICAgICAg
PT4gJ09wZW4gVGlja2V0cycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj
IGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnT3BlbiB0aWNrZXRzIG9uIGNvcnJlc3BvbmRlbmNl
JywgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgID0+ICdBdXRvT3Bl
bicgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ09wZW4gSW5hY3RpdmUgVGlja2V0cycsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnT3BlbiBp
bmFjdGl2ZSB0aWNrZXRzJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAg
IEV4ZWNNb2R1bGUgID0+ICdBdXRvT3BlbkluYWN0aXZlJyB9LAogICAgeyBOYW1lICAgICAgICA9
PiAnRXh0cmFjdCBTdWJqZWN0IFRhZycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMg
bG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdFeHRyYWN0IHRhZ3MgZnJvbSBhIFRyYW5zYWN0aW9u
XCdzIHN1YmplY3QgYW5kIGFkZCB0aGVtIHRvIHRoZSBUaWNrZXRcJ3Mgc3ViamVjdC4nLCAjIGxv
YwogICAgICBFeGVjTW9kdWxlICA9PiAnRXh0cmFjdFN1YmplY3RUYWcnIH0sCiAgICB7IE5hbWUg
ICAgICAgID0+ICdTZW5kIEZvcndhcmQnLCAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVz
Y3JpcHRpb24gPT4gJ1NlbmQgZm9yd2FyZGVkIG1lc3NhZ2UnLCAgICAgICAjIGxvYwogICAgICBF
eGVjTW9kdWxlICA9PiAnU2VuZEZvcndhcmQnLCB9LAogICAgeyAgTmFtZSAgICAgICAgPT4gJ1Nl
dCBzdGFydHMgZGF0ZSBhY2NvcmRpbmcgdG8gU0xBJywgIyBsb2MKICAgICAgIERlc2NyaXB0aW9u
ID0+ICdTZXQgdGhlIHN0YXJ0cyBkYXRlIGFjY29yZGluZyB0byBhbiBhZ3JlZW1lbnQnICwgIyBs
b2MKICAgICAgIEV4ZWNNb2R1bGUgID0+ICdTTEFfU2V0U3RhcnRzJywKICAgIH0sCiAgICB7ICBO
YW1lICAgICAgICA9PiAnU2V0IGR1ZSBkYXRlIGFjY29yZGluZyB0byBTTEEnLCAjIGxvYwogICAg
ICAgRGVzY3JpcHRpb24gPT4gJ1NldCB0aGUgZHVlIGRhdGUgYWNjb3JkaW5nIHRvIGFuIGFncmVl
bWVudCcgLCAjIGxvYwogICAgICAgRXhlY01vZHVsZSAgPT4gJ1NMQV9TZXREdWUnLAogICAgfSwK
ICAgIHsKICAgICAgTmFtZSA9PiAnQ2xlYXIgQ3VzdG9tIEZpZWxkIFZhbHVlIFRlbXBsYXRlJywg
IyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1RlbXBsYXRlIGFjdGlvbiBmb3IgY2xlYXJpbmcg
YSBjdXN0b20gZmllbGQuIFVzZSAiQ29weSBBY3Rpb24iIHRvIGNyZWF0ZSBhbiBhY3Rpb24gZm9y
IHMgc3BlY2lmaWMgY3VzdG9tIGZpZWxkLicsICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgPT4gJ0Ns
ZWFyQ3VzdG9tRmllbGRWYWx1ZXMnLAogICAgICBBcmd1bWVudCA9PiAnWW91ciBDdXN0b20gRmll
bGQgTmFtZSBPciBJZCcKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgPT4gJ1VzZXIg
RGVmaW5lZCcsICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9
PiAnUGVyZm9ybSBhIHVzZXItZGVmaW5lZCBhY3Rpb24nLCAgICAjIGxvYwogICAgICAgIEV4ZWNN
b2R1bGUgID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgTG9va3VwVHlwZSAgPT4gJ1JUOjpDYXRh
bG9nLVJUOjpBc3NldCcsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgICAgICAgID0+ICdVc2Vy
IERlZmluZWQnLCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24g
PT4gJ1BlcmZvcm0gYSB1c2VyLWRlZmluZWQgYWN0aW9uJywgICAgIyBsb2MKICAgICAgICBFeGVj
TW9kdWxlICA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIExvb2t1cFR5cGUgID0+ICdSVDo6Q2xh
c3MtUlQ6OkFydGljbGUnLAogICAgfSwKKTsKCkBTY3JpcENvbmRpdGlvbnMgPSAoCiAgICB7IE5h
bWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUnLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYSB0aWNr
ZXQgaXMgY3JlYXRlZCcsICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxlVHJh
bnNUeXBlcyA9PiAnQ3JlYXRlJywKICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRy
YW5zYWN0aW9uJywgfSwKCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ09u
IENyZWF0ZSBWaWEgRW1haWwnLAogICAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVu
IGEgdGlja2V0IGlzIGNyZWF0ZWQgdmlhIEVtYWlsJywKICAgICAgICBBcHBsaWNhYmxlVHJhbnNU
eXBlcyA9PiAnQ3JlYXRlJywKICAgICAgICBBcmd1bWVudCAgICAgICAgICAgICA9PiAnRW1haWwn
LAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdWaWFJbnRlcmZhY2UnLCB9LAogICAg
ewogICAgICAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUgVmlhIFdlYicsCiAg
ICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYSB0aWNrZXQgaXMgY3JlYXRlZCB2
aWEgV2ViJywKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ3JlYXRlJywKICAgICAg
ICBBcmd1bWVudCAgICAgICAgICAgICA9PiAnV2ViLE1vYmlsZScsCiAgICAgICAgRXhlY01vZHVs
ZSAgICAgICAgICAgPT4gJ1ZpYUludGVyZmFjZScsIH0sCgogICAgeyBOYW1lICAgICAgICAgICAg
ICAgICA9PiAnT24gVHJhbnNhY3Rpb24nLCAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9j
CiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuIGFueXRoaW5nIGhhcHBlbnMnLCAg
ICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0Fu
eScsCiAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsIH0sCiAg
ICB7CgogICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gQ29ycmVzcG9uZCcsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9
PiAnV2hlbmV2ZXIgY29ycmVzcG9uZGVuY2UgY29tZXMgaW4nLCAgICAgICAgICAjIGxvYwogICAg
ICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVzcG9uZCcsCiAgICAgIEV4ZWNNb2R1bGUg
ICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsIH0sCgogICAgewoKICAgICAgTmFtZSAgICAg
ICAgICAgICAgICAgPT4gJ09uIEZvcndhcmQnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW5ldmVyIGEgdGlja2V0
IG9yIHRyYW5zYWN0aW9uIGlzIGZvcndhcmRlZCcsICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFu
c1R5cGVzID0+ICdGb3J3YXJkIFRyYW5zYWN0aW9uLEZvcndhcmQgVGlja2V0JywKICAgICAgRXhl
Y01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRyYW5zYWN0aW9uJywgfSwKCiAgICB7CgogICAgICBO
YW1lICAgICAgICAgICAgICAgICA9PiAnT24gRm9yd2FyZCBUaWNrZXQnLCAgICAgICAgICAgICAg
ICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIg
YSB0aWNrZXQgaXMgZm9yd2FyZGVkJywgICAgICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxl
VHJhbnNUeXBlcyA9PiAnRm9yd2FyZCBUaWNrZXQnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAg
ICA9PiAnQW55VHJhbnNhY3Rpb24nLCB9LAoKICAgIHsKCiAgICAgIE5hbWUgICAgICAgICAgICAg
ICAgID0+ICdPbiBGb3J3YXJkIFRyYW5zYWN0aW9uJywgICAgICAgICAgICAgICAgICAgICMgbG9j
CiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRyYW5zYWN0aW9uIGlz
IGZvcndhcmRlZCcsICAgICAgICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdG
b3J3YXJkIFRyYW5zYWN0aW9uJywKICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRy
YW5zYWN0aW9uJywgfSwKCiAgICB7CgogICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24g
Q29tbWVudCcsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNj
cmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgY29tbWVudHMgY29tZSBpbicsICAgICAgICAg
ICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29tbWVudCcsCiAg
ICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicgfSwKICAgIHsKCiAg
ICAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBTdGF0dXMgQ2hhbmdlJywgICAgICAgICAg
ICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVu
ZXZlciBhIHRpY2tldFwncyBzdGF0dXMgY2hhbmdlcycsICAgICAgICMgbG9jCiAgICAgIEFwcGxp
Y2FibGVUcmFuc1R5cGVzID0+ICdTdGF0dXMnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9
PiAnQW55VHJhbnNhY3Rpb24nLAoKICAgIH0sCiAgICB7CgogICAgICBOYW1lICAgICAgICAgICAg
ICAgICA9PiAnT24gUHJpb3JpdHkgQ2hhbmdlJywgICAgICAgICAgICAgICAgICAgICAgICMgbG9j
CiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRpY2tldFwncyBwcmlv
cml0eSBjaGFuZ2VzJywgICAgIyBsb2MKICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ1Nl
dCcsCiAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdQcmlvcml0eUNoYW5nZScsCiAgICB9
LAogICAgewoKICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ09uIE93bmVyIENoYW5nZScs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAg
ICAgPT4gJ1doZW5ldmVyIGEgdGlja2V0XCdzIG93bmVyIGNoYW5nZXMnLCAgICAgICAgIyBsb2MK
ICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0FueScsCiAgICAgIEV4ZWNNb2R1bGUgICAg
ICAgICAgID0+ICdPd25lckNoYW5nZScsCgogICAgfSwKICAgIHsKCiAgICAgIE5hbWUgICAgICAg
ICAgICAgICAgID0+ICdPbiBRdWV1ZSBDaGFuZ2UnLCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICMgbG9jCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRpY2tldFwn
cyBxdWV1ZSBjaGFuZ2VzJywgICAgICAgICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVz
ID0+ICdTZXQnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnUXVldWVDaGFuZ2UnLAoK
ICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gUmVzb2x2ZScsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAg
ICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVzb2x2ZWQnLCAgICAgICAgICAgICMgbG9jCiAg
ICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnU3RhdHVzJywKICAgICAgIEV4ZWNNb2R1bGUg
ICAgICAgICAgID0+ICdTdGF0dXNDaGFuZ2UnLAogICAgICAgQXJndW1lbnQgICAgICAgICAgICAg
PT4gJ3Jlc29sdmVkJwoKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24g
UmVqZWN0JywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNj
cmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVqZWN0ZWQnLCAgICAg
ICAgICAgICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnU3RhdHVzJywKICAg
ICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdTdGF0dXNDaGFuZ2UnLAogICAgICAgQXJndW1l
bnQgICAgICAgICAgICAgPT4gJ3JlamVjdGVkJwoKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAg
ICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMg
bG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB1c2VyLWRlZmlu
ZWQgY29uZGl0aW9uIG9jY3VycycsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9
PiAnQW55JywKICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdVc2VyRGVmaW5lZCcKCiAg
ICB9LAoKICAgIHsgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDbG9zZScsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uICAgICAgICAg
ID0+ICdXaGVuZXZlciBhIHRpY2tldCBpcyBjbG9zZWQnLCAjIGxvYwogICAgICAgQXBwbGljYWJs
ZVRyYW5zVHlwZXMgPT4gJ1N0YXR1cyxTZXQnLAogICAgICAgRXhlY01vZHVsZSAgICAgICAgICAg
PT4gJ0Nsb3NlVGlja2V0JywKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAn
T24gUmVvcGVuJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBE
ZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVvcGVuZWQnLCAj
IGxvYwogICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ1N0YXR1cyxTZXQnLAogICAgICAg
RXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1Jlb3BlblRpY2tldCcsCiAgICB9LAogICAgeyAgTmFt
ZSAgICAgICAgPT4gJ1JlcXVpcmUgU3RhcnRzIHNldCBhY2NvcmRpbmcgdG8gU0xBJywgIyBsb2MK
ICAgICAgIERlc2NyaXB0aW9uID0+ICdEZXRlY3QgYSBzaXR1YXRpb24gd2hlbiB3ZSBzaG91bGQg
c2V0IFN0YXJ0cyBkYXRlJyAsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAn
Q3JlYXRlLFNldCcsCiAgICAgICBFeGVjTW9kdWxlID0+ICdTTEFfUmVxdWlyZVN0YXJ0c1NldCcs
CiAgICB9LAogICAgeyAgTmFtZSAgICAgICAgPT4gJ1JlcXVpcmUgRHVlIHNldCBhY2NvcmRpbmcg
dG8gU0xBJywgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdEZXRlY3QgYSBzaXR1YXRpb24g
d2hlbiB3ZSBzaG91bGQgc2V0IER1ZSBkYXRlJyAsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJh
bnNUeXBlcyA9PiAnQ3JlYXRlLENvcnJlc3BvbmQsU2V0LFN0YXR1cycsCiAgICAgICBFeGVjTW9k
dWxlID0+ICdTTEFfUmVxdWlyZUR1ZVNldCcsCiAgICB9LAogICAgewogICAgICAgTmFtZSAgICAg
ICAgICAgICAgICAgPT4gJ09uIFRpbWVXb3JrZWQgQ2hhbmdlJywgICAgICAgICAgICAgICAgICAg
ICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbiBUaW1lV29ya2VkIENo
YW5nZScsICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVz
ID0+ICdBbnknLAogICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1RpbWVXb3JrZWRDaGFu
Z2UnLAogICAgfSwKCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ1VzZXIg
RGVmaW5lZCcsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERl
c2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHVzZXItZGVmaW5lZCBjb25kaXRpb24g
b2NjdXJzJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55JywK
ICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIExv
b2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAogICAgfSwKICAg
IHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gVHJhbnNhY3Rpb24nLCAgICAg
ICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbiBhbnl0aGlu
ZyBoYXBwZW5zJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55
JywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJhbnNhY3Rpb24nLAogICAg
ICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAogICAg
fSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gQ3JlYXRlJywgICAg
ICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hl
biBhbiBhc3NldCBpcyBjcmVhdGVkJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNU
eXBlcyA9PiAnQ3JlYXRlJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJh
bnNhY3Rpb24nLAogICAgICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1S
VDo6QXNzZXQnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAn
T24gU3RhdHVzIENoYW5nZScsICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVz
Y3JpcHRpb24gICAgICAgICAgPT4gIldoZW5ldmVyIGFuIGFzc2V0J3Mgc3RhdHVzIGNoYW5nZXMi
LCAgICAjIGxvYwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdTdGF0dXMnLAogICAg
ICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsCiAgICAgICAgTG9v
a3VwVHlwZSAgICAgICAgICAgPT4gJ1JUOjpDYXRhbG9nLVJUOjpBc3NldCcsCiAgICB9LAoKICAg
IHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAg
ICAgPT4gJ1doZW5ldmVyIGEgdXNlci1kZWZpbmVkIGNvbmRpdGlvbiBvY2N1cnMnLCAgICAjIGxv
YwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNNb2R1
bGUgICAgICAgICAgID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgTG9va3VwVHlwZSAgICAgICAg
ICAgPT4gJ1JUOjpDbGFzcy1SVDo6QXJ0aWNsZScsCiAgICB9LAogICAgewogICAgICAgIE5hbWUg
ICAgICAgICAgICAgICAgID0+ICdPbiBUcmFuc2FjdGlvbicsICAgICAgICAgICAjIGxvYwogICAg
ICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuIGFueXRoaW5nIGhhcHBlbnMnLCAgICAj
IGxvYwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNN
b2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsCiAgICAgICAgTG9va3VwVHlwZSAg
ICAgICAgICAgPT4gJ1JUOjpDbGFzcy1SVDo6QXJ0aWNsZScsCiAgICB9LAogICAgewogICAgICAg
IE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUnLCAgICAgICAgICAgICAgICAgICAg
ICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYW4gYXJ0aWNsZSBp
cyBjcmVhdGVkJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ3Jl
YXRlJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJhbnNhY3Rpb24nLAog
ICAgICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2xhc3MtUlQ6OkFydGljbGUnLAog
ICAgfSwKKTsKCkBUZW1wbGF0ZXMgPSAoCiAgICB7IFF1ZXVlICAgICAgID0+ICcwJywKICAgICAg
TmFtZSAgICAgICAgPT4gJ0JsYW5rJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnQSBibGFuayB0ZW1wbGF0ZScs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIENvbnRlbnQgICAg
ID0+ICcnLCB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAg
PT4gJ0F1dG9yZXBseScsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj
IGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ1BsYWluIHRleHQgQXV0b3Jlc3BvbnNlIHRlbXBs
YXRlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1N1
YmplY3Q6IEF1dG9SZXBseTogeyRUaWNrZXQtPlN1YmplY3R9CgoKR3JlZXRpbmdzLAoKVGhpcyBt
ZXNzYWdlIGhhcyBiZWVuIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGluIHJlc3BvbnNlIHRvIHRo
ZQpjcmVhdGlvbiBvZiBhIHRyb3VibGUgdGlja2V0IHJlZ2FyZGluZzoKICAgICAgICAieyRUaWNr
ZXQtPlN1YmplY3QoKX0iLCAKYSBzdW1tYXJ5IG9mIHdoaWNoIGFwcGVhcnMgYmVsb3cuCgpUaGVy
ZSBpcyBubyBuZWVkIHRvIHJlcGx5IHRvIHRoaXMgbWVzc2FnZSByaWdodCBub3cuICBZb3VyIHRp
Y2tldCBoYXMgYmVlbgphc3NpZ25lZCBhbiBJRCBvZiB7ICRUaWNrZXQtPlN1YmplY3RUYWcgfS4K
ClBsZWFzZSBpbmNsdWRlIHRoZSBzdHJpbmc6CgogICAgICAgICB7ICRUaWNrZXQtPlN1YmplY3RU
YWcgfQoKaW4gdGhlIHN1YmplY3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFi
b3V0IHRoaXMgaXNzdWUuIFRvIGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2Uu
CgogICAgICAgICAgICAgICAgICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAg
ICAgIHskVGlja2V0LT5RdWV1ZU9iai0+Q29ycmVzcG9uZEFkZHJlc3MoKX0KCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KeyRUcmFuc2FjdGlvbi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAg
ICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ0F1dG9yZXBseSBpbiBIVE1MJywgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hU
TUwgQXV0b3Jlc3BvbnNlIHRlbXBsYXRlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAg
ICAgQ29udGVudCAgICAgPT4gcVtTdWJqZWN0OiBBdXRvUmVwbHk6IHskVGlja2V0LT5TdWJqZWN0
fQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+R3JlZXRpbmdzLDwvcD4KCjxwPlRoaXMgbWVz
c2FnZSBoYXMgYmVlbiBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBpbiByZXNwb25zZSB0byB0aGUK
Y3JlYXRpb24gb2YgYSB0cm91YmxlIHRpY2tldCByZWdhcmRpbmcgPGI+eyRUaWNrZXQtPlN1Ympl
Y3QoKX08L2I+LAphIHN1bW1hcnkgb2Ygd2hpY2ggYXBwZWFycyBiZWxvdy48L3A+Cgo8cD5UaGVy
ZSBpcyBubyBuZWVkIHRvIHJlcGx5IHRvIHRoaXMgbWVzc2FnZSByaWdodCBub3cuICBZb3VyIHRp
Y2tldCBoYXMgYmVlbgphc3NpZ25lZCBhbiBJRCBvZiA8Yj57JFRpY2tldC0+U3ViamVjdFRhZ308
L2I+LjwvcD4KCjxwPlBsZWFzZSBpbmNsdWRlIHRoZSBzdHJpbmcgPGI+eyRUaWNrZXQtPlN1Ympl
Y3RUYWd9PC9iPgppbiB0aGUgc3ViamVjdCBsaW5lIG9mIGFsbCBmdXR1cmUgY29ycmVzcG9uZGVu
Y2UgYWJvdXQgdGhpcyBpc3N1ZS4gVG8gZG8gc28sCnlvdSBtYXkgcmVwbHkgdG8gdGhpcyBtZXNz
YWdlLjwvcD4KCjxwPlRoYW5rIHlvdSw8YnIvPgp7JFRpY2tldC0+UXVldWVPYmotPkNvcnJlc3Bv
bmRBZGRyZXNzKCl9PC9wPgoKPGhyLz4KeyRUcmFuc2FjdGlvbi0+Q29udGVudChUeXBlID0+ICd0
ZXh0L2h0bWwnKX0KXSwKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAnMCcsCiAgICAgICBO
YW1lICAgICAgICA9PiAnVHJhbnNhY3Rpb24nLCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAg
ICAgICBEZXNjcmlwdGlvbiA9PiAnUGxhaW4gdGV4dCB0cmFuc2FjdGlvbiB0ZW1wbGF0ZScsICMg
bG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnUlQtQXR0YWNoLU1lc3NhZ2U6IHllcwoKCnskVHJh
bnNhY3Rpb24tPkNyZWF0ZWRBc1N0cmluZ306IFJlcXVlc3QgeyRUaWNrZXQtPmlkfSB3YXMgYWN0
ZWQgdXBvbi4KIFRyYW5zYWN0aW9uOiB7JFRyYW5zYWN0aW9uLT5EZXNjcmlwdGlvbn0KICAgICAg
IFF1ZXVlOiB7JFRpY2tldC0+UXVldWVPYmotPk5hbWV9CiAgICAgU3ViamVjdDogeyRUcmFuc2Fj
dGlvbi0+U3ViamVjdCB8fCAkVGlja2V0LT5TdWJqZWN0IHx8ICIoTm8gc3ViamVjdCBnaXZlbiki
fQogICAgICAgT3duZXI6IHskVGlja2V0LT5Pd25lck9iai0+TmFtZX0KICBSZXF1ZXN0b3JzOiB7
JFRpY2tldC0+UmVxdWVzdG9yQWRkcmVzc2VzfQogICAgICBTdGF0dXM6IHskVGlja2V0LT5TdGF0
dXN9CiBUaWNrZXQgPFVSTDoge1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1UaWNrZXQvRGlz
cGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0gPgoKCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoKX0K
JwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUgICAgICAgID0+
ICdUcmFuc2FjdGlvbiBpbiBIVE1MJywgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9u
ID0+ICdIVE1MIHRyYW5zYWN0aW9uIHRlbXBsYXRlJywgICAgIyBsb2MKICAgICAgIENvbnRlbnQg
ICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8
Yj57JFRyYW5zYWN0aW9uLT5DcmVhdGVkQXNTdHJpbmd9OiBSZXF1ZXN0IDxhIGhyZWY9IntSVC0+
Q29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlk
fSI+eyRUaWNrZXQtPmlkfTwvYT4gd2FzIGFjdGVkIHVwb24gYnkgeyRUcmFuc2FjdGlvbi0+Q3Jl
YXRvck9iai0+TmFtZX0uPC9iPgo8YnI+Cjx0YWJsZSBib3JkZXI9IjAiPgo8dHI+PHRkIGFsaWdu
PSJyaWdodCI+PGI+VHJhbnNhY3Rpb246PC9iPjwvdGQ+PHRkPnskVHJhbnNhY3Rpb24tPkRlc2Ny
aXB0aW9ufTwvdGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlF1ZXVlOjwvYj48L3Rk
Pjx0ZD57JFRpY2tldC0+UXVldWVPYmotPk5hbWV9PC90ZD48L3RyPgo8dHI+PHRkIGFsaWduPSJy
aWdodCI+PGI+U3ViamVjdDo8L2I+PC90ZD48dGQ+eyRUcmFuc2FjdGlvbi0+U3ViamVjdCB8fCAk
VGlja2V0LT5TdWJqZWN0IHx8ICIoTm8gc3ViamVjdCBnaXZlbikifSA8L3RkPjwvdHI+Cjx0cj48
dGQgYWxpZ249InJpZ2h0Ij48Yj5Pd25lcjo8L2I+PC90ZD48dGQ+eyRUaWNrZXQtPk93bmVyT2Jq
LT5OYW1lfTwvdGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlJlcXVlc3RvcnM6PC9i
PjwvdGQ+PHRkPnskVGlja2V0LT5SZXF1ZXN0b3JBZGRyZXNzZXN9PC90ZD48L3RyPgo8dHI+PHRk
IGFsaWduPSJyaWdodCI+PGI+U3RhdHVzOjwvYj48L3RkPjx0ZD57JFRpY2tldC0+U3RhdHVzfTwv
dGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlRpY2tldCBVUkw6PC9iPjwvdGQ+PHRk
PjxhIGhyZWY9IntSVC0+Q29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tldC9EaXNwbGF5Lmh0bWw/
aWQ9eyRUaWNrZXQtPmlkfSI+e1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3Bs
YXkuaHRtbD9pZD17JFRpY2tldC0+aWR9PC9hPjwvdGQ+PC90cj4KPC90YWJsZT4KPGJyLz4KPGJy
Lz4KeyRUcmFuc2FjdGlvbi0+Q29udGVudCggVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0s
CiAgICAjIFNoYWRvdyB0aGUgZ2xvYmFsIHRlbXBsYXRlcyBvZiB0aGUgc2FtZSBuYW1lIHRvIHN1
cHByZXNzIGR1cGxpY2F0ZQogICAgIyBub3RpZmljYXRpb25zIHVudGlsIHJ1bGVzIGlzIHJpcHBl
ZCBvdXQuCiAgICB7IFF1ZXVlICAgICA9PiAiX19fQXBwcm92YWxzIiwKICAgICAgTmFtZSAgICAg
ID0+ICJUcmFuc2FjdGlvbiBpbiBIVE1MIiwKICAgICAgQ29udGVudCAgID0+ICIiLAogICAgfSwK
ICAgIHsgUXVldWUgICAgID0+ICJfX19BcHByb3ZhbHMiLAogICAgICBOYW1lICAgICAgPT4gIlRy
YW5zYWN0aW9uIiwKICAgICAgQ29udGVudCAgID0+ICIiLAogICAgfSwKICAgIHsKCiAgICAgIFF1
ZXVlICAgICAgID0+ICcwJywKICAgICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvcnJlc3BvbmRl
bmNlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnUGxh
aW4gdGV4dCBhZG1pbiBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAgICMgbG9jCiAgICAgIENv
bnRlbnQgICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzCgoKPFVSTDoge1JULT5Db25maWct
PkdldChcJ1dlYlVSTFwnKX1UaWNrZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0gPgoK
eyRUcmFuc2FjdGlvbi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4g
JzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvcnJlc3BvbmRlbmNlIGluIEhUTUwn
LCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnSFRNTCBh
ZG1pbiBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAgICMgbG9jCiAgICAgICBDb250ZW50ICAg
ICA9PiAnUlQtQXR0YWNoLU1lc3NhZ2U6IHllcwpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKVGlj
a2V0IFVSTDogPGEgaHJlZj0ie1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3Bs
YXkuaHRtbD9pZD17JFRpY2tldC0+aWR9Ij57UlQtPkNvbmZpZy0+R2V0KCJXZWJVUkwiKX1UaWNr
ZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH08L2E+CjxiciAvPgo8YnIgLz4KeyRUcmFu
c2FjdGlvbi0+Q29udGVudChUeXBlID0+ICJ0ZXh0L2h0bWwiKTt9CicKICAgIH0sCiAgICB7ICBR
dWV1ZSAgICAgICA9PiAnMCcsCiAgICAgICBOYW1lICAgICAgICA9PiAnQ29ycmVzcG9uZGVuY2Un
LCAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdQ
bGFpbiB0ZXh0IGNvcnJlc3BvbmRlbmNlIHRlbXBsYXRlJywgICAgICAgICAjIGxvYwogICAgICAg
Q29udGVudCAgICAgPT4gJ1JULUF0dGFjaC1NZXNzYWdlOiB5ZXMKCnskVHJhbnNhY3Rpb24tPkNv
bnRlbnQoKX0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUg
ICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJywgICAgICAgICAgICAgICAgICMgbG9j
CiAgICAgICBEZXNjcmlwdGlvbiA9PiAnSFRNTCBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAg
ICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1JULUF0dGFjaC1NZXNzYWdlOiB5
ZXMKQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoIFR5cGUg
PT4gInRleHQvaHRtbCIpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAg
ICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvbW1lbnQnLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnUGxhaW4gdGV4dCBhZG1pbiBjb21tZW50
IHRlbXBsYXRlJywgICAgICAgICAgIyBsb2MKICAgICAgIENvbnRlbnQgICAgID0+CidTdWJqZWN0
OiBbQ29tbWVudF0ge215ICRzPSgkVHJhbnNhY3Rpb24tPlN1YmplY3R8fCRUaWNrZXQtPlN1Ympl
Y3R8fCIiKTsgJHMgPX4gcy9cXFtDb21tZW50XFxdXFxzKi8vZzsgJHMgPX4gcy9eUmU6XFxzKi8v
aTsgJHM7fQpSVC1BdHRhY2gtTWVzc2FnZTogeWVzCgoKe1JULT5Db25maWctPkdldChcJ1dlYlVS
TFwnKX1UaWNrZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0KVGhpcyBpcyBhIGNvbW1l
bnQuICBJdCBpcyBub3Qgc2VudCB0byB0aGUgUmVxdWVzdG9yKHMpOgoKeyRUcmFuc2FjdGlvbi0+
Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFt
ZSAgICAgICAgPT4gJ0FkbWluIENvbW1lbnQgaW4gSFRNTCcsICAgICAgICAgICAgICAgICAgIyBs
b2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdIVE1MIGFkbWluIGNvbW1lbnQgdGVtcGxhdGUnLCAg
ICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAKJ1N1YmplY3Q6IFtDb21tZW50
XSB7bXkgJHM9KCRUcmFuc2FjdGlvbi0+U3ViamVjdHx8JFRpY2tldC0+U3ViamVjdHx8IiIpOyAk
cyA9fiBzL1xcW0NvbW1lbnRcXF1cXHMqLy9nOyAkcyA9fiBzL15SZTpcXHMqLy9pOyAkczt9ClJU
LUF0dGFjaC1NZXNzYWdlOiB5ZXMKQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxwPlRoaXMgaXMg
YSBjb21tZW50IGFib3V0IDxhIGhyZWY9IntSVC0+Q29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tl
dC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfSI+dGlja2V0IHskVGlja2V0LT5pZH08L2E+
LiBJdCBpcyBub3Qgc2VudCB0byB0aGUgUmVxdWVzdG9yKHMpOjwvcD4KCnskVHJhbnNhY3Rpb24t
PkNvbnRlbnQoVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg
ICA9PiAnMCcsCiAgICAgICBOYW1lICAgICAgICA9PiAnUmVtaW5kZXInLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnRGVmYXVsdCByZW1pbmRl
ciB0ZW1wbGF0ZScsICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PgonU3ViamVj
dDp7JFRpY2tldC0+U3ViamVjdH0gaXMgZHVlIHskVGlja2V0LT5EdWVPYmotPkFzU3RyaW5nfQoK
VGhpcyByZW1pbmRlciBpcyBmb3IgdGlja2V0ICN7JFRhcmdldCA9ICRUaWNrZXQtPlJlZmVyc1Rv
LT5GaXJzdC0+VGFyZ2V0T2JqOyRUYXJnZXQtPklkfS4KCntSVC0+Q29uZmlnLT5HZXQoXCdXZWJV
UkxcJyl9VGlja2V0L0Rpc3BsYXkuaHRtbD9pZD17JFRhcmdldC0+SWR9CicKICAgIH0sCgogICAg
eyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ1N0YXR1cyBDaGFu
Z2UnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVz
Y3JpcHRpb24gPT4gJ1RpY2tldCBzdGF0dXMgY2hhbmdlZCcsICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IFN0YXR1cyBDaGFu
Z2VkIHRvOiB7JFRyYW5zYWN0aW9uLT5OZXdWYWx1ZX0KCgp7UlQtPkNvbmZpZy0+R2V0KFwnV2Vi
VVJMXCcpfVRpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfQoKeyRUcmFuc2FjdGlv
bi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAg
TmFtZSAgICAgICAgPT4gJ1N0YXR1cyBDaGFuZ2UgaW4gSFRNTCcsICAgICAgICAgICAgICAjIGxv
YwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hUTUwgVGlja2V0IHN0YXR1cyBjaGFuZ2VkJywgICAg
ICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnU3ViamVjdDogU3RhdHVzIENo
YW5nZWQgdG86IHskVHJhbnNhY3Rpb24tPk5ld1ZhbHVlfQpDb250ZW50LVR5cGU6IHRleHQvaHRt
bAoKPGEgaHJlZj0ie1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3BsYXkuaHRt
bD9pZD17JFRpY2tldC0+aWR9Ij57UlQtPkNvbmZpZy0+R2V0KCJXZWJVUkwiKX1UaWNrZXQvRGlz
cGxheS5odG1sP2lkPXskVGlja2V0LT5pZH08L2E+Cjxici8+Cjxici8+CnskVHJhbnNhY3Rpb24t
PkNvbnRlbnQoVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0sCiAgICB7CgogICAgICBRdWV1
ZSAgICAgICA9PiAnMCcsCiAgICAgIE5hbWUgICAgICAgID0+ICdSZXNvbHZlZCcsICAgICAgICAg
ICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnVGlja2V0IFJlc29sdmVkJywgICAg
ICAgICAgIyBsb2MKICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IFJlc29sdmVkOiB7JFRp
Y2tldC0+U3ViamVjdH0KCkFjY29yZGluZyB0byBvdXIgcmVjb3JkcywgeW91ciByZXF1ZXN0IGhh
cyBiZWVuIHJlc29sdmVkLiBJZiB5b3UgaGF2ZSBhbnkKZnVydGhlciBxdWVzdGlvbnMgb3IgY29u
Y2VybnMsIHBsZWFzZSByZXNwb25kIHRvIHRoaXMgbWVzc2FnZS4KJwogICAgfSwKICAgIHsgIFF1
ZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUgICAgICAgID0+ICdSZXNvbHZlZCBpbiBIVE1M
JywgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hUTUwgVGlja2V0
IFJlc29sdmVkJywgICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnU3ViamVj
dDogUmVzb2x2ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoK
PHA+QWNjb3JkaW5nIHRvIG91ciByZWNvcmRzLCB5b3VyIHJlcXVlc3QgaGFzIGJlZW4gcmVzb2x2
ZWQuICBJZiB5b3UgaGF2ZSBhbnkgZnVydGhlciBxdWVzdGlvbnMgb3IgY29uY2VybnMsIHBsZWFz
ZSByZXNwb25kIHRvIHRoaXMgbWVzc2FnZS48L3A+CicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg
ICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAgID0+ICJOZXcgUGVuZGluZyBB
cHByb3ZhbCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiTm90aWZ5
IE93bmVycyBhbmQgQWRtaW5DY3Mgb2YgbmV3IGl0ZW1zIHBlbmRpbmcgdGhlaXIgYXBwcm92YWwi
LCAjIGxvYwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogTmV3IFBlbmRpbmcgQXBwcm92YWw6
IHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoKVGhlcmUgaXMgYSBuZXcgaXRlbSBwZW5k
aW5nIHlvdXIgYXBwcm92YWw6ICJ7JFRpY2tldC0+U3ViamVjdCgpfSIsIAphIHN1bW1hcnkgb2Yg
d2hpY2ggYXBwZWFycyBiZWxvdy4KClBsZWFzZSB2aXNpdCB7UlQtPkNvbmZpZy0+R2V0KFwnV2Vi
VVJMXCcpfUFwcHJvdmFscy9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfQp0byBhcHByb3Zl
IG9yIHJlamVjdCB0aGlzIHRpY2tldCwgb3Ige1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1B
cHByb3ZhbHMvIHRvCmJhdGNoLXByb2Nlc3MgYWxsIHlvdXIgcGVuZGluZyBhcHByb3ZhbHMuCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoKX0KJwogICAgfSwKICAgIHsg
IFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAgTmFtZSAgICAgICAgPT4gIk5l
dyBQZW5kaW5nIEFwcHJvdmFsIGluIEhUTUwiLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICJOb3RpZnkgT3duZXJzIGFuZCBBZG1p
bkNjcyBvZiBuZXcgaXRlbXMgcGVuZGluZyB0aGVpciBhcHByb3ZhbCIsICMgbG9jCiAgICAgICBD
b250ZW50ICAgICA9PiAnU3ViamVjdDogTmV3IFBlbmRpbmcgQXBwcm92YWw6IHskVGlja2V0LT5T
dWJqZWN0fQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+R3JlZXRpbmdzLDwvcD4KCjxwPlRo
ZXJlIGlzIGEgbmV3IGl0ZW0gcGVuZGluZyB5b3VyIGFwcHJvdmFsOiA8Yj57JFRpY2tldC0+U3Vi
amVjdCgpfTwvYj4sCmEgc3VtbWFyeSBvZiB3aGljaCBhcHBlYXJzIGJlbG93LjwvcD4KCjxwPlBs
ZWFzZSA8YSBocmVmPSJ7UlQtPkNvbmZpZy0+R2V0KFwnV2ViVVJMXCcpfUFwcHJvdmFscy9EaXNw
bGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfSI+YXBwcm92ZQpvciByZWplY3QgdGhpcyB0aWNrZXQ8
L2E+LCBvciB2aXNpdCB0aGUgPGEgaHJlZj0ie1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1B
cHByb3ZhbHMvIj5hcHByb3ZhbHMKb3ZlcnZpZXc8L2E+IHRvIGJhdGNoLXByb2Nlc3MgYWxsIHlv
dXIgcGVuZGluZyBhcHByb3ZhbHMuPC9wPgoKPGhyIC8+CnskVHJhbnNhY3Rpb24tPkNvbnRlbnQo
KX0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAg
TmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFBhc3NlZCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw
dGlvbiA9PgogICAgICAgICAiTm90aWZ5IFJlcXVlc3RvciBvZiB0aGVpciB0aWNrZXQgaGFzIGJl
ZW4gYXBwcm92ZWQgYnkgc29tZSBhcHByb3ZlciIsICMgbG9jCiAgICAgICBDb250ZW50ID0+ICdT
dWJqZWN0OiBUaWNrZXQgQXBwcm92ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoK
WW91ciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgeyBldmFsIHsgJEFwcHJvdmVyLT5OYW1l
IH0gfS4KT3RoZXIgYXBwcm92YWxzIG1heSBiZSBwZW5kaW5nLgoKQXBwcm92ZXJcJ3Mgbm90ZXM6
IHsgJE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMn
LAogICAgICAgTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFBhc3NlZCBpbiBIVE1MIiwgICAgIyBs
b2MKICAgICAgIERlc2NyaXB0aW9uID0+CiAgICAgICAgICJOb3RpZnkgUmVxdWVzdG9yIG9mIHRo
ZWlyIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCBieSBzb21lIGFwcHJvdmVyIiwgIyBsb2MKICAg
ICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNrZXQtPlN1Ympl
Y3R9CkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8cD5HcmVldGluZ3MsPC9wPgoKPHA+WW91ciB0
aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgPGI+eyBldmFsIHsgJEFwcHJvdmVyLT5OYW1lIH0g
fTwvYj4uCk90aGVyIGFwcHJvdmFscyBtYXkgYmUgcGVuZGluZy48L3A+Cgo8cD5BcHByb3Zlclwn
cyBub3Rlczo8L3A+CjxibG9ja3F1b3RlPnsgJE5vdGVzIH08L2Jsb2NrcXVvdGU+CicKICAgIH0s
CiAgICB7ICBRdWV1ZSAgICAgICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAg
ID0+ICJBbGwgQXBwcm92YWxzIFBhc3NlZCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9
PgogICAgICAgICAiTm90aWZ5IFJlcXVlc3RvciBvZiB0aGVpciB0aWNrZXQgaGFzIGJlZW4gYXBw
cm92ZWQgYnkgYWxsIGFwcHJvdmVycyIsICMgbG9jCiAgICAgICBDb250ZW50ID0+ICdTdWJqZWN0
OiBUaWNrZXQgQXBwcm92ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoKWW91ciB0
aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgeyBldmFsIHsgJEFwcHJvdmVyLT5OYW1lIH0gfS4K
SXRzIE93bmVyIG1heSBub3cgc3RhcnQgdG8gYWN0IG9uIGl0LgoKQXBwcm92ZXJcJ3Mgbm90ZXM6
IHsgJE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMn
LAogICAgICAgTmFtZSAgICAgICAgPT4gIkFsbCBBcHByb3ZhbHMgUGFzc2VkIGluIEhUTUwiLCAg
ICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBSZXF1ZXN0b3Ig
b2YgdGhlaXIgdGlja2V0IGhhcyBiZWVuIGFwcHJvdmVkIGJ5IGFsbCBhcHByb3ZlcnMiLCAjIGxv
YwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogVGlja2V0IEFwcHJvdmVkOiB7JFRpY2tldC0+
U3ViamVjdH0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxwPkdyZWV0aW5ncyw8L3A+Cgo8cD5Z
b3VyIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCBieSA8Yj57IGV2YWwgeyAkQXBwcm92ZXItPk5h
bWUgfSB9PC9iPi4KSXRzIE93bmVyIG1heSBub3cgc3RhcnQgdG8gYWN0IG9uIGl0LjwvcD4KCjxw
PkFwcHJvdmVyXCdzIG5vdGVzOjwvcD4KPGJsb2NrcXVvdGU+eyAkTm90ZXMgfTwvYmxvY2txdW90
ZT4KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAg
TmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFJlamVjdGVkIiwgICAgIyBsb2MKICAgICAgIERlc2Ny
aXB0aW9uID0+CiAgICAgICAgICJOb3RpZnkgT3duZXIgb2YgdGhlaXIgcmVqZWN0ZWQgdGlja2V0
IiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBSZWplY3RlZDogeyRU
aWNrZXQtPlN1YmplY3R9CgpHcmVldGluZ3MsCgpZb3VyIHRpY2tldCBoYXMgYmVlbiByZWplY3Rl
ZCBieSB7IGV2YWwgeyAkQXBwcm92ZXItPk5hbWUgfSB9LgoKQXBwcm92ZXJcJ3Mgbm90ZXM6IHsg
JE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAog
ICAgICAgTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFJlamVjdGVkIGluIEhUTUwiLCAgICAjIGxv
YwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVpciBy
ZWplY3RlZCB0aWNrZXQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogVGlja2V0
IFJlamVjdGVkOiB7JFRpY2tldC0+U3ViamVjdH0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxw
PkdyZWV0aW5ncyw8L3A+Cgo8cD5Zb3VyIHRpY2tldCBoYXMgYmVlbiByZWplY3RlZCBieSA8Yj57
IGV2YWwgeyAkQXBwcm92ZXItPk5hbWUgfSB9PC9iPi48L3A+Cgo8cD5BcHByb3ZlclwncyBub3Rl
czo8L3A+CjxibG9ja3F1b3RlPnsgJE5vdGVzIH08L2Jsb2NrcXVvdGU+CicKICAgIH0sCiAgICB7
ICBRdWV1ZSAgICAgICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAgID0+ICJB
cHByb3ZhbCBSZWFkeSBmb3IgT3duZXIiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4K
ICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVpciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQg
YW5kIGlzIHJlYWR5IHRvIGJlIGFjdGVkIG9uIiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1
YmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNrZXQtPlN1YmplY3R9CgpHcmVldGluZ3MsCgpU
aGUgdGlja2V0IGhhcyBiZWVuIGFwcHJvdmVkLCB5b3UgbWF5IG5vdyBzdGFydCB0byBhY3Qgb24g
aXQuCgonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJ19fX0FwcHJvdmFscycsCiAgICAg
ICBOYW1lICAgICAgICA9PiAiQXBwcm92YWwgUmVhZHkgZm9yIE93bmVyIGluIEhUTUwiLCAgICAj
IGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVp
ciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYW5kIGlzIHJlYWR5IHRvIGJlIGFjdGVkIG9uIiwg
IyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNr
ZXQtPlN1YmplY3R9CkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8cD5HcmVldGluZ3MsPC9wPgoK
PHA+VGhlIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCwgeW91IG1heSBub3cgc3RhcnQgdG8gYWN0
IG9uIGl0LjwvcD4KCicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgTmFt
ZSAgICAgICAgPT4gIkZvcndhcmQiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gIkZv
cndhcmRlZCBtZXNzYWdlIiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gcXsKCnsgJEZvcndhcmRU
cmFuc2FjdGlvbi0+Q29udGVudCA9fiAvXFMvID8gJEZvcndhcmRUcmFuc2FjdGlvbi0+Q29udGVu
dCA6ICJUaGlzIGlzIGEgZm9yd2FyZCBvZiB0cmFuc2FjdGlvbiAjIi4kVHJhbnNhY3Rpb24tPmlk
LiIgb2YgdGlja2V0ICMiLiAkVGlja2V0LT5pZCB9Cn0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg
ICA9PiAwLAogICAgICAgTmFtZSAgICAgICAgPT4gIkZvcndhcmQgVGlja2V0IiwgICAgIyBsb2MK
ICAgICAgIERlc2NyaXB0aW9uID0+ICJGb3J3YXJkZWQgdGlja2V0IG1lc3NhZ2UiLCAjIGxvYwog
ICAgICAgQ29udGVudCA9PiBxewoKeyAkRm9yd2FyZFRyYW5zYWN0aW9uLT5Db250ZW50ID1+IC9c
Uy8gPyAkRm9yd2FyZFRyYW5zYWN0aW9uLT5Db250ZW50IDogIlRoaXMgaXMgYSBmb3J3YXJkIG9m
IHRpY2tldCAjIi4gJFRpY2tldC0+aWQgfQp9CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4g
MCwKICAgICAgIE5hbWUgICAgICAgID0+ICJFcnJvcjogdW5lbmNyeXB0ZWQgbWVzc2FnZSIsICAg
ICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCB0
aGVpciB1bmVuY3J5cHRlZCBtYWlsIGhhcyBiZWVuIHJlamVjdGVkIiwgIyBsb2MKICAgICAgIENv
bnRlbnQgPT4gcXtTdWJqZWN0OiBSVCByZXF1aXJlcyB0aGF0IGFsbCBpbmNvbWluZyBtYWlsIGJl
IGVuY3J5cHRlZAoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIFJUIHJlY2VpdmVk
IG1haWwgZnJvbSB5b3UgdGhhdCB3YXMgbm90IGVuY3J5cHRlZC4gIEFzIHN1Y2gsIGl0IGhhcyBi
ZWVuIHJlamVjdGVkLgp9CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gMCwKICAgICAgIE5h
bWUgICAgICAgID0+ICJFcnJvcjogcHVibGljIGtleSIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw
dGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCBoZSBoYXMgcHJvYmxlbXMgd2l0aCBw
dWJsaWMga2V5IGFuZCBjb3VsZG4ndCByZWNpZXZlIGVuY3J5cHRlZCBjb250ZW50IiwgIyBsb2MK
ICAgICAgIENvbnRlbnQgPT4gcXtTdWJqZWN0OiBZb3VyIHB1YmxpYyBrZXkgaW4gUlQgaXMgbWlz
c2luZyBvciB1bnVzYWJsZQoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHdlIHdl
cmUgdW5hYmxlIHRvIGVuY3J5cHQgYSBtZXNzYWdlIHRvIHlvdXIgcHVibGljIGtleSwgZWl0aGVy
IGJlY2F1c2UgaXQgaXMgbWlzc2luZyBvciBoYXMgYSBwcm9ibGVtLiAgUGxlYXNlIGluZm9ybSB0
aGUgYWRtaW5pc3RyYXRvciBhYm91dCB0aGUgcHJvYmxlbS4KfQogICAgfSwKICAgIHsgIFF1ZXVl
ICAgICAgID0+IDAsCiAgICAgICBOYW1lICAgICAgICA9PiAiRXJyb3IgdG8gUlQgb3duZXI6IHB1
YmxpYyBrZXkiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIkluZm9y
bSBSVCBvd25lciB0aGF0IHVzZXIocykgaGF2ZSBwcm9ibGVtcyB3aXRoIHB1YmxpYyBrZXlzIiwg
IyBsb2MKICAgICAgIENvbnRlbnQgPT4gcXtTdWJqZWN0OiBTb21lIHVzZXJzIGhhdmUgcHJvYmxl
bXMgd2l0aCBwdWJsaWMga2V5cwoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBhcyBSVCBoYXMg
cHJvYmxlbXMgd2l0aCBwdWJsaWMga2V5cyBvZiB0aGUgZm9sbG93aW5nIHVzZXI6CnsKICAgIGZv
cmVhY2ggbXkgJGUgKCBAQmFkUmVjaXBpZW50cyApIHsKICAgICAgICAkT1VUIC49ICIqICIuICRl
LT57J01lc3NhZ2UnfSAuIlxuIjsKICAgIH0KfX0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9
PiAwLAogICAgICAgTmFtZSAgICAgICAgPT4gIkVycm9yOiBubyBwcml2YXRlIGtleSIsICAgICMg
bG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCB3ZSBy
ZWNlaXZlZCBhbiBlbmNyeXB0ZWQgZW1haWwgYW5kIHdlIGhhdmUgbm8gcHJpdmF0ZSBrZXlzIHRv
IGRlY3J5cHQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiBxe1N1YmplY3Q6IHdlIHJlY2VpdmVk
IG1lc3NhZ2Ugd2UgY2Fubm90IGRlY3J5cHQKCllvdSBzZW50IGFuIGVuY3J5cHRlZCBtZXNzYWdl
IHdpdGggc3ViamVjdCAneyAkTWVzc2FnZS0+aGVhZC0+Z2V0KCdTdWJqZWN0JykgfScsCmJ1dCB3
ZSBoYXZlIG5vIHByaXZhdGUga2V5IGl0J3MgZW5jcnlwdGVkIHRvLgoKUGxlYXNlLCBjaGVjayB0
aGF0IHlvdSBlbmNyeXB0IG1lc3NhZ2VzIHdpdGggY29ycmVjdCBrZXlzCm9yIGNvbnRhY3QgdGhl
IHN5c3RlbSBhZG1pbmlzdHJhdG9yLn0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAwLAog
ICAgICAgTmFtZSAgICAgICAgPT4gIkVycm9yOiBiYWQgZW5jcnlwdGVkIGRhdGEiLCAgICAjIGxv
YwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIkluZm9ybSB1c2VyIHRoYXQgYSBtZXNz
YWdlIGhlIHNlbnQgaGFzIGludmFsaWQgZW5jcnlwdGlvbiBkYXRhIiwgIyBsb2MKICAgICAgIENv
bnRlbnQgPT4gcXtTdWJqZWN0OiBXZSByZWNlaXZlZCBhIG1lc3NhZ2Ugd2UgY2Fubm90IGhhbmRs
ZQoKWW91IHNlbnQgdXMgYSBtZXNzYWdlIHRoYXQgd2UgY2Fubm90IGhhbmRsZSBkdWUgdG8gY29y
cnVwdGVkIHNpZ25hdHVyZSBvciBlbmNyeXB0ZWQgYmxvY2suIHdlIGdldCB0aGUgZm9sbG93aW5n
IGVycm9yKHMpOgp7IGZvcmVhY2ggbXkgJG1zZyAoIEBNZXNzYWdlcyApIHsKICAgICRPVVQgLj0g
IiogJG1zZ1xuIjsKICB9Cn19CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gMCwKICAgICAg
IE5hbWUgICAgICAgID0+ICJQYXNzd29yZENoYW5nZSIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw
dGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCBoaXMgcGFzc3dvcmQgaGFzIGJlZW4g
cmVzZXQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiBxe1N1YmplY3Q6IFt7UlQtPkNvbmZpZy0+
R2V0KCdydG5hbWUnKX1dIFBhc3N3b3JkIHJlc2V0CgpHcmVldGluZ3MsCgpTb21lb25lIGF0IHsk
RU5WeydSRU1PVEVfQUREUid9fSByZXF1ZXN0ZWQgYSBwYXNzd29yZCByZXNldCBmb3IgeW91IG9u
IHtSVC0+Q29uZmlnLT5HZXQoJ1dlYlVSTCcpfQoKWW91ciBuZXcgcGFzc3dvcmQgaXM6CiAgeyRO
ZXdQYXNzd29yZH0KfQogICAgfSwKCiAgICAgICAgICAgICAgIHsgICBRdWV1ZSAgICAgICA9PiAn
MCcsCiAgICAgICAgICAgICAgICAgICBOYW1lICAgICAgICA9PiAnRW1haWwgRGlnZXN0JywgICAg
IyBsb2MKICAgICAgICAgICAgICAgICAgIERlc2NyaXB0aW9uID0+ICdFbWFpbCB0ZW1wbGF0ZSBm
b3IgcGVyaW9kaWMgbm90aWZpY2F0aW9uIGRpZ2VzdHMnLCAgIyBsb2MKICAgICAgICAgICAgICAg
ICAgIENvbnRlbnQgPT4gcVtTdWJqZWN0OiBSVCBFbWFpbCBEaWdlc3QKCnsgJEFyZ3VtZW50IH0K
XSwKICAgICAgICAgICAgICAgfSwKCnsKICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICBOYW1lICAg
ICAgICA9PiAiRXJyb3I6IE1pc3NpbmcgZGFzaGJvYXJkIiwgICAgIyBsb2MKICAgIERlc2NyaXB0
aW9uID0+CiAgICAgICJJbmZvcm0gdXNlciB0aGF0IGEgZGFzaGJvYXJkIGhlIHN1YnNjcmliZWQg
dG8gaXMgbWlzc2luZyIsICMgbG9jCiAgICBDb250ZW50ID0+IHF7U3ViamVjdDogW3tSVC0+Q29u
ZmlnLT5HZXQoJ3J0bmFtZScpfV0gTWlzc2luZyBkYXNoYm9hcmQhCgpHcmVldGluZ3MsCgpZb3Ug
YXJlIHN1YnNjcmliZWQgdG8gYSBkYXNoYm9hcmQgdGhhdCBpcyBjdXJyZW50bHkgbWlzc2luZy4g
TW9zdCBsaWtlbHksIHRoZSBkYXNoYm9hcmQgd2FzIGRlbGV0ZWQuCgpSVCB3aWxsIHJlbW92ZSB0
aGlzIHN1YnNjcmlwdGlvbiBhcyBpdCBpcyBubyBsb25nZXIgdXNlZnVsLiBIZXJlJ3MgdGhlIGlu
Zm9ybWF0aW9uIFJUIGhhZCBhYm91dCB5b3VyIHN1YnNjcmlwdGlvbjoKCkRhc2hib2FyZElEOiAg
eyAkU3Vic2NyaXB0aW9uT2JqLT5TdWJWYWx1ZSgnRGFzaGJvYXJkSWQnKSB9CkZyZXF1ZW5jeTog
ICAgeyAkU3Vic2NyaXB0aW9uT2JqLT5TdWJWYWx1ZSgnRnJlcXVlbmN5JykgfQpIb3VyOiAgICAg
ICAgIHsgJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0hvdXInKSB9CnsKICAgICRTdWJzY3Jp
cHRpb25PYmotPlN1YlZhbHVlKCdGcmVxdWVuY3knKSBlcSAnd2Vla2x5JwogICAgPyAiRGF5IG9m
IHdlZWs6ICAiIC4gJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0RvdycpCiAgICA6ICRTdWJz
Y3JpcHRpb25PYmotPlN1YlZhbHVlKCdGcmVxdWVuY3knKSBlcSAnbW9udGhseScKICAgICAgPyAi
RGF5IG9mIG1vbnRoOiAiIC4gJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0RvbScpCiAgICAg
IDogJycKfQp9Cn0sCiAgICB7CiAgICAgICAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgIE5h
bWUgICAgICAgID0+ICdBdXRoIHRva2VucyBleHBpcmluZyBpbiA3IGRheXMgaW4gSFRNTCcsICMg
bG9jCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0F1dGggdG9rZW5zIGV4cGlyaW5nIGluIDcgZGF5
cycsICMgbG9jCiAgICAgICAgQ29udGVudCAgICAgPT4gcVtTdWJqZWN0OiBbe1JULT5Db25maWct
PkdldCgncnRuYW1lJyl9XSBZb3UgaGF2ZSBhdXRoIHRva2VucyB0aGF0IHdpbGwgZXhwaXJlIGlu
IDcgZGF5cwpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+SGVsbG8geyAkVXNlck9iai0+UmVh
bE5hbWUgfHwgJFVzZXJPYmotPk5hbWUgfTo8L3A+Cgo8cD4KVGhlIGZvbGxvd2luZyB0b2tlbnMg
d2lsbCBleHBpcmUgd2l0aGluIHRoZSBuZXh0IDcgZGF5czoKPHVsPgp7CiAgICBmb3IgbXkgJHRv
a2VuIChAQXV0aFRva2VucykgewogICAgICAgICRPVVQgLj0gJzxsaT4nIC4gJHRva2VuLT5EZXNj
cmlwdGlvbiAuICAnIChleHBpcmVzIGF0ICcgLiAkdG9rZW4tPkV4cGlyZXNPYmotPkFzU3RyaW5n
IC4gJyk8L2xpPic7CiAgICB9Cn0KPC91bD4KPC9wPgoKewogICAgaWYgKCAgICRVc2VyT2JqLT5I
YXNSaWdodCggUmlnaHQgPT4gJ01vZGlmeVNlbGYnLCBPYmplY3QgPT4gUlQtPlN5c3RlbSApCiAg
ICAgICAgJiYgJFVzZXJPYmotPkhhc1JpZ2h0KCBSaWdodCA9PiAnTWFuYWdlQXV0aFRva2Vucycs
IE9iamVjdCA9PiBSVC0+U3lzdGVtICkgKQogICAgewogICAgICAgICRPVVQgLj0gJzxwPllvdSBj
YW4gcmV2b2tlIHRoZW0gYW5kIGdlbmVyYXRlIG5ldyBvbmVzIG9uIHRoZSA8YSBocmVmPSInIC4g
UlQtPkNvbmZpZy0+R2V0KCdXZWJVUkwnKSAuICdQcmVmcy9BdXRoVG9rZW5zLmh0bWwnIC4gJyI+
QXV0aCBUb2tlbnM8L2E+IHBhZ2UgaW4gUlQuPC9wPic7CiAgICB9CiAgICBlbHNlIHsKICAgICAg
ICAkT1VUIC49ICI8cD5JZiB5b3UgYXJlIHN0aWxsIHVzaW5nIHRoZW0sIHBsZWFzZSBjb250YWN0
IHlvdXIgUlQgbWFuYWdlciB0byBnZW5lcmF0ZSBuZXcgb25lcyBmb3IgeW91LjwvcD4iOwogICAg
fQp9Cl0sCiAgICB9LAogICAgewogICAgICAgIE9iamVjdElkICAgID0+ICcwJywKICAgICAgICBO
YW1lICAgICAgICA9PiAnQmxhbmsnLCAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3Jp
cHRpb24gPT4gJ0EgYmxhbmsgdGVtcGxhdGUnLCAgICAjIGxvYwogICAgICAgIENvbnRlbnQgICAg
ID0+ICcnLAogICAgICAgIExvb2t1cFR5cGUgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAog
ICAgfSwKICAgIHsKICAgICAgICBPYmplY3RJZCAgICA9PiAnMCcsCiAgICAgICAgTmFtZSAgICAg
ICAgPT4gJ0JsYW5rJywgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+
ICdBIGJsYW5rIHRlbXBsYXRlJywgICAgIyBsb2MKICAgICAgICBDb250ZW50ICAgICA9PiAnJywK
ICAgICAgICBMb29rdXBUeXBlICA9PiAnUlQ6OkNsYXNzLVJUOjpBcnRpY2xlJywKICAgIH0sCik7
CgpAU2NyaXBzID0gKAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENvbW1lbnQgTm90aWZ5
IEFkbWluQ2NzIGFzIENvbW1lbnQnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIENvbW1l
bnQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ05vdGlmeSBBZG1pbkNjcyBBcyBDb21tZW50
JywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdBZG1pbiBDb21tZW50IGluIEhUTUwnIH0sCiAg
ICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ29tbWVudCBOb3RpZnkgT3RoZXIgUmVjaXBpZW50
cyBhcyBDb21tZW50JywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb21tZW50JywKICAg
ICAgIFNjcmlwQWN0aW9uICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cyBBcyBDb21tZW50
JywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJyB9LAog
ICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENvcnJlc3BvbmQgTm90aWZ5IE93bmVyIGFuZCBB
ZG1pbkNjcycsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAg
ICBTY3JpcEFjdGlvbiAgICA9PiAnTm90aWZ5IE93bmVyIGFuZCBBZG1pbkNjcycsCiAgICAgICBU
ZW1wbGF0ZSAgICAgICA9PiAnQWRtaW4gQ29ycmVzcG9uZGVuY2UgaW4gSFRNTCcgfSwKICAgIHsg
IERlc2NyaXB0aW9uICAgID0+ICdPbiBDb3JyZXNwb25kIE5vdGlmeSBPdGhlciBSZWNpcGllbnRz
JywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb3JyZXNwb25kJywKICAgICAgIFNjcmlw
QWN0aW9uICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cycsCiAgICAgICBUZW1wbGF0ZSAg
ICAgICA9PiAnQ29ycmVzcG9uZGVuY2UgaW4gSFRNTCcgfSwKICAgIHsgIERlc2NyaXB0aW9uICAg
ID0+ICdPbiBDb3JyZXNwb25kIE5vdGlmeSBSZXF1ZXN0b3JzIGFuZCBDY3MnLAogICAgICAgU2Ny
aXBDb25kaXRpb24gPT4gJ09uIENvcnJlc3BvbmQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4g
J05vdGlmeSBSZXF1ZXN0b3JzIEFuZCBDY3MnLAogICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0Nv
cnJlc3BvbmRlbmNlIGluIEhUTUwnIH0sCiAgICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ29y
cmVzcG9uZCBPcGVuIEluYWN0aXZlIFRpY2tldHMnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4g
J09uIENvcnJlc3BvbmQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ09wZW4gSW5hY3RpdmUg
VGlja2V0cycsCiAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnIH0sCiAgICB7ICBEZXNj
cmlwdGlvbiAgICA9PiAnT24gQ3JlYXRlIEF1dG9yZXBseSBUbyBSZXF1ZXN0b3JzJywKICAgICAg
IFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4g
J0F1dG9SZXBseSBUbyBSZXF1ZXN0b3JzJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdBdXRv
UmVwbHkgaW4gSFRNTCcgfSwKICAgIHsgIERlc2NyaXB0aW9uICAgID0+ICdPbiBDcmVhdGUgTm90
aWZ5IE93bmVyIGFuZCBBZG1pbkNjcycsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ3Jl
YXRlJywKICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdOb3RpZnkgT3duZXIgYW5kIEFkbWluQ2Nz
JywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdUcmFuc2FjdGlvbiBpbiBIVE1MJyB9LAogICAg
eyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENyZWF0ZSBOb3RpZnkgQ2NzJywKICAgICAgIFNjcmlw
Q29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ05vdGlm
eSBDY3MnLAogICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0NvcnJlc3BvbmRlbmNlIGluIEhUTUwn
IH0sCiAgICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ3JlYXRlIE5vdGlmeSBPdGhlciBSZWNp
cGllbnRzJywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2Ny
aXBBY3Rpb24gICAgPT4gJ05vdGlmeSBPdGhlciBSZWNpcGllbnRzJywKICAgICAgIFRlbXBsYXRl
ICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJyB9LAogICAgeyAgRGVzY3JpcHRpb24g
ICAgPT4gJ09uIE93bmVyIENoYW5nZSBOb3RpZnkgT3duZXInLAogICAgICAgU2NyaXBDb25kaXRp
b24gPT4gJ09uIE93bmVyIENoYW5nZScsCiAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnTm90aWZ5
IE93bmVyJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdUcmFuc2FjdGlvbiBpbiBIVE1MJyB9
LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIFJlc29sdmUgTm90aWZ5IFJlcXVlc3RvcnMn
LAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIFJlc29sdmUnLAogICAgICAgU2NyaXBBY3Rp
b24gICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3JzJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdS
ZXNvbHZlZCBpbiBIVE1MJyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gIk9uIHRyYW5zYWN0
aW9uLCBhZGQgYW55IHRhZ3MgaW4gdGhlIHRyYW5zYWN0aW9uJ3Mgc3ViamVjdCB0byB0aGUgdGlj
a2V0J3Mgc3ViamVjdCIsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gVHJhbnNhY3Rpb24n
LAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ0V4dHJhY3QgU3ViamVjdCBUYWcnLAogICAgICAg
VGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09u
IEZvcndhcmQgVHJhbnNhY3Rpb24gU2VuZCBmb3J3YXJkZWQgbWVzc2FnZScsCiAgICAgICBTY3Jp
cENvbmRpdGlvbiA9PiAnT24gRm9yd2FyZCBUcmFuc2FjdGlvbicsCiAgICAgICBTY3JpcEFjdGlv
biAgICA9PiAnU2VuZCBGb3J3YXJkJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdGb3J3YXJk
JyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIEZvcndhcmQgVGlja2V0IFNlbmQgZm9y
d2FyZGVkIG1lc3NhZ2UnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIEZvcndhcmQgVGlj
a2V0JywKICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdTZW5kIEZvcndhcmQnLAogICAgICAgVGVt
cGxhdGUgICAgICAgPT4gJ0ZvcndhcmQgVGlja2V0JyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAg
ICAgPT4gIlNldCBzdGFydHMgZGF0ZSBpZiBuZWVkZWQgYWNjb3JkaW5nIHRvIFNMQSIsCiAgICAg
ICBTY3JpcENvbmRpdGlvbiAgICA9PiAnUmVxdWlyZSBzdGFydHMgc2V0IGFjY29yZGluZyB0byBT
TEEnLAogICAgICAgU2NyaXBBY3Rpb24gICAgICAgPT4gJ1NldCBzdGFydHMgZGF0ZSBhY2NvcmRp
bmcgdG8gU0xBJywKICAgICAgIFRlbXBsYXRlICAgICAgICAgID0+ICdCbGFuaycgfSwKICAgIHsg
IERlc2NyaXB0aW9uICAgICAgID0+ICJTZXQgZHVlIGRhdGUgaWYgbmVlZGVkIGFjY29yZGluZyB0
byBTTEEiLAogICAgICAgU2NyaXBDb25kaXRpb24gICAgPT4gJ1JlcXVpcmUgZHVlIHNldCBhY2Nv
cmRpbmcgdG8gU0xBJywKICAgICAgIFNjcmlwQWN0aW9uICAgICAgID0+ICdTZXQgZHVlIGRhdGUg
YWNjb3JkaW5nIHRvIFNMQScsCiAgICAgICBUZW1wbGF0ZSAgICAgICAgICA9PiAnQmxhbmsnIH0s
Cik7CgpAQUNMID0gKAogICAgeyBVc2VySWQgPT4gJ3Jvb3QnLCAgICAgICAgIyAtIHByaW5jaXBh
bGlkCiAgICAgIFJpZ2h0ICA9PiAnU3VwZXJVc2VyJywgfSwKCiAgICB7IEdyb3VwRG9tYWluID0+
ICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgIEdyb3VwVHlwZSA9PiAncHJpdmlsZWdlZCcsCiAgICAg
IFJpZ2h0ICA9PiAnU2hvd0FwcHJvdmFsc1RhYicsIH0sCgogICAgeyAgIEdyb3VwRG9tYWluID0+
ICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgICAgR3JvdXBUeXBlICAgPT4gJ1ByaXZpbGVnZWQnLAog
ICAgICAgIFJpZ2h0ICAgICAgID0+ICdTaG93U2VhcmNoQWR2YW5jZWQnLAogICAgfSwKICAgIHsg
ICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAogICAgICAgIEdyb3VwVHlwZSAgID0+
ICdQcml2aWxlZ2VkJywKICAgICAgICBSaWdodCAgICAgICA9PiAnU2hvd1NlYXJjaEJ1bGtVcGRh
dGUnLAogICAgfSwKICAgIHsgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAogICAg
ICAgIEdyb3VwVHlwZSAgID0+ICdQcml2aWxlZ2VkJywKICAgICAgICBSaWdodCAgICAgICA9PiAn
U2VlU2F2ZWRTZWFyY2gnLAogICAgfSwKKTsKCiMgUHJlZGVmaW5lZCBzZWFyY2hlcwoKQFNhdmVk
U2VhcmNoZXMgPSAoCiAgICB7IE5hbWUgPT4gJ015IFRpY2tldHMnLAogICAgICBEZXNjcmlwdGlv
biA9PiAnW18xXSBoaWdoZXN0IHByaW9yaXR5IHRpY2tldHMgSSBvd24nLCAjIGxvYwogICAgICBD
b250ZW50ICAgICA9PgogICAgICB7IEZvcm1hdCA9PiAgcXsnPGEgaHJlZj0iX19XZWJQYXRoX18v
VGlja2V0L0Rpc3BsYXkuaHRtbD9pZD1fX2lkX18iPl9faWRfXzwvYT4vVElUTEU6IycsfQogICAg
ICAgICAgICAgICAgIC4gcXsnPGEgaHJlZj0iX19XZWJQYXRoX18vVGlja2V0L0Rpc3BsYXkuaHRt
bD9pZD1fX2lkX18iPl9fU3ViamVjdF9fPC9hPi9USVRMRTpTdWJqZWN0Jyx9CiAgICAgICAgICAg
ICAgICAgLiBxe1ByaW9yaXR5LCBRdWV1ZU5hbWUsIEV4dGVuZGVkU3RhdHVzfSwKICAgICAgICBR
dWVyeSAgID0+ICIgT3duZXIgPSAnX19DdXJyZW50VXNlcl9fJyBBTkQgU3RhdHVzID0gJ19fQWN0
aXZlX18nIiwKICAgICAgICBPcmRlckJ5ID0+ICdQcmlvcml0eScsCiAgICAgICAgT3JkZXIgICA9
PiAnREVTQycKICAgICAgfSwKICAgIH0sCiAgICB7IE5hbWUgPT4gJ1Vub3duZWQgVGlja2V0cycs
CiAgICAgIERlc2NyaXB0aW9uID0+ICdbXzFdIG5ld2VzdCB1bm93bmVkIHRpY2tldHMnLCAjIGxv
YwogICAgICBDb250ZW50ICAgICA9PgojICdUYWtlJyAjbG9jCiAgICAgIHsgRm9ybWF0ID0+ICBx
eyc8YSBocmVmPSJfX1dlYlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+X19p
ZF9fPC9hPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgICAgLiBxeyc8YSBocmVmPSJfX1dlYlBh
dGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+X19TdWJqZWN0X188L2E+L1RJVExF
OlN1YmplY3QnLH0KICAgICAgICAgICAgICAgICAuIHF7UXVldWVOYW1lLCBFeHRlbmRlZFN0YXR1
cywgQ3JlYXRlZFJlbGF0aXZlLCB9CiAgICAgICAgICAgICAgICAgLiBxeyc8QSBIUkVGPSJfX1dl
YlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP0FjdGlvbj1UYWtlJmlkPV9faWRfXyI+X19sb2Mo
VGFrZSlfXzwvYT4vVElUTEU6TkJTUCd9LAogICAgICAgIFF1ZXJ5ICAgPT4gIiBPd25lciA9ICdO
b2JvZHknIEFORCBTdGF0dXMgPSAnX19BY3RpdmVfXyciLAogICAgICAgIE9yZGVyQnkgPT4gJ0Ny
ZWF0ZWQnLAogICAgICAgIE9yZGVyICAgPT4gJ0RFU0MnCiAgICAgIH0sCiAgICB9LAogICAgeyBO
YW1lID0+ICdCb29rbWFya2VkIFRpY2tldHMnLAogICAgICBEZXNjcmlwdGlvbiA9PiAnQm9va21h
cmtlZCBUaWNrZXRzJywgI2xvYwogICAgICBDb250ZW50ICAgICA9PgogICAgICB7IEZvcm1hdCA9
PiBxeyc8YSBocmVmPSJfX1dlYlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+
X19pZF9fPC9hPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgICAuIHF7JzxhIGhyZWY9Il9fV2Vi
UGF0aF9fL1RpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9X19pZF9fIj5fX1N1YmplY3RfXzwvYT4vVElU
TEU6U3ViamVjdCcsfQogICAgICAgICAgICAgICAgLiBxe1ByaW9yaXR5LCBRdWV1ZU5hbWUsIEV4
dGVuZGVkU3RhdHVzLCBCb29rbWFya30sCiAgICAgICAgUXVlcnkgICA9PiAiaWQgPSAnX19Cb29r
bWFya2VkX18nIiwKICAgICAgICBPcmRlckJ5ID0+ICdMYXN0VXBkYXRlZCcsCiAgICAgICAgT3Jk
ZXIgICA9PiAnREVTQycgfSwKICAgIH0sCik7CgpAQXR0cmlidXRlcyA9ICgKIyBpbml0aWFsIHJl
cG9ydHMKICAgIHsgTmFtZSA9PiAnUmVwb3J0c0luTWVudScsCiAgICAgIERlc2NyaXB0aW9uID0+
ICdDb250ZW50IG9mIHRoZSBSZXBvcnRzIG1lbnUnLCAjbG9jCiAgICAgIENvbnRlbnQgICAgID0+
IFsKICAgICAgICAgIHsKICAgICAgICAgICAgICBpZCAgICAgICAgICA9PiAncmVzb2x2ZWRieW93
bmVyJywKICAgICAgICAgICAgICB0aXRsZSAgICAgICA9PiAnUmVzb2x2ZWQgYnkgb3duZXInLCAj
IGxvYwogICAgICAgICAgICAgIHBhdGggICAgICAgID0+ICcvUmVwb3J0cy9SZXNvbHZlZEJ5T3du
ZXIuaHRtbCcsCiAgICAgICAgICB9LAogICAgICAgICAgewogICAgICAgICAgICAgIGlkICAgICAg
ICAgID0+ICdyZXNvbHZlZGluZGF0ZXJhbmdlJywKICAgICAgICAgICAgICB0aXRsZSAgICAgICA9
PiAnUmVzb2x2ZWQgaW4gZGF0ZSByYW5nZScsICMgbG9jCiAgICAgICAgICAgICAgcGF0aCAgICAg
ICAgPT4gJy9SZXBvcnRzL1Jlc29sdmVkQnlEYXRlcy5odG1sJywKICAgICAgICAgIH0sCiAgICAg
ICAgICB7CiAgICAgICAgICAgICAgaWQgICAgICAgICAgPT4gJ2NyZWF0ZWRpbmRhdGVyYW5nZScs
CiAgICAgICAgICAgICAgdGl0bGUgICAgICAgPT4gJ0NyZWF0ZWQgaW4gYSBkYXRlIHJhbmdlJywg
IyBsb2MKICAgICAgICAgICAgICBwYXRoICAgICAgICA9PiAnL1JlcG9ydHMvQ3JlYXRlZEJ5RGF0
ZXMuaHRtbCcsCiAgICAgICAgICB9LAogICAgICAgICAgewogICAgICAgICAgICAgIGlkICAgICAg
ICAgID0+ICd1c2VyX3RpbWUnLAogICAgICAgICAgICAgIHRpdGxlICAgICAgID0+ICdVc2VyIHRp
bWUgd29ya2VkJywgIyBsb2MKICAgICAgICAgICAgICBwYXRoICAgICAgICA9PiAnL1JlcG9ydHMv
VGltZVdvcmtlZFJlcG9ydC5odG1sJywKICAgICAgICAgIH0sCiAgICAgICAgICB7CiAgICAgICAg
ICAgICAgaWQgICAgICAgICAgPT4gJ3RpbWVfd29ya2VkX2Zyb21fc2VhcmNoJywKICAgICAgICAg
ICAgICB0aXRsZSAgICAgICA9PiAnVGltZSB3b3JrZWQgZnJvbSBzZWFyY2gnLCAjIGxvYwogICAg
ICAgICAgICAgIHBhdGggICAgICAgID0+ICcvUmVwb3J0cy9UaW1lU2VhcmNoLmh0bWwnLAogICAg
ICAgICAgfSwKICAgICAgXSwKICAgIH0sCiAgICB7CiAgICAgICAgJ05hbWUnICAgICAgICA9PiAn
RGVmYXVsdERhc2hib2FyZCcsCiAgICAgICAgJ0Rlc2NyaXB0aW9uJyA9PiAnRGVmYXVsdCBEYXNo
Ym9hcmQnLAogICAgICAgICdDb250ZW50JyAgICAgPT4gMSwKICAgIH0sCik7CgpAQ2xhc3NlcyA9
ICgKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICA9PiAnR2VuZXJhbCcsCiAgICAgICAg
RGVzY3JpcHRpb24gICAgICAgPT4gJ1RoZSBkZWZhdWx0IGNsYXNzJywKICAgICAgICBBdHRyaWJ1
dGVzICAgICAgICA9PiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgICAgPT4g
J1NraXAtRXNjYXBlSFRNTCcsCiAgICAgICAgICAgICAgICBDb250ZW50ID0+IDEsCiAgICAgICAg
ICAgIH0sCiAgICAgICAgXSwKICAgIH0sCik7CgpAQ3VzdG9tRmllbGRzID0gKAogICAgewogICAg
ICAgIE5hbWUgICAgICAgICAgICAgID0+ICdDb250ZW50JywKICAgICAgICBEZXNjcmlwdGlvbiAg
ICAgICA9PiAnQ29udGVudCcsCiAgICAgICAgTG9va3VwVHlwZSAgICAgICAgPT4gJ1JUOjpDbGFz
cy1SVDo6QXJ0aWNsZScsCiAgICAgICAgVHlwZSAgICAgICAgICAgICAgPT4gJ0hUTUwnLAogICAg
ICAgIE1heFZhbHVlcyAgICAgICAgID0+IDEsCiAgICB9LAopOwoKQERhc2hib2FyZHMgPSAoCiAg
ICB7CiAgICAgICAgTmFtZSAgICAgICAgPT4gJ0hvbWVwYWdlJywKICAgICAgICBEZXNjcmlwdGlv
biA9PiAnSG9tZXBhZ2UnLAogICAgICAgIENvbnRlbnQgICAgID0+IHsKICAgICAgICAgICAgRWxl
bWVudHMgPT4gWwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIExheW91dCAg
ID0+ICdjb2wtbWQtOCxjb2wtbWQtNCcsCiAgICAgICAgICAgICAgICAgICAgRWxlbWVudHMgPT4g
WwogICAgICAgICAgICAgICAgICAgICAgICBbCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdzZWFyY2gn
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAgICAgICA9PiAxLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAiVGlja2V0OiBNeSBU
aWNrZXRzIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBl
ID0+ICdzZWFyY2gnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAgICAg
ICA9PiAyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAi
VGlja2V0OiBVbm93bmVkIFRpY2tldHMiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwb3J0bGV0X3R5cGUgPT4gJ3NlYXJjaCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWQgICAgICAgICAgID0+IDMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGVzY3JpcHRpb24gID0+ICJUaWNrZXQ6IEJvb2ttYXJrZWQgVGlja2V0cyIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRsZXRfdHlwZSA9PiAnY29tcG9uZW50JywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wb25lbnQgICAgPT4gJ1F1aWNrQ3JlYXRl
JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1F1aWNr
Q3JlYXRlJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXRoICAgICAgICAgPT4g
Jy9FbGVtZW50cy9RdWlja0NyZWF0ZScsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB9LAog
ICAgICAgICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgICAgICAgICBbCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cG9ydGxldF90eXBlID0+ICdjb21wb25lbnQnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBvbmVudCAgICA9PiAnTXlSZW1pbmRlcnMnLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAnTXlSZW1pbmRlcnMnLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhdGggICAgICAgICA9PiAnL0VsZW1lbnRzL015UmVtaW5kZXJzJywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdjb21w
b25lbnQnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudCAgICA9PiAn
UXVldWVMaXN0JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAg
PT4gJ1F1ZXVlTGlzdCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGF0aCAgICAg
ICAgID0+ICcvRWxlbWVudHMvUXVldWVMaXN0JywKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcG9ydGxldF90eXBlID0+ICdjb21wb25lbnQnLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBvbmVudCAgICA9PiAnRGFzaGJvYXJkcycsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gID0+ICdEYXNoYm9hcmRzJywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXRoICAgICAgICAgPT4gJy9FbGVtZW50cy9EYXNoYm9h
cmRzJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAgICAg
ICAgIF0KICAgICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgfQogICAgICAgICAg
ICBdLAogICAgICAgIH0sCiAgICB9Cik7CgAAAAdjb250ZW50Chgvb3B0L3J0Ni9ldGMvaW5pdGlh
bGRhdGEAAAAIZmlsZW5hbWUKJEIxQjdGOTBBLUY0OTItMTFGMC1CNDhBLUU2QTZBQzMzMkM5RgAA
AAdmdWxsX2lkCiRCMjVENkY0OC1GNDkyLTExRjAtQjQ4QS1FNkE2QUMzMzJDOUYAAAANaW5kaXZp
ZHVhbF9pZAoFNi4wLjIAAAAKcnRfdmVyc2lvbgoGYmVmb3JlAAAABXN0YWdlCWltF44AAAAJdGlt
ZXN0YW1wBAMAAAAFCiRCMjVENkY0OC1GNDkyLTExRjAtQjQ4QS1FNkE2QUMzMzJDOUYAAAANaW5k
aXZpZHVhbF9pZAQCAAAAAgiBChNEb25lIGluc2VydGluZyBkYXRhAAAADHJldHVybl92YWx1ZQoF
Ni4wLjIAAAAKcnRfdmVyc2lvbgoFYWZ0ZXIAAAAFc3RhZ2UJaW0XjwAAAAl0aW1lc3RhbXAAAAAC
UlQEAgAAAAIEAwAAAAkKBmluc2VydAAAAAZhY3Rpb24BAACVbiMgSW5pdGlhbCBkYXRhIGZvciBh
IGZyZXNoIFJUSVIgSW5zdGFsbGF0aW9uLgoKZGllICJQbGVhc2UgYWRkIFJUOjpJUiB0byB5b3Vy
IFBsdWdpbnMgY29uZmlndXJhdGlvbiBiZWZvcmUgaW5pdGlhbGl6aW5nIHRoZSBkYXRhYmFzZS4g
U2VlIFJFQURNRSBmb3IgbW9yZSBpbmZvcm1hdGlvbi4iCiAgICB1bmxlc3MgZ3JlcCB7ICRfIGVx
ICdSVDo6SVInIH0gUlQtPkNvbmZpZy0+R2V0KCdQbHVnaW5zJyk7CgpASW5pdGlhbCA9ICgKICAg
IHN1YiB7CiAgICAgICAgdXNlIFJUOjpJUjsKICAgICAgICBSVDo6TGlmZWN5Y2xlLT5GaWxsQ2Fj
aGU7CiAgICAgICAgcmV0dXJuIDE7CiAgICB9LAopOwoKQFF1ZXVlcyA9IG1hcCB7CiAgICB7ICAg
TmFtZSAgICAgICAgICAgICAgPT4gUlQ6OklSOjpGcmllbmRseUxpZmVjeWNsZSgkXyksCiAgICAg
ICAgTGlmZWN5Y2xlICAgICAgICAgPT4gJF8sCiAgICAgICAgQ29ycmVzcG9uZEFkZHJlc3MgPT4g
IiIsCiAgICAgICAgQ29tbWVudEFkZHJlc3MgICAgPT4gIiIsCiAgICAgICAgSW5pdGlhbFByaW9y
aXR5ICAgPT4gKAogICAgICAgICAgICAkXyBlcSAnaW5jaWRlbnRzJwogICAgICAgICAgICA/IDUw
CiAgICAgICAgICAgIDogMAogICAgICAgICksCiAgICAgICAgU0xBRGlzYWJsZWQgPT4gKCAkXyBl
cSAnaW5jaWRlbnRzJyA/IDEgOiAwICksCiAgICB9Cn0gUlQ6OklSLT5MaWZlY3ljbGVzOwoKQEN1
c3RvbUZpZWxkcyA9ICgKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJUiBDb25zdGl0dWVuY3kn
LAogICAgICAgIFR5cGUgICAgICAgID0+ICdTZWxlY3RTaW5nbGUnLAogICAgICAgIERpc2FibGVk
ICAgID0+IDAsCiAgICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAgICAgICBMb29r
dXBUeXBlICA9PiAnUlQ6OlF1ZXVlJywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQXNzb2NpYXRl
cyBSVElSIHF1ZXVlcyB3aXRoIGNvbnN0aXR1ZW5jaWVzJywKICAgICAgICBWYWx1ZXMgICAgICA9
PiBbXQogICAgfSwKICAgIHsgICBOYW1lICAgICAgID0+ICdSVElSIGRlZmF1bHQgV0hPSVMgc2Vy
dmVyJywKICAgICAgICBUeXBlICAgICAgID0+ICdGcmVlZm9ybVNpbmdsZScsCiAgICAgICAgRGlz
YWJsZWQgICA9PiAwLAogICAgICAgIExvb2t1cFR5cGUgPT4gJ1JUOjpRdWV1ZScsCiAgICAgICAg
RGVzY3JpcHRpb24gPT4KICAgICAgICAgICAgJ0lmIHNldCwgZGVmaW5lcyB0aGUgZGVmYXVsdCBX
SE9JUyBzZXJ2ZXIgZm9yIGFuIFJUSVIgUXVldWUnLAogICAgICAgIEFwcGx5VG8gPT4gWyBtYXAg
eyAkXy0+e05hbWV9IH0gQFF1ZXVlcyBdCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdD
bGFzc2lmaWNhdGlvbicsCiAgICAgICAgVHlwZSAgICAgICAgPT4gJ1NlbGVjdFNpbmdsZScsCiAg
ICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAgICAgICBRdWV1ZSAgICAgICA9PiAn
SW5jaWRlbnRzJywKICAgICAgICBEaXNhYmxlZCAgICA9PiAwLAogICAgICAgIERlc2NyaXB0aW9u
ID0+ICdDbGFzc2lmaWNhdGlvbiBmb3IgSW5jaWRlbnRzIFJUSVIgcXVldWUnLAogICAgICAgIFZh
bHVlcyAgICAgID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICJTcGFtIiwgICAgICAgICAgICAg
IFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiU3lzdGVtIENvbXByb21p
c2UiLCBTb3J0T3JkZXIgPT4gMiB9LAogICAgICAgICAgICB7IE5hbWUgPT4gIlF1ZXJ5IiwgICAg
ICAgICAgICAgU29ydE9yZGVyID0+IDMgfSwKICAgICAgICAgICAgeyBOYW1lID0+ICJTY2FuIiwg
ICAgICAgICAgICAgIFNvcnRPcmRlciA9PiA0IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiRGVu
aWFsIG9mIFNlcnZpY2UiLCBTb3J0T3JkZXIgPT4gNSB9LAogICAgICAgICAgICB7IE5hbWUgPT4g
IlBpcmFjeSIsICAgICAgICAgICAgU29ydE9yZGVyID0+IDYgfSwKICAgICAgICBdLAogICAgfSwK
ICAgIHsgICBOYW1lICAgICAgICA9PiAnRnVuY3Rpb24nLAogICAgICAgIFR5cGUgICAgICAgID0+
ICdTZWxlY3RTaW5nbGUnLAogICAgICAgIFJlbmRlclR5cGUgID0+ICdEcm9wZG93bicsCiAgICAg
ICAgUXVldWUgICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwK
ICAgICAgICBEZXNjcmlwdGlvbiA9PiAnRnVuY3Rpb24gZm9yIEluY2lkZW50cyBSVElSIHF1ZXVl
JywKICAgICAgICBWYWx1ZXMgICAgICA9PiBbCiAgICAgICAgICAgIHsgTmFtZSA9PiAiQWJ1c2VE
ZXNrIiwgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiSW5jaWRl
bnRDb29yZCIsIFNvcnRPcmRlciA9PiAyIH0sCiAgICAgICAgXSwKICAgIH0sCiAgICB7ICAgTmFt
ZSAgICAgICAgPT4gJ1Jlc29sdXRpb24nLAogICAgICAgIFR5cGUgICAgICAgID0+ICdTZWxlY3RT
aW5nbGUnLAogICAgICAgIFJlbmRlclR5cGUgID0+ICdEcm9wZG93bicsCiAgICAgICAgUXVldWUg
ICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBE
ZXNjcmlwdGlvbiA9PiAnUmVzb2x1dGlvbiBmb3IgSW5jaWRlbnRzIFJUSVIgcXVldWUnLAogICAg
ICAgIFZhbHVlcyAgICAgID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICdzdWNjZXNzZnVsbHkg
cmVzb2x2ZWQnLCAgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAn
bm8gcmVzb2x1dGlvbiByZWFjaGVkJywgICAgICBTb3J0T3JkZXIgPT4gMiB9LAogICAgICAgICAg
ICB7IE5hbWUgPT4gJ25vIHJlc3BvbnNlIGZyb20gY3VzdG9tZXInLCAgU29ydE9yZGVyID0+IDMg
fSwKICAgICAgICAgICAgeyBOYW1lID0+ICdubyByZXNwb25zZSBmcm9tIG90aGVyIElTUCcsIFNv
cnRPcmRlciA9PiA0IH0sCiAgICAgICAgXSwKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSAgICAg
ICAgPT4gJ0NWRSBJRCcsCiAgICAgICAgVHlwZSAgICAgICAgPT4gJ0ZyZWVmb3JtTXVsdGlwbGUn
LAogICAgICAgIFF1ZXVlICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRz
JywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBEaXNhYmxl
ZCAgICA9PiAwLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdDVkUgSUQgZm9yIFJUSVIgcXVldWVz
JywKICAgICAgICBMaW5rVmFsdWVUbyA9PiAnaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh
aWwvX19DdXN0b21GaWVsZF9fI3Z1bG5DdXJyZW50RGVzY3JpcHRpb25UaXRsZScsCiAgICB9LAoK
ICAgIHsgICBOYW1lICAgICAgID0+ICdIb3cgUmVwb3J0ZWQnLAogICAgICAgIFR5cGUgICAgICAg
PT4gJ1NlbGVjdFNpbmdsZScsCiAgICAgICAgUmVuZGVyVHlwZSA9PiAnRHJvcGRvd24nLAogICAg
ICAgIFF1ZXVlICAgICAgPT4gJ0luY2lkZW50IFJlcG9ydHMnLAogICAgICAgIERpc2FibGVkICAg
PT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAgICAnSG93IHRoZSBpbmNpZGVu
dCB3YXMgcmVwb3J0ZWQgZm9yIEluY2lkZW50IFJlcG9ydHMgUlRJUiBxdWV1ZScsCiAgICAgICAg
VmFsdWVzID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICJBUEkiLCAgICAgICBTb3J0T3JkZXIg
PT4gMSB9LAogICAgICAgICAgICB7IE5hbWUgPT4gIkNMSSIsICAgICAgIFNvcnRPcmRlciA9PiAy
IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiRW1haWwiLCAgICAgU29ydE9yZGVyID0+IDMgfSwK
ICAgICAgICAgICAgeyBOYW1lID0+ICJSRVNUIiwgICAgICBTb3J0T3JkZXIgPT4gNCB9LAogICAg
ICAgICAgICB7IE5hbWUgPT4gIlJFU1QyIiwgICAgIFNvcnRPcmRlciA9PiA1IH0sCiAgICAgICAg
ICAgIHsgTmFtZSA9PiAiV2ViIiwgICAgICAgU29ydE9yZGVyID0+IDYgfSwKICAgICAgICAgICAg
eyBOYW1lID0+ICJUZWxlcGhvbmUiLCBTb3J0T3JkZXIgPT4gNyB9LAogICAgICAgICAgICB7IE5h
bWUgPT4gIk90aGVyIiwgICAgIFNvcnRPcmRlciA9PiA4IH0sCiAgICAgICAgXQogICAgfSwKICAg
IHsgICBOYW1lICAgICAgICA9PiAnUmVwb3J0ZXIgVHlwZScsCiAgICAgICAgVHlwZSAgICAgICAg
PT4gJ1NlbGVjdFNpbmdsZScsCiAgICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAg
ICAgICBRdWV1ZSAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgRGlzYWJsZWQg
ICAgPT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnUmVwb3J0ZXIgdHlwZSBmb3IgSW5jaWRl
bnQgUmVwb3J0cyBSVElSIHF1ZXVlJywKICAgICAgICBWYWx1ZXMgICAgICA9PiBbCiAgICAgICAg
ICAgIHsgTmFtZSA9PiAiY3VzdG9tZXIiLCAgICAgICAgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAg
ICAgICAgICAgIHsgTmFtZSA9PiAiZXh0ZXJuYWwgaW5kaXZpZHVhbCIsIFNvcnRPcmRlciA9PiAy
IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIgSVNQIiwgICAgICAgICAgIFNvcnRPcmRl
ciA9PiAzIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAicG9saWNlIiwgICAgICAgICAgICAgIFNv
cnRPcmRlciA9PiA0IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIgSVJUIiwgICAgICAg
ICAgIFNvcnRPcmRlciA9PiA1IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIiLCAgICAg
ICAgICAgICAgIFNvcnRPcmRlciA9PiA2IH0sCiAgICAgICAgXQogICAgfSwKICAgIHsgICBOYW1l
ID0+ICdJUCcsCiAgICAgICAgVHlwZSA9PiAnSVBBZGRyZXNzUmFuZ2VNdWx0aXBsZScsCiAgICAg
ICAgUXVldWUgPT4KICAgICAgICAgICAgWyAnSW5jaWRlbnRzJywgJ0luY2lkZW50IFJlcG9ydHMn
LCAnSW52ZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAogICAgICAgIERpc2FibGVk
ICAgID0+IDAsCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0lQIGFkZHJlc3MgZm9yIFJUSVIgcXVl
dWVzJywKICAgICAgICBMaW5rVmFsdWVUbyA9PgogICAgICAgICAgICAnX19XZWJQYXRoX18vUlRJ
Ui9Ub29scy9Mb29rdXAuaHRtbD90eXBlPWlwJnE9X19DdXN0b21GaWVsZF9fJnRpY2tldD1fX2lk
X18nCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdOZXRtYXNrJywKICAgICAgICBUeXBl
ICAgICAgICA9PiAnRnJlZWZvcm1TaW5nbGUnLAogICAgICAgIFF1ZXVlICAgICAgID0+ICdDb3Vu
dGVybWVhc3VyZXMnLAogICAgICAgIERpc2FibGVkICAgID0+IDAsCiAgICAgICAgRGVzY3JpcHRp
b24gPT4gJ05ldHdvcmsgbWFzayBmb3IgQ291bnRlcm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAg
TmFtZSAgICAgICAgPT4gJ1BvcnQnLAogICAgICAgIFR5cGUgICAgICAgID0+ICdGcmVlZm9ybVNp
bmdsZScsCiAgICAgICAgUXVldWUgICAgICAgPT4gJ0NvdW50ZXJtZWFzdXJlcycsCiAgICAgICAg
RGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnUG9ydCBmb3IgQ291bnRl
cm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1doZXJlIEJsb2NrZWQn
LAogICAgICAgIFR5cGUgICAgICAgID0+ICdGcmVlZm9ybVNpbmdsZScsCiAgICAgICAgUXVldWUg
ICAgICAgPT4gJ0NvdW50ZXJtZWFzdXJlcycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAg
ICAgICBEZXNjcmlwdGlvbiA9PiAnV2hlcmUgdGhlIGJsb2NrIGlzIHBsYWNlZCBmb3IgQ291bnRl
cm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ0N1c3RvbWVyJywKICAg
ICAgICBUeXBlICAgICAgICA9PiAnU2VsZWN0TXVsdGlwbGUnLAogICAgICAgIFF1ZXVlICAgICAg
ID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBEaXNhYmxlZCAgICA9PiAwLAogICAgICAg
IFZhbHVlcyAgICAgID0+IFtdLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdDdXN0b21lciBmb3Ig
SW5jaWRlbnQgUmVwb3J0cyBSVElSIHF1ZXVlJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAg
PT4gJ0N1c3RvbWVyJywKICAgICAgICBUeXBlICAgICAgICA9PiAnU2VsZWN0U2luZ2xlJywKICAg
ICAgICBSZW5kZXJUeXBlICA9PiAnRHJvcGRvd24nLAogICAgICAgIFF1ZXVlICAgICAgID0+ICdJ
bnZlc3RpZ2F0aW9ucycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBWYWx1ZXMg
ICAgICA9PiBbXSwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQ3VzdG9tZXIgZm9yIEludmVzdGln
YXRpb25zIFJUSVIgcXVldWUnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICA9PiAn
RG9tYWluJywKICAgICAgICBUeXBlICAgICAgICA9PiAnRnJlZWZvcm1NdWx0aXBsZScsCiAgICAg
ICAgUXVldWUgICAgICAgPT4gWyAnSW5jaWRlbnRzJywgJ0luY2lkZW50IFJlcG9ydHMnLCAnSW52
ZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAogICAgICAgIERpc2FibGVkICAgID0+
IDAsCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0RvbWFpbiBmb3IgUlRJUiBxdWV1ZXMnLAogICAg
ICAgIExpbmtWYWx1ZVRvID0+CiAgICAgICAgICAgICdfX1dlYlBhdGhfXy9SVElSL1Rvb2xzL0xv
b2t1cC5odG1sP3R5cGU9aG9zdCZxPV9fQ3VzdG9tRmllbGRfXyZ0aWNrZXQ9X19pZF9fJwogICAg
fSwKKTsKCkBTY3JpcEFjdGlvbnMgPSAoCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0
IEluY2lkZW50IER1ZScsICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlv
biA9PiAnU2V0IHRoZSBkdWUgZGF0ZSBvZiBwYXJlbnQgSW5jaWRlbnQnLCAgICAjIGxvYwogICAg
ICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX1NldER1ZUluY2lkZW50JywKICAgIH0sCiAgICB7ICAg
TmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0IEhvdyBSZXBvcnRlZCcsICAgICAgICAgICAgICAgICAg
ICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgaG93IHRoZSBJbmNpZGVudCBS
ZXBvcnQgd2FzIHJlcG9ydGVkJywgICAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJ
Ul9TZXRIb3dSZXBvcnRlZCcsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdSVElSIFJl
c29sdmUgQ2hpbGRyZW4nLCAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNj
cmlwdGlvbiA9PiAiUmVzb2x2ZSBhbiBJbmNpZGVudCdzIGNoaWxkcmVuIiwgICAgICAgICAgICAg
ICMgbG9jCiAgICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfUmVzb2x2ZUNoaWxkcmVuJywKICAg
IH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgQ2hhbmdlIENoaWxkIE93bmVyc2hpcCcs
ICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICJDaGFuZ2Ug
dGhlIG93bmVyc2hpcCBvZiBJbmNpZGVudCdzIGNoaWxkcmVuIiwgICAgIyBsb2MKICAgICAgICBF
eGVjTW9kdWxlICA9PiAnUlRJUl9DaGFuZ2VDaGlsZE93bmVyc2hpcCcsCiAgICB9LAogICAgeyAg
IE5hbWUgICAgICAgID0+ICdSVElSIENoYW5nZSBQYXJlbnQgT3duZXJzaGlwJywgICAgICAgICAg
ICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQ2hhbmdlIHRoZSBvd25lcnNo
aXAgb2YgdGhlIHBhcmVudCBJbmNpZGVudCcsICAgICMgbG9jCiAgICAgICAgRXhlY01vZHVsZSAg
PT4gJ1JUSVJfQ2hhbmdlUGFyZW50T3duZXJzaGlwJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAg
ICAgPT4gJ1JUSVIgT3BlbiBQYXJlbnQnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj
IGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdPcGVuIHRoZSBwYXJlbnQgSW5jaWRlbnQgd2hl
biBhIGNoaWxkIHJlb3BlbnMnLCAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9P
cGVuUGFyZW50JywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0IENvdW50
ZXJtZWFzdXJlIFN0YXR1cycsICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0
aW9uID0+ICdTZXQgdGhlIHN0YXR1cyBvZiBhIENvdW50ZXJtZWFzdXJlJywgICAgICAgICAgICAg
IyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9TZXRDb3VudGVybWVhc3VyZVN0YXR1
cycsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBSZXNv
bHV0aW9uJywgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAn
U2V0IHRoZSBkZWZhdWx0IHJlc29sdXRpb24gb2YgYW4gSW5jaWRlbnQnLCAgICAgICMgbG9jCiAg
ICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfU2V0SW5jaWRlbnRSZXNvbHV0aW9uJywKICAgIH0s
CiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywgICAg
ICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgSVAgY3Vz
dG9tIGZpZWxkIGZyb20gbWVzc2FnZSBjb250ZW50JywgICAgICAgIyBsb2MKICAgICAgICBFeGVj
TW9kdWxlICA9PiAnUlRJUl9GaW5kSVAnLAogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAn
UlRJUiBtZXJnZSBJUHMnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAg
ICAgICAgRGVzY3JpcHRpb24gPT4gJ01lcmdlIG11bHRpcGxlIElQcyBvbiB0aWNrZXQgbWVyZ2Un
LCAgICAgICAgICAgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX01lcmdlSVBz
JywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgQWN0aXZhdGUgVGlja2V0Jywg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdT
ZXQgc3RhdHVzIHRvIGZpcnN0IGFjdGl2ZSBwb3NzaWJsZScsICAgICAgICAgICAgIyBsb2MKICAg
ICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9BY3RpdmF0ZScsCiAgICB9LAogICAgeyAgIE5hbWUg
PT4gJ1JUSVIgQ2hhbmdlIENoaWxkIENvbnN0aXR1ZW5jaWVzJywKICAgICAgICBEZXNjcmlwdGlv
biA9PgogICAgICAgICAgICAnTW92ZSBhbGwgdGlja2V0cyByZWxhdGVkIHRvIGFuIGluY2lkZW50
IHRvIGEgbmV3IGNvbnN0aXR1ZW5jeScsCiAgICAgICAgRXhlY01vZHVsZSA9PiAnUlRJUl9DaGFu
Z2VDaGlsZENvbnN0aXR1ZW5jaWVzJwogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJ
UiBwYXJzZSBtZXNzYWdlIGZvciBEb21haW5zJywgICAgICAgICAgICAgICAgICMgbG9jCiAgICAg
ICAgRGVzY3JpcHRpb24gPT4gJ1NldCBEb21haW4gY3VzdG9tIGZpZWxkIGZyb20gbWVzc2FnZSBj
b250ZW50JywgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX0ZpbmREb21haW4n
LAogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJUiBtZXJnZSBEb21haW5zJywgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+
ICdNZXJnZSBtdWx0aXBsZSBEb21haW5zIG9uIHRpY2tldCBtZXJnZScsICAgICAgICAgICAgICMg
bG9jCiAgICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfTWVyZ2VEb21haW5zJywKICAgIH0sCiAg
ICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgQ1ZFcycsICAgICAg
ICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgQ1ZFIGN1c3RvbSBm
aWVsZCBmcm9tIG1lc3NhZ2UgY29udGVudCcsICAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9
PiAnUlRJUl9GaW5kQ1ZFJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgbWVy
Z2UgQ1ZFcycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBE
ZXNjcmlwdGlvbiA9PiAnTWVyZ2UgbXVsdGlwbGUgQ1ZFcyBvbiB0aWNrZXQgbWVyZ2UnLCAgICAg
ICAgICAgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX01lcmdlQ1ZFcycsCiAg
ICB9LAopOwoKQFNjcmlwQ29uZGl0aW9ucyA9ICgKCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAg
ICAgPT4gJ1JUSVIgQ3VzdG9tZXIgUmVzcG9uc2UnLCAgICAgICAgICAgICAgICAjIGxvYwogICAg
ICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdEZXRlY3QgYW4gZXh0ZXJuYWwgcmVzcG9uc2Un
LCAgICAgICAgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVz
cG9uZCcsCiAgICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1JUSVJfQ3VzdG9tZXJSZXNw
b25zZScsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdSVElSIFN0YWZm
IFJlc3BvbnNlJywgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAg
ICAgICAgICA9PiAnRGV0ZWN0IGFuIGludGVybmFsIHJlc3BvbnNlJywgICAgICAgICAgICMgbG9j
CiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0NvcnJlc3BvbmQnLAogICAgICAgIEV4
ZWNNb2R1bGUgICAgICAgICAgID0+ICdSVElSX1N0YWZmUmVzcG9uc2UnLAogICAgfSwKICAgIHsg
ICBOYW1lICAgICAgICAgICAgICAgICA9PiAnUlRJUiBDbG9zZSBUaWNrZXQnLCAgICAgICAgICAg
ICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ0EgdGlja2V0
IGlzIHJlamVjdGVkIG9yIHJlc29sdmVkJywgICAgICAjIGxvYwogICAgICAgIEFwcGxpY2FibGVU
cmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdTdGF0
dXNDaGFuZ2UnLAogICAgICAgIEFyZ3VtZW50ICAgICAgICAgICAgID0+ICdvbGQ6IGluaXRpYWws
IGFjdGl2ZTsgbmV3OiBpbmFjdHZlJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAg
ICAgPT4gJ1JUSVIgUmVvcGVuIFRpY2tldCcsICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAg
ICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdBIGNsb3NlZCB0aWNrZXQgaXMgcmVvcGVuZWQn
LCAgICAgICAgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55JywK
ICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnU3RhdHVzQ2hhbmdlJywKICAgICAgICBB
cmd1bWVudCAgICAgICAgICAgICA9PiAnb2xkOiBpbmFjdGl2ZTsgbmV3OiBpbml0aWFsLCBhY3Rp
dmUnLAogICAgfSwKICAgIHsgICBOYW1lID0+ICdSVElSIFJlcXVpcmUgRHVlIENoYW5nZScsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gPT4K
ICAgICAgICAgICAgJ1RoZSBkdWUgZGF0ZSBvZiB0aGUgcGFyZW50IGluY2lkZW50IG11c3QgYmUg
Y2hhbmdlZCcsICAgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0Fu
eScsCiAgICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1JUSVJfUmVxdWlyZUR1ZUNoYW5n
ZScsCiAgICB9LAogICAgeyAgIE5hbWUgPT4gJ1JUSVIgTGlua2luZyBUbyBJbmNpZGVudCcsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9Pgog
ICAgICAgICAgICAnV2hlbmV2ZXIgdGlja2V0IGlzIGxpbmtlZCB0byBpbmNpZGVudCBvciBjcmVh
dGVkIHdpdGggbGluaycKICAgICAgICAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRy
YW5zVHlwZXMgPT4gJ0NyZWF0ZSxBZGRMaW5rJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAg
ICA9PiAnUlRJUl9MaW5raW5nVG9JbmNpZGVudCcsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAg
ID0+ICdSVElSIE1lcmdlJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBs
b2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnV2hlbmV2ZXIgdGlja2V0IGlzIG1lcmdlZCBpbnRv
IGFub3RoZXIgb25lJywgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4g
J0FkZExpbmsnLAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdSVElSX01lcmdlJywK
ICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ1JUSVIgUmVxdWlyZSBJUnMg
QWN0aXZhdGlvbicsICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uICAgICAgICAg
ID0+ICJXaGVuZXZlciBpdCdzIHRpbWUgdG8gYWN0aXZhdGUgcmVwb3J0IiwgIyBsb2MKICAgICAg
ICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVzcG9uZCcsCiAgICAgICAgRXhlY01vZHVs
ZSAgICAgICAgICAgPT4gJ1JUSVJfUmVxdWlyZVJlcG9ydEFjdGl2YXRpb24nLAogICAgfSwKKTsK
CkBTY3JpcHMgPSAoCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIlNldEhvd1JlcG9ydGVkIiwK
ICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgU2Ny
aXBDb25kaXRpb24gPT4gJ09uIENyZWF0ZScsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JU
SVIgU2V0IEhvdyBSZXBvcnRlZCcsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwog
ICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk9uIENvcnJlc3BvbmQgQ2hhbmdlIFN0
YXR1cyBvZiB0aGUgQ291bnRlcm1lYXN1cmUiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdD
b3VudGVybWVhc3VyZXMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb3JyZXNwb25k
JywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBTZXQgQ291bnRlcm1lYXN1cmUgU3Rh
dHVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKICAgIHsgICBE
ZXNjcmlwdGlvbiAgICA9PiAiT24gTGlua2luZyBUbyBJbmNpZGVudCBBY3RpdmF0ZSBSZXBvcnQi
LAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBT
Y3JpcENvbmRpdGlvbiA9PiAnUlRJUiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3Jp
cEFjdGlvbiAgICA9PiAnUlRJUiBBY3RpdmF0ZSBUaWNrZXQnLAogICAgICAgIFRlbXBsYXRlICAg
ICAgID0+ICdCbGFuaycKICAgIH0sCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk9uIENvcnJl
c3BvbmQgKG5vdCBldmVyeSkgQWN0aXZhdGUgUmVwb3J0IiwKICAgICAgICBRdWV1ZSAgICAgICAg
ICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ1JUSVIg
UmVxdWlyZSBJUnMgQWN0aXZhdGlvbicsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIg
QWN0aXZhdGUgVGlja2V0JywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9
LAogICAgeyAgIERlc2NyaXB0aW9uICAgID0+ICJPbiBMaW5raW5nIFRvIEluY2lkZW50IENvcHkg
SVBzIiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAg
ICAgU2NyaXBDb25kaXRpb24gPT4gJ1JUSVIgTGlua2luZyBUbyBJbmNpZGVudCcsCiAgICAgICAg
U2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgSVBzJywKICAgICAgICBUZW1wbGF0ZSAgICAg
ICA9PiAnQmxhbmsnCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0IER1ZSBE
YXRlIE9uIEluY2lkZW50IiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiBbICdJbmNpZGVudCBS
ZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT
Y3JpcENvbmRpdGlvbiA9PiAnUlRJUiBSZXF1aXJlIER1ZSBDaGFuZ2UnLAogICAgICAgIFNjcmlw
QWN0aW9uICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBEdWUnLAogICAgICAgIFRlbXBsYXRlICAg
ICAgID0+ICdCbGFuaycsCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiUmVzb2x2
ZUFsbENoaWxkcmVuIiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnRzJywKICAg
ICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gU3RhdHVzIENoYW5nZScsCiAgICAgICAgU2NyaXBB
Y3Rpb24gICAgPT4gJ1JUSVIgUmVzb2x2ZSBDaGlsZHJlbicsCiAgICAgICAgVGVtcGxhdGUgICAg
ICAgPT4gJ0JsYW5rJywKICAgIH0sCgogICAgeyAgIERlc2NyaXB0aW9uICAgID0+ICJQcm9wYWdh
dGUgQ29uc3RpdHVlbmN5IENoYW5nZXMiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNp
ZGVudHMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBRdWV1ZSBDaGFuZ2UnLAogICAg
ICAgIFNjcmlwQWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBDaGlsZCBDb25zdGl0dWVuY2llcycs
CiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJywKICAgIH0sCgogICAgeyAgIERlc2Ny
aXB0aW9uICAgID0+ICJGaXhPd25lcnNoaXAiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJ
bmNpZGVudHMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBPd25lciBDaGFuZ2UnLAog
ICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBDaGlsZCBPd25lcnNoaXAnLAog
ICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdCbGFuaycsCiAgICB9LAogICAgeyAgIERlc2NyaXB0
aW9uICAgID0+ICJGaXhPd25lcnNoaXAiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0lu
Y2lkZW50IFJlcG9ydHMnLCAnSW52ZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAog
ICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBPd25lciBDaGFuZ2UnLAogICAgICAgIFNjcmlw
QWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBQYXJlbnQgT3duZXJzaGlwJywKICAgICAgICBUZW1w
bGF0ZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4g
IlJlb3BlbkluY2lkZW50IiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiBbICdJbmNpZGVudCBS
ZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT
Y3JpcENvbmRpdGlvbiA9PiAnT24gU3RhdHVzIENoYW5nZScsCiAgICAgICAgU2NyaXBBY3Rpb24g
ICAgPT4gJ1JUSVIgT3BlbiBQYXJlbnQnLAogICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdCbGFu
aycsCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0RGVmYXVsdEluY2lkZW50
UmVzb2x1dGlvbiIsCiAgICAgICAgUXVldWUgICAgICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAg
ICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIFN0YXR1cyBDaGFuZ2UnLAogICAgICAgIFNjcmlwQWN0
aW9uICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBSZXNvbHV0aW9uJywKICAgICAgICBUZW1wbGF0
ZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk5v
dGlmeU9uQ2xvc2UiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdDb3VudGVybWVhc3VyZXMn
LAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdSVElSIENsb3NlIFRpY2tldCcsCiAgICAgICAg
U2NyaXBBY3Rpb24gICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3JzJywKICAgICAgICBUZW1wbGF0ZSAg
ICAgICA9PiAnQ291bnRlcm1lYXN1cmVSZW1vdmVkJwogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRp
b24gPT4gIlNldElQRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsg
J0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50
ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcs
CiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywK
ICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAogICAgeyAgIERlc2NyaXB0
aW9uID0+ICJTZXRJUEZyb21Db250ZW50IiwKICAgICAgICBRdWV1ZSA9PgogICAgICAgICAgICBb
ICdJbmNpZGVudHMnLCAnSW5jaWRlbnQgUmVwb3J0cycsICdJbnZlc3RpZ2F0aW9ucycsICdDb3Vu
dGVybWVhc3VyZXMnIF0sCiAgICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIENyZWF0ZScsCiAg
ICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywKICAg
ICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlv
biA9PiAiTWVyZ2VJUHMiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsgJ0luY2lkZW50
cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJl
cycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBNZXJnZScsCiAgICAgICAgU2Ny
aXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgSVBzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9
PiAnQmxhbmsnCiAgICB9LAoKICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0RG9t
YWluRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycs
ICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycg
XSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAgICAgU2Ny
aXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgRG9tYWlucycsCiAgICAgICAg
VGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsKICAgICAgICBEZXNjcmlwdGlv
biAgICA9PiAiU2V0RG9tYWluRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+
IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0Nv
dW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ3JlYXRlJywK
ICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBwYXJzZSBtZXNzYWdlIGZvciBEb21haW5z
JywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAogICAgeyAgIERlc2Ny
aXB0aW9uID0+ICJNZXJnZURvbWFpbnMiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsg
J0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50
ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBNZXJnZScsCiAg
ICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgRG9tYWlucycsCiAgICAgICAgVGVt
cGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAi
T24gTGlua2luZyBUbyBJbmNpZGVudCBDb3B5IERvbWFpbnMiLAogICAgICAgIFF1ZXVlICAgICAg
ICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJ
UiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBt
ZXJnZSBEb21haW5zJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAoK
ICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0Q1ZFRnJvbUNvbnRlbnQiLAogICAg
ICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywg
J0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRp
dGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIg
cGFyc2UgbWVzc2FnZSBmb3IgQ1ZFcycsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5r
JwogICAgfSwKICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0Q1ZFRnJvbUNvbnRl
bnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBS
ZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT
Y3JpcENvbmRpdGlvbiA9PiAnT24gQ3JlYXRlJywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAn
UlRJUiBwYXJzZSBtZXNzYWdlIGZvciBDVkVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAn
QmxhbmsnCiAgICB9LAogICAgeyAgIERlc2NyaXB0aW9uID0+ICJNZXJnZUNWRXMiLAogICAgICAg
IFF1ZXVlID0+CiAgICAgICAgICAgIFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywg
J0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRp
dGlvbiA9PiAnUlRJUiBNZXJnZScsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVy
Z2UgQ1ZFcycsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsg
ICBEZXNjcmlwdGlvbiAgICA9PiAiT24gTGlua2luZyBUbyBJbmNpZGVudCBDb3B5IENWRXMiLAog
ICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBTY3Jp
cENvbmRpdGlvbiA9PiAnUlRJUiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3JpcEFj
dGlvbiAgICA9PiAnUlRJUiBtZXJnZSBDVkVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAn
QmxhbmsnCiAgICB9LAopOwoKIyBXQVJOSU5HOiBJZiB5b3UgY2hhbmdlIGNvbnRlbnQgb2YgdGhl
IHRlbXBsYXRlcywgZG9uJ3QgZm9yZ2V0IHRvCiMgbWVudGlvbiBpdCBpbiB0aGUgVVBHUkFESU5H
IGZpbGUKCkBUZW1wbGF0ZXMgPSAoCiAgICB7ICAgUXVldWUgICAgICAgPT4gJ0NvdW50ZXJtZWFz
dXJlcycsCiAgICAgICAgTmFtZSAgICAgICAgPT4gJ0F1dG9yZXBseScsCiAgICAgICAgRGVzY3Jp
cHRpb24gPT4gJ1NlbnQgd2hlbiBhIGNvdW50ZXJtZWFzdXJlIGlzIGNyZWF0ZWQnLAogICAgICAg
IENvbnRlbnQgICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzClN1YmplY3Q6IHsgJFRpY2tl
dC0+U3ViamVjdCB9Cgp7ICRUcmFuc2FjdGlvbi0+Q29udGVudCB9Cgp7IG15ICRvdXRwdXQgPSAi
IjsKICBteSBAbWFpbGZpZWxkcyA9ICggIklQIiwgIk5ldG1hc2siLCAiUG9ydCIsICJXaGVyZSBC
bG9ja2VkIiApOwoKICBteSAkQ3VzdG9tRmllbGRzID0gJFRpY2tldC0+UXVldWVPYmotPlRpY2tl
dEN1c3RvbUZpZWxkczsKICB3aGlsZSAoIG15ICRDdXN0b21GaWVsZCA9ICRDdXN0b21GaWVsZHMt
Pk5leHQgKSB7CiAgICBteSAkbmFtZSA9ICRDdXN0b21GaWVsZC0+TmFtZTsKICAgIG5leHQgdW5s
ZXNzIGdyZXAgbGMgJF8gZXEgbGMgJG5hbWUsIEBtYWlsZmllbGRzOwoKICAgIG15ICRWYWx1ZXMg
PSAkVGlja2V0LT5DdXN0b21GaWVsZFZhbHVlcyggJEN1c3RvbUZpZWxkLT5JZCApOwogICAgd2hp
bGUgKCBteSAkVmFsdWUgPSAkVmFsdWVzLT5OZXh0ICkgewogICAgICAkb3V0cHV0IC49ICRuYW1l
IC4iOiAiLiAkVmFsdWUtPkNvbnRlbnQgLiJcbiI7CiAgICB9CiAgfQogIHJldHVybiAkb3V0cHV0
Owp9Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGxlYXNlIGluY2x1ZGUgdGhlIHN0cmluZzoKCiAgICAgICAg
IFt7ICRUaWNrZXQtPlN1YmplY3RUYWcgfSAjeyAkVGlja2V0LT5pZCB9XQoKaW4gdGhlIHN1Ympl
Y3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFib3V0IHRoaXMgaXNzdWUuIFRv
IGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2UuCgogICAgICAgICAgICAgICAg
ICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAgICAgIHsgJFRpY2tldC0+UXVl
dWVPYmotPkNvcnJlc3BvbmRBZGRyZXNzIH0nLAogICAgfSwKICAgIHsgICBRdWV1ZSAgICAgICA9
PiAnQ291bnRlcm1lYXN1cmVzJywKICAgICAgICBOYW1lICAgICAgICA9PiAnQ291bnRlcm1lYXN1
cmVSZW1vdmVkJywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnU2VudCB3aGVuIGEgY291bnRlcm1l
YXN1cmUgaXMgcmVtb3ZlZCcsCiAgICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IHskVGlj
a2V0LT5TdWJqZWN0fQoKQ291bnRlcm1lYXN1cmUgI3skVGlja2V0LT5pZH0gd2FzIHJlbW92ZWQu
Cgp7IG15ICRvdXRwdXQgPSAiIjsKICBteSBAbWFpbGZpZWxkcyA9ICggIklQIiwgIk5ldG1hc2si
LCAiUG9ydCIsICJXaGVyZSBCbG9ja2VkIiApOwoKICBteSAkQ3VzdG9tRmllbGRzID0gJFRpY2tl
dC0+UXVldWVPYmotPlRpY2tldEN1c3RvbUZpZWxkczsKICB3aGlsZSAoIG15ICRDdXN0b21GaWVs
ZCA9ICRDdXN0b21GaWVsZHMtPk5leHQgKSB7CiAgICBteSAkbmFtZSA9ICRDdXN0b21GaWVsZC0+
TmFtZTsKICAgIG5leHQgdW5sZXNzIGdyZXAgbGMgJF8gZXEgbGMgJG5hbWUsIEBtYWlsZmllbGRz
OwoKICAgIG15ICRWYWx1ZXMgPSAkVGlja2V0LT5DdXN0b21GaWVsZFZhbHVlcyggJEN1c3RvbUZp
ZWxkLT5JZCApOwogICAgd2hpbGUgKCBteSAkVmFsdWUgPSAkVmFsdWVzLT5OZXh0ICkgewogICAg
ICAkb3V0cHV0IC49ICRuYW1lIC4iOiAiLiAkVmFsdWUtPkNvbnRlbnQgLiJcbiI7CiAgICB9CiAg
fQogIHJldHVybiAkb3V0cHV0Owp9Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGxlYXNlIGluY2x1ZGUgdGhl
IHN0cmluZzoKCiAgICAgICAgIFt7ICRUaWNrZXQtPlN1YmplY3RUYWcgfSAjeyRUaWNrZXQtPmlk
fV0KCmluIHRoZSBzdWJqZWN0IGxpbmUgb2YgYWxsIGZ1dHVyZSBjb3JyZXNwb25kZW5jZSBhYm91
dCB0aGlzIGlzc3VlLiBUbyBkbyBzbywgCnlvdSBtYXkgcmVwbHkgdG8gdGhpcyBtZXNzYWdlLgoK
ICAgICAgICAgICAgICAgICAgICAgICAgVGhhbmsgeW91LAogICAgICAgICAgICAgICAgICAgICAg
ICB7JFRpY2tldC0+UXVldWVPYmotPkNvcnJlc3BvbmRBZGRyZXNzKCl9JywKICAgIH0sCiAgICB7
ICAgUXVldWUgICAgICAgPT4gJ0ludmVzdGlnYXRpb25zJywKICAgICAgICBOYW1lICAgICAgICA9
PiAnQXV0b3JlcGx5JywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnU2VudCB3aGVuIGFuIGludmVz
dGlnYXRpb24gaXMgbGF1bmNoZWQnLAogICAgICAgIENvbnRlbnQgICAgID0+ICdSVC1BdHRhY2gt
TWVzc2FnZTogeWVzClN1YmplY3Q6IHskVGlja2V0LT5TdWJqZWN0fQoKeyRUcmFuc2FjdGlvbi0+
Q29udGVudCgpfQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQbGVhc2UgaW5jbHVkZSB0aGUgc3RyaW5nOgoK
ICAgICAgICAgW3sgJFRpY2tldC0+U3ViamVjdFRhZyB9ICN7JFRpY2tldC0+aWR9XQoKaW4gdGhl
IHN1YmplY3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFib3V0IHRoaXMgaXNz
dWUuIFRvIGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2UuCgogICAgICAgICAg
ICAgICAgICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAgICAgIHskVGlja2V0
LT5RdWV1ZU9iai0+Q29ycmVzcG9uZEFkZHJlc3MoKX0nLAogICAgfSwKKTsKCkBHcm91cHMgPSAo
CiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ0R1dHlUZWFtJywKICAgICAgICBEb21haW4gICAgICA9
PiAnVXNlckRlZmluZWQnLAogICAgICAgIEluc3RhbmNlICAgID0+ICcnLAogICAgICAgIERlc2Ny
aXB0aW9uID0+ICdEdXR5IFRlYW0gTWVtYmVycycsICAgICMgbG9jCiAgICB9LAopOwoKQEFDTCA9
ICgpOwpmb3IgbXkgJHF1ZXVlICggbWFwIHsgJF8tPntOYW1lfSB9IEBRdWV1ZXMgKSB7CiAgICBm
b3JlYWNoIG15ICRyaWdodCAoIFJUOjpJUi0+T3duZXJBbGxRdWV1ZVJpZ2h0cyApIHsKICAgICAg
ICBwdXNoIEBBQ0wsCiAgICAgICAgICAgICgKICAgICAgICAgICAgeyAgIEdyb3VwRG9tYWluID0+
ICdSVDo6UXVldWUtUm9sZScsCiAgICAgICAgICAgICAgICBHcm91cFR5cGUgICA9PiAnT3duZXIn
LAogICAgICAgICAgICAgICAgUXVldWUgICAgICAgPT4gJHF1ZXVlLAogICAgICAgICAgICAgICAg
UmlnaHQgICAgICAgPT4gJHJpZ2h0CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICk7CiAgICB9
Cn0KCmZvciBteSAkcXVldWUgKCBtYXAgeyAkXy0+e05hbWV9IH0gQFF1ZXVlcyApIHsKICAgIGZv
cmVhY2ggbXkgJHJpZ2h0ICggUlQ6OklSLT5EdXR5VGVhbUFsbFF1ZXVlUmlnaHRzICkgewogICAg
ICAgIHB1c2ggQEFDTCwgewogICAgICAgICAgICBHcm91cElkICAgICA9PiAnRHV0eVRlYW0nLCAg
ICAgICMgLSBwcmluY2lwYWxJZAogICAgICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNlckRlZmlu
ZWQnLAogICAgICAgICAgICBRdWV1ZSAgICAgICA9PiAkcXVldWUsCiAgICAgICAgICAgIFJpZ2h0
ICAgICAgID0+ICRyaWdodAogICAgICAgICAgICB9LAoKICAgIH0KfQoKcHVzaCBAQUNMLCBtYXAg
ewogICAgeyAgIFF1ZXVlICAgICAgID0+ICdJbnZlc3RpZ2F0aW9ucycsCiAgICAgICAgR3JvdXBU
eXBlICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJu
YWwnLAoKICAgICAgICBSaWdodCA9PiAkXwogICAgfQp9IFJUOjpJUi0+RXZlcnlvbmVJbnZlc3Rp
Z2F0aW9uUmlnaHRzKCk7CgpwdXNoIEBBQ0wsIG1hcCB7CiAgICB7ICAgUXVldWUgICAgICAgPT4g
J0luY2lkZW50cycsCiAgICAgICAgR3JvdXBUeXBlICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBH
cm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAoKICAgICAgICBSaWdodCA9PiAkXwogICAg
fQp9IFJUOjpJUi0+RXZlcnlvbmVJbmNpZGVudFJpZ2h0cygpOwoKcHVzaCBAQUNMLCBtYXAgewoK
ICAgIHsgICBHcm91cFR5cGUgICA9PiAnRXZlcnlvbmUnLAogICAgICAgIEdyb3VwRG9tYWluID0+
ICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgICAgUXVldWUgICAgICAgPT4gJ0luY2lkZW50IFJlcG9y
dHMnLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICRfCiAgICB9Cn0gUlQ6OklSLT5FdmVyeW9uZUlu
Y2lkZW50UmVwb3J0UmlnaHRzKCk7CgpwdXNoIEBBQ0wsIG1hcCB7CiAgICB7ICAgR3JvdXBUeXBl
ICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwn
LAogICAgICAgIFF1ZXVlICAgICAgID0+ICdDb3VudGVybWVhc3VyZXMnLAogICAgICAgIFJpZ2h0
ICAgICAgID0+ICRfCiAgICB9Cn0gUlQ6OklSLT5FdmVyeW9uZUNvdW50ZXJtZWFzdXJlUmlnaHRz
KCk7CgpwdXNoIEBBQ0wsICgKICAgIHsgICBHcm91cElkICAgICA9PiAnRHV0eVRlYW0nLCAgICAg
ICMgLSBwcmluY2lwYWxJZAogICAgICAgIEdyb3VwRG9tYWluID0+ICdVc2VyRGVmaW5lZCcsCiAg
ICAgICAgUXVldWUgICAgICAgPT4gMCwKICAgICAgICBSaWdodCAgICAgICA9PiAnTW9kaWZ5U2Vs
ZicsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAg
IyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAg
ICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVPd25TYXZl
ZFNlYXJjaCcsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAg
ICAgICAgIyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVk
JywKICAgICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1p
bk93blNhdmVkU2VhcmNoJywKICAgIH0sCiAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFt
JywgICAgICAgICAgICAjIC0gcHJpbmNpcGFsSWQKICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNl
ckRlZmluZWQnLAogICAgICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICAgICAgUmlnaHQgICAgICAg
PT4gJ1NlZUdyb3VwU2F2ZWRTZWFyY2gnLAogICAgfSwKICAgIHsgICBHcm91cElkICAgICA9PiAn
RHV0eVRlYW0nLCAgICAgICAgICAgICMgLSBwcmluY2lwYWxJZAogICAgICAgIEdyb3VwRG9tYWlu
ID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgUXVldWUgICAgICAgPT4gMCwKICAgICAgICBSaWdo
dCAgICAgICA9PiAnQWRtaW5Hcm91cFNhdmVkU2VhcmNoJywKICAgIH0sCiAgICB7ICAgR3JvdXBJ
ZCAgICAgPT4gJ0R1dHlUZWFtJywgICAgICAgICAgICAjIC0gcHJpbmNpcGFsSWQKICAgICAgICBH
cm91cERvbWFpbiA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIFF1ZXVlICAgICAgID0+IDAsCiAg
ICAgICAgUmlnaHQgICAgICAgPT4gJ1NlZU93bkRhc2hib2FyZCcsCiAgICB9LAogICAgeyAgIEdy
b3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5jaXBhbElkCiAgICAg
ICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1ZSAgICAgICA9PiAw
LAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pbk93bkRhc2hib2FyZCcsCiAgICB9LAogICAg
eyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5jaXBhbElk
CiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1ZSAgICAg
ICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVHcm91cERhc2hib2FyZCcsCiAgICB9
LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5j
aXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1
ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pbkdyb3VwRGFzaGJvYXJk
JywKICAgIH0sCiAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFtJywgICAgICAgICAgICAj
IC0gcHJpbmNpcGFsSWQKICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNlckRlZmluZWQnLAogICAg
ICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICAgICAgUmlnaHQgICAgICAgPT4gJ0xvYWRTYXZlZFNl
YXJjaCcsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAg
ICAgIyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywK
ICAgICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pblNh
dmVkU2VhcmNoJywKICAgIH0sCik7CgojIFByZWRlZmluZWQgc2VhcmNoZXMKCkBTYXZlZFNlYXJj
aGVzID0gKAogICAgeyBOYW1lID0+ICdOZXcgdW5saW5rZWQgSW5jaWRlbnQgUmVwb3J0cycsCiAg
ICAgIERlc2NyaXB0aW9uID0+ICdOZXcgdW5saW5rZWQgSW5jaWRlbnQgUmVwb3J0cycsICMgbG9j
CiAgICAgIENvbnRlbnQgPT4gewogICAgICAgICAgRXh0cmFRdWVyeVBhcmFtcyA9PiAnUlRJUics
CiAgICAgICAgICBGb3JtYXQgICAgICAgICAgID0+IHF7JzxiPjxhIGhyZWY9Il9fUlRJUlRpY2tl
dFVSSV9fIj5fX2lkX188L2E+PC9iPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgLiBxeyc8Yj48
YSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19TdWJqZWN0X188L2E+PC9iPi9USVRMRTpTdWJq
ZWN0Jyx9CiAgICAgICAgICAgICAgLiBxe1JlcXVlc3RvcnMsT3duZXJOYW1lLER1ZVJlbGF0aXZl
LFF1ZXVlTmFtZSxUYWtlfSwKICAgICAgICAgIE9yZGVyICAgICAgICAgICAgID0+ICdBU0N8QVND
fEFTQ3xBU0MnLAogICAgICAgICAgT3JkZXJCeSAgICAgICAgICAgPT4gJ0R1ZScsCiAgICAgICAg
ICBRdWVyeSAgICAgICAgICAgICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudF9yZXBvcnRzXCcg
QU5EIFN0YXR1cyA9IFwnbmV3XCcnLAogICAgICAgICAgUlRJUiAgICAgICAgICAgICAgPT4gMSwK
ICAgICAgICAgIFJUSVJTZWFyY2hFbmFibGVkID0+IDEsCiAgICAgICAgICBSb3dzUGVyUGFnZSAg
ICAgICA9PiAxMCwKICAgICAgfSwKICAgIH0sCiAgICB7IE5hbWUgPT4gJ015IG1vc3QgZHVlIGlu
Y2lkZW50cycsCiAgICAgIERlc2NyaXB0aW9uID0+ICdNb3N0IGR1ZSBpbmNpZGVudHMgSSBvd24n
LCAjIGxvYwogICAgICBDb250ZW50ID0+IHsKICAgICAgICAgIEV4dHJhUXVlcnlQYXJhbXMgPT4g
J1JUSVInLAogICAgICAgICAgRm9ybWF0ICAgICAgICAgICA9PiBxeyc8Yj48YSBocmVmPSJfX1JU
SVJUaWNrZXRVUklfXyI+X19pZF9fPC9hPjwvYj4vVElUTEU6IycsfQogICAgICAgICAgICAgIC4g
cXsnPGI+PGEgaHJlZj0iX19SVElSVGlja2V0VVJJX18iPl9fU3ViamVjdF9fPC9hPjwvYj4vVElU
TEU6U3ViamVjdCcsfQogICAgICAgICAgICAgIC4gcXtEdWVSZWxhdGl2ZSwgT3duZXJOYW1lLCBf
X1ByaW9yaXR5X18sfQogICAgICAgICAgICAgIC4gcXsnVW5yZWFkTWVzc2FnZXMvVElUTEU6VXBk
YXRlcyd9LAogICAgICAgICAgT3JkZXIgICAgICAgICAgICAgPT4gJ0FTQ3xERVNDfEFTQ3xBU0Mn
LAogICAgICAgICAgT3JkZXJCeSAgICAgICAgICAgPT4gJ0R1ZXxQcmlvcml0eScsCiAgICAgICAg
ICBRdWVyeSAgICAgICAgICAgICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudHNcJyBBTkQgU3Rh
dHVzID0gXCdfX0FjdGl2ZV9fXCcgQU5EIE93bmVyID0gXCdfX0N1cnJlbnRVc2VyX19cJycsCiAg
ICAgICAgICBSVElSICAgICAgICAgICAgICA9PiAxLAogICAgICAgICAgUlRJUlNlYXJjaEVuYWJs
ZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQYWdlICAgICAgID0+IDEwLAogICAgICB9LAogICAg
fSwKICAgIHsgTmFtZSA9PiAnTW9zdCBkdWUgdW5vd25lZCBpbmNpZGVudHMnLAogICAgICBEZXNj
cmlwdGlvbiA9PiAnTW9zdCBkdWUgdW5vd25lZCBpbmNpZGVudHMnLCAjIGxvYwogICAgICBDb250
ZW50ID0+IHsKICAgICAgICAgIEV4dHJhUXVlcnlQYXJhbXMgPT4gJ1JUSVInLAogICAgICAgICAg
Rm9ybWF0ICAgICAgICAgICA9PiBxeyc8Yj48YSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19p
ZF9fPC9hPjwvYj4vVElUTEU6IycsfQogICAgICAgICAgICAgIC4gcXsnPGI+PGEgaHJlZj0iX19S
VElSVGlja2V0VVJJX18iPl9fU3ViamVjdF9fPC9hPjwvYj4vVElUTEU6U3ViamVjdCcsfQogICAg
ICAgICAgICAgIC4gcXtEdWVSZWxhdGl2ZSwgT3duZXJOYW1lLCBfX1ByaW9yaXR5X18sfQogICAg
ICAgICAgICAgIC4gcXsnVW5yZWFkTWVzc2FnZXMvVElUTEU6VXBkYXRlcyd9LAogICAgICAgICAg
T3JkZXIgICAgICAgICAgICAgPT4gJ0FTQ3xERVNDfEFTQ3xBU0MnLAogICAgICAgICAgT3JkZXJC
eSAgICAgICAgICAgPT4gJ0R1ZXxQcmlvcml0eScsCiAgICAgICAgICBRdWVyeSAgICAgICAgICAg
ICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudHNcJyBBTkQgU3RhdHVzID0gXCdfX0FjdGl2ZV9f
XCcgQU5EIE93bmVyID0gXCdOb2JvZHlcJycsCiAgICAgICAgICBSVElSICAgICAgICAgICAgICA9
PiAxLAogICAgICAgICAgUlRJUlNlYXJjaEVuYWJsZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQ
YWdlICAgICAgID0+IDEwLAogICAgICB9LAogICAgfSwKICAgIHsgTmFtZSA9PiAnTW9zdCBkdWUg
aW5jaWRlbnRzJywKICAgICAgRGVzY3JpcHRpb24gPT4gJ01vc3QgZHVlIGluY2lkZW50cycsICMg
bG9jCiAgICAgIENvbnRlbnQgPT4gewogICAgICAgICAgRXh0cmFRdWVyeVBhcmFtcyA9PiAnUlRJ
UicsCiAgICAgICAgICBGb3JtYXQgICAgICAgICAgID0+IHF7JzxiPjxhIGhyZWY9Il9fUlRJUlRp
Y2tldFVSSV9fIj5fX2lkX188L2E+PC9iPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgLiBxeyc8
Yj48YSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19TdWJqZWN0X188L2E+PC9iPi9USVRMRTpT
dWJqZWN0Jyx9CiAgICAgICAgICAgICAgLiBxe0R1ZVJlbGF0aXZlLCBPd25lck5hbWUsIF9fUHJp
b3JpdHlfXyx9CiAgICAgICAgICAgICAgLiBxeydVbnJlYWRNZXNzYWdlcy9USVRMRTpVcGRhdGVz
J30sCiAgICAgICAgICBPcmRlciAgICAgICAgICAgICA9PiAnQVNDfERFU0N8QVNDfEFTQycsCiAg
ICAgICAgICBPcmRlckJ5ICAgICAgICAgICA9PiAnRHVlfFByaW9yaXR5JywKICAgICAgICAgIFF1
ZXJ5ICAgICAgICAgICAgID0+ICdMaWZlY3ljbGUgPSBcJ2luY2lkZW50c1wnIEFORCBTdGF0dXMg
PSBcJ19fQWN0aXZlX19cJycsCiAgICAgICAgICBSVElSICAgICAgICAgICAgICA9PiAxLAogICAg
ICAgICAgUlRJUlNlYXJjaEVuYWJsZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQYWdlICAgICAg
ID0+IDEwLAogICAgICB9LAogICAgfSwKKTsKCmZvciBteSAkY2YgKEBDdXN0b21GaWVsZHMpIHsK
ICAgIHB1c2ggQEFDTCwKICAgICAgICAoCiAgICAgICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5
VGVhbScsCiAgICAgICAgICAgIEdyb3VwRG9tYWluID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAg
ICAgIENGICAgICAgICAgID0+ICRjZi0+e05hbWV9LAogICAgICAgICAgICBRdWV1ZSAgICAgICA9
PiAkY2YtPntRdWV1ZX0sCiAgICAgICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVDdXN0b21GaWVs
ZCcsCiAgICAgICAgfSwKICAgICAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFtJywKICAg
ICAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICAgICAgQ0YgICAg
ICAgICAgPT4gJGNmLT57TmFtZX0sCiAgICAgICAgICAgIFF1ZXVlICAgICAgID0+ICRjZi0+e1F1
ZXVlfSwKICAgICAgICAgICAgUmlnaHQgICAgICAgPT4gJ01vZGlmeUN1c3RvbUZpZWxkJywKICAg
ICAgICB9LAogICAgICAgICk7Cn0KCkBDbGFzc2VzID0gKAogICAgewogICAgICAgIE5hbWUgICAg
ICAgID0+ICdUZW1wbGF0ZXMnLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdSZXNwb25zZSB0ZW1w
bGF0ZXMnLAogICAgICAgIEFwcGx5VG8gICAgID0+IFsgbWFwIHsgJF8tPntOYW1lfSB9IEBRdWV1
ZXMgXSwKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSA9PiAnSW5jaWRlbnRzIFByb2Nlc3Nlcycs
CiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ1Byb2Nlc3NlcyB0byBiZSBmb2xsb3dlZCBpbiB0aGUg
ZXZlbnQgb2YgYW4gaW5jaWRlbnQnLAogICAgICAgIEFwcGx5VG8gPT4gW10sCiAgICB9Cik7CgpA
QXJ0aWNsZXMgPSAoCiAgICB7CiAgICAgICAgTmFtZSA9PiAnU3BhbSBQcm9jZXNzJywKICAgICAg
ICBTdW1tYXJ5ID0+ICdUaGlzIGlzIHRoZSBzdW1tYXJ5IG9mIHRoZSBwcm9jZXNzIGZvciBoYW5k
bGluZyBzcGFtJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29u
dGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcg
c3BhbScsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAgICAgICBDbGFzcyA9PiAnSW5jaWRl
bnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgPT4gJ1N5c3RlbSBDb21w
cm9taXNlIFByb2Nlc3MnLAogICAgICAgIFN1bW1hcnkgPT4gJ1RoaXMgaXMgdGhlIHN1bW1hcnkg
b2YgdGhlIHByb2Nlc3MgZm9yIGhhbmRsaW5nIHN5c3RlbSBjb21wcm9taXNlJywKICAgICAgICBD
dXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDdXN0b21GaWVs
ZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUg
Y29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgc3lzdGVtIGNvbXByb21pc2UnLAog
ICAgICAgICAgICB9LAogICAgICAgIF0sCiAgICAgICAgQ2xhc3MgPT4gJ0luY2lkZW50cyBQcm9j
ZXNzZXMnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lID0+ICdRdWVyeSBQcm9jZXNzJywKICAg
ICAgICBTdW1tYXJ5ID0+ICdUaGlzIGlzIHRoZSBzdW1tYXJ5IG9mIHRoZSBwcm9jZXNzIGZvciBo
YW5kbGluZyBxdWVyaWVzJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAg
ICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFu
ZGxpbmcgcXVlcmllcycsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAgICAgICBDbGFzcyA9
PiAnSW5jaWRlbnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgPT4gJ1Nj
YW4gUHJvY2VzcycsCiAgICAgICAgU3VtbWFyeSA9PiAnVGhpcyBpcyB0aGUgc3VtbWFyeSBvZiB0
aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgc2NhbnMnLAogICAgICAgIEN1c3RvbUZpZWxkcyA9PiBb
CiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIEN1c3RvbUZpZWxkICA9PiAnQ29udGVudCcs
CiAgICAgICAgICAgICAgICBDb250ZW50ID0+ICdUaGlzIGlzIHRoZSBjb250ZW50IG9mIHRoZSBw
cm9jZXNzIGZvciBoYW5kbGluZyBzY2FucycsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAg
ICAgICBDbGFzcyA9PiAnSW5jaWRlbnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAg
IE5hbWUgPT4gJ0RlbmlhbCBvZiBTZXJ2aWNlIFByb2Nlc3MnLAogICAgICAgIFN1bW1hcnkgPT4g
J1RoaXMgaXMgdGhlIHN1bW1hcnkgb2YgdGhlIHByb2Nlc3MgZm9yIGhhbmRsaW5nIGRlbmlhbCBv
ZiBzZXJ2aWNlJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29u
dGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcg
ZGVuaWFsIG9mIHNlcnZpY2UnLAogICAgICAgICAgICB9LAogICAgICAgIF0sCiAgICAgICAgQ2xh
c3MgPT4gJ0luY2lkZW50cyBQcm9jZXNzZXMnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lID0+
ICdQaXJhY3kgUHJvY2VzcycsCiAgICAgICAgU3VtbWFyeSA9PiAnVGhpcyBpcyB0aGUgc3VtbWFy
eSBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgcGlyYWN5JywKICAgICAgICBDdXN0b21GaWVs
ZHMgPT4gWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0Nv
bnRlbnQnLAogICAgICAgICAgICAgICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBv
ZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgcGlyYWN5JywKICAgICAgICAgICAgfSwKICAgICAg
ICBdLAogICAgICAgIENsYXNzID0+ICdJbmNpZGVudHMgUHJvY2Vzc2VzJywKICAgIH0KKTsKCkBG
aW5hbCA9ICgKICAgIHN1YiB7CiAgICAgICAgJHwgPSAxOwogICAgICAgIG15ICRDdXJyZW50VXNl
ciA9IFJUOjpDdXJyZW50VXNlci0+bmV3KCk7CiAgICAgICAgJEN1cnJlbnRVc2VyLT5Mb2FkQnlO
YW1lKCdSVF9TeXN0ZW0nKTsKCiAgICAgICAgcmVxdWlyZSBSVDo6Q2xhc3M7CiAgICAgICAgbXkg
JGNsYXNzID0gUlQ6OkNsYXNzLT5uZXcoJEN1cnJlbnRVc2VyKTsKICAgICAgICAkY2xhc3MtPkxv
YWQoJ1RlbXBsYXRlcycpOwoKICAgICAgICByZXF1aXJlIFJUOjpBcnRpY2xlOwogICAgICAgIG15
ICRyZXNwb25zZSA9IFJUOjpDdXN0b21GaWVsZC0+bmV3KCRDdXJyZW50VXNlcik7CiAgICAgICAg
JHJlc3BvbnNlLT5Mb2FkKCdSZXNwb25zZScpOwogICAgICAgIHVubGVzcyAoJHJlc3BvbnNlLT5J
ZAogICAgICAgICAgICBhbmQgJHJlc3BvbnNlLT5Mb29rdXBUeXBlIGVxIFJUOjpBcnRpY2xlLT5D
dXN0b21GaWVsZExvb2t1cFR5cGUgKQogICAgICAgIHsKICAgICAgICAgICAgJFJUOjpMb2dnZXIt
PmluZm8oIkNyZWF0aW5nICdSZXNwb25zZScgQXJ0aWNsZSBjdXN0b20gZmllbGQuIik7CiAgICAg
ICAgICAgIG15ICggJGlkLCAkbXNnICkgPSAkcmVzcG9uc2UtPkNyZWF0ZSgKICAgICAgICAgICAg
ICAgIE5hbWUgICAgICAgID0+ICdSZXNwb25zZScsCiAgICAgICAgICAgICAgICBUeXBlICAgICAg
ICA9PiAnVGV4dCcsCiAgICAgICAgICAgICAgICBNYXhWYWx1ZXMgICA9PiAxLAogICAgICAgICAg
ICAgICAgRGVzY3JpcHRpb24gPT4gJ1Jlc3BvbnNlIHRvIGJlIGluc2VydGVkIGludG8gdGhlIHRp
Y2tldCcsCiAgICAgICAgICAgICAgICBMb29rdXBUeXBlICA9PiBSVDo6QXJ0aWNsZS0+Q3VzdG9t
RmllbGRMb29rdXBUeXBlLAogICAgICAgICAgICApOwogICAgICAgICAgICBkaWUgJG1zZyB1bmxl
c3MgJGlkOwogICAgICAgIH0KCiAgICAgICAgJHJlc3BvbnNlLT5BZGRUb09iamVjdCgkY2xhc3Mp
OwoKICAgICAgICBteSBAc2tpcHMgPSAoICJOYW1lIiwgIlN1bW1hcnkiLCAiQ0YtVGl0bGUtIiAu
ICRyZXNwb25zZS0+SWQgKTsKCiAgICAgICAgbXkgJGNvbnRlbnQgPSBSVDo6Q3VzdG9tRmllbGQt
Pm5ldygkQ3VycmVudFVzZXIpOwogICAgICAgICRjb250ZW50LT5Mb2FkQnlOYW1lKCBOYW1lID0+
ICdDb250ZW50JywgTG9va3VwVHlwZSA9PiBSVDo6QXJ0aWNsZS0+Q3VzdG9tRmllbGRMb29rdXBU
eXBlICk7CiAgICAgICAgaWYgKCAkY29udGVudC0+SWQgJiYgKCAkY29udGVudC0+SXNHbG9iYWwg
fHwgJGNvbnRlbnQtPklzQWRkZWQoICRjbGFzcy0+SWQgKSApICkgewogICAgICAgICAgICBwdXNo
IEBza2lwcywgIkNGLVRpdGxlLSIgLiAkY29udGVudC0+SWQsICJDRi1WYWx1ZS0iIC4gJGNvbnRl
bnQtPklkOwogICAgICAgIH0KCiAgICAgICAgJGNsYXNzLT5TZXRBdHRyaWJ1dGUoIE5hbWUgPT4g
IlNraXAtJF8iLCBDb250ZW50ID0+IDEgKSBmb3IgQHNraXBzOwoKICAgICAgICBteSAkZ3JvdXAg
PSBSVDo6R3JvdXAtPm5ldygkQ3VycmVudFVzZXIpOwogICAgICAgICRncm91cC0+TG9hZFVzZXJE
ZWZpbmVkR3JvdXAoIkR1dHlUZWFtIik7CiAgICAgICAgZGllICJDYW4ndCBsb2FkIGdyb3VwIiB1
bmxlc3MgJGdyb3VwLT5JZDsKCiAgICAgICAgKG15ICRyZXQsICRtc2cpID0gJGdyb3VwLT5Qcmlu
Y2lwYWxPYmotPkdyYW50UmlnaHQoIFJpZ2h0ID0+ICdTZWVDdXN0b21GaWVsZCcsIE9iamVjdCA9
PiAkY2xhc3MgKTsKICAgICAgICBkaWUgIkNvdWxkIG5vdCBncmFudCBEdXR5VGVhbSAnU2VlQ3Vz
dG9tRmllbGQnIG9uIGNsYXNzICdUZW1wbGF0ZXMnOiAkbXNnIiB1bmxlc3MgJHJldDsKCiAgICAg
ICAgJGdyb3VwLT5QcmluY2lwYWxPYmotPkdyYW50UmlnaHQoIFJpZ2h0ID0+ICRfLCBPYmplY3Qg
PT4gJHJlc3BvbnNlICkKICAgICAgICAgICAgZm9yIHF3L1NlZUN1c3RvbUZpZWxkIE1vZGlmeUN1
c3RvbUZpZWxkLzsKICAgICAgICAkZ3JvdXAtPlByaW5jaXBhbE9iai0+R3JhbnRSaWdodCggUmln
aHQgPT4gJF8sIE9iamVjdCA9PiAkY2xhc3MgKQogICAgICAgICAgICBmb3IKICAgICAgICAgICAg
cXcvQWRtaW5DbGFzcyBBZG1pblRvcGljcyBDcmVhdGVBcnRpY2xlIE1vZGlmeUFydGljbGUgTW9k
aWZ5QXJ0aWNsZVRvcGljcyBTZWVDbGFzcyBTaG93QXJ0aWNsZSBTaG93QXJ0aWNsZUhpc3Rvcnkg
RGVsZXRlQXJ0aWNsZS87CiAgICAgICAgJGdyb3VwLT5QcmluY2lwYWxPYmotPkdyYW50UmlnaHQo
CiAgICAgICAgICAgIFJpZ2h0ICA9PiBTaG93QXJ0aWNsZXNNZW51LAogICAgICAgICAgICBPYmpl
Y3QgPT4gUlQtPlN5c3RlbQogICAgICAgICk7CgogICAgfSwKICAgIHN1YiB7CiAgICAgICAgIyBU
aGUgbGFzdCA0IHNhdmVkIHNlYXJjaGVzIHNob3VsZCBiZSB0aGUgb25lcyBhZGRlZCBhYm92ZS4K
ICAgICAgICAjIERvbid0IGxvYWQgYnkgbmFtZSBzaW5jZSB0aGVyZSBjb3VsZCBiZSBvdGhlciBl
eGlzdGluZyBzZWFyY2hlcyB3aXRoCiAgICAgICAgIyB0aGVzZSBuYW1lcy4KICAgICAgICBteSAo
JG5ld19yZXBvcnRzLCAkdXNlcl9pbmNpZGVudHMsICRub2JvZHlfaW5jaWRlbnRzLCAkZHVlX2lu
Y2lkZW50cyk7CiAgICAgICAgbXkgJHNhdmVkX3NlYXJjaGVzID0gUlQ6OlNhdmVkU2VhcmNoZXMt
Pm5ldyhSVC0+U3lzdGVtVXNlcik7CiAgICAgICAgJHNhdmVkX3NlYXJjaGVzLT5VbkxpbWl0Owog
ICAgICAgICRkdWVfaW5jaWRlbnRzID0gJHNhdmVkX3NlYXJjaGVzLT5MYXN0OwoKICAgICAgICAk
bmV3X3JlcG9ydHMgPSBSVDo6U2F2ZWRTZWFyY2gtPm5ldyhSVC0+U3lzdGVtVXNlcik7CiAgICAg
ICAgJG5ld19yZXBvcnRzLT5Mb2FkKCAkZHVlX2luY2lkZW50cy0+SWQgLSAzICk7CgogICAgICAg
ICR1c2VyX2luY2lkZW50cyA9IFJUOjpTYXZlZFNlYXJjaC0+bmV3KFJULT5TeXN0ZW1Vc2VyKTsK
ICAgICAgICAkdXNlcl9pbmNpZGVudHMtPkxvYWQoICRkdWVfaW5jaWRlbnRzLT5JZCAtIDIgKTsK
CiAgICAgICAgJG5vYm9keV9pbmNpZGVudHMgPSBSVDo6U2F2ZWRTZWFyY2gtPm5ldyhSVC0+U3lz
dGVtVXNlcik7CiAgICAgICAgJG5vYm9keV9pbmNpZGVudHMtPkxvYWQoICRkdWVfaW5jaWRlbnRz
LT5JZCAtIDEgKTsKCiAgICAgICAgbXkgJHJ0aXJfZGFzaGJvYXJkID0gewogICAgICAgICAgICBF
bGVtZW50cyA9PiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTGF5b3V0
ICAgPT4gJ2NvbC1tZC04LGNvbC1tZC00JywKICAgICAgICAgICAgICAgICAgICBFbGVtZW50cyA9
PiBbCiAgICAgICAgICAgICAgICAgICAgICAgIFsKICAgICAgICAgICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdzZWFyY2gnLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWQgICAgICAgICAgID0+ICRuZXdfcmVwb3J0cy0+SWQs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1RpY2tldDogJyAu
ICRuZXdfcmVwb3J0cy0+RGVzY3JpcHRpb24sCiAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAg
ICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRs
ZXRfdHlwZSA9PiAnc2VhcmNoJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAg
ICAgICA9PiAkdXNlcl9pbmNpZGVudHMtPklkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGVzY3JpcHRpb24gID0+ICdUaWNrZXQ6ICcgLiAkdXNlcl9pbmNpZGVudHMtPkRlc2NyaXB0aW9u
LAogICAgICAgICAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0bGV0X3R5cGUgPT4gJ3NlYXJjaCcsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZCAgICAgICAgICAgPT4gJG5vYm9keV9pbmNpZGVudHMt
PklkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gID0+ICdUaWNrZXQ6
ICcgLiAkbm9ib2R5X2luY2lkZW50cy0+RGVzY3JpcHRpb24sCiAgICAgICAgICAgICAgICAgICAg
ICAgIH0sCiAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBvcnRsZXRfdHlwZSA9PiAnc2VhcmNoJywKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlkICAgICAgICAgICA9PiAkZHVlX2luY2lkZW50cy0+SWQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1RpY2tldDogJyAuICRkdWVfaW5jaWRlbnRzLT5EZXNj
cmlwdGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgICAgICAg
ICAgXSwKICAgICAgICAgICAgICAgICAgICAgICAgWwogICAgICAgICAgICAgICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0bGV0X3R5cGUgPT4gJ2NvbXBvbmVudCcs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wb25lbnQgICAgPT4gJy9SVElSL0VsZW1l
bnRzL1dvcmtXaXRoQ29uc3RpdHVlbmN5JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRl
c2NyaXB0aW9uICA9PiAnL1JUSVIvRWxlbWVudHMvV29ya1dpdGhDb25zdGl0dWVuY3knLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGF0aCAgICAgICAgID0+ICcvUlRJUi9FbGVtZW50cy9X
b3JrV2l0aENvbnN0aXR1ZW5jeScsCiAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAg
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRsZXRfdHlw
ZSA9PiAnY29tcG9uZW50JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudCAg
ICA9PiAnL1JUSVIvRWxlbWVudHMvUXVldWVTdW1tYXJ5JywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRlc2NyaXB0aW9uICA9PiAnL1JUSVIvRWxlbWVudHMvUXVldWVTdW1tYXJ5JywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhdGggICAgICAgICA9PiAnL1JUSVIvRWxlbWVudHMv
UXVldWVTdW1tYXJ5JywKICAgICAgICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAg
ICAgICAgICAgXQogICAgICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgIF0sCiAgICAgICAgfTsKCiAgICAgICAgbXkgJGRhc2hib2FyZCA9IFJUOjpEYXNoYm9h
cmQtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsKICAgICAgICBteSAoICRyZXQsICRtc2cgKSA9ICRk
YXNoYm9hcmQtPkNyZWF0ZSgKICAgICAgICAgICAgTmFtZSAgICAgICAgPT4gJ1JUSVJEZWZhdWx0
RGFzaGJvYXJkJywKICAgICAgICAgICAgRGVzY3JpcHRpb24gPT4gJ1JUSVIgRGVmYXVsdCBEYXNo
Ym9hcmQnLAogICAgICAgICAgICBQcmluY2lwYWxJZCA9PiBSVC0+U3lzdGVtVXNlci0+UHJpbmNp
cGFsSWQsCiAgICAgICAgICAgIENvbnRlbnQgPT4gJHJ0aXJfZGFzaGJvYXJkLAogICAgICAgICk7
CgogICAgICAgIGlmICggISRyZXQgKSB7CiAgICAgICAgICAgIFJULT5Mb2dnZXItPmVycm9yKCJD
b3VsZG4ndCBjcmVhdGUgUlRJUkRlZmF1bHREYXNoYm9hcmQ6ICRtc2ciKTsKICAgICAgICB9Cgog
ICAgICAgIGlmICggJHJldCApIHsKICAgICAgICAgICAgKCAkcmV0LCAkbXNnICkgPSBSVC0+U3lz
dGVtLT5TZXRBdHRyaWJ1dGUoCiAgICAgICAgICAgICAgICAnTmFtZScgICAgICAgID0+ICdSVElS
RGVmYXVsdERhc2hib2FyZCcsCiAgICAgICAgICAgICAgICAnRGVzY3JpcHRpb24nID0+ICdSVElS
IERlZmF1bHQgRGFzaGJvYXJkJywKICAgICAgICAgICAgICAgICdDb250ZW50JyAgICAgPT4gJGRh
c2hib2FyZC0+SWQsCiAgICAgICAgICAgICk7CiAgICAgICAgICAgIGlmICggISRyZXQgKSB7CiAg
ICAgICAgICAgICAgICBSVC0+TG9nZ2VyLT5lcnJvcigiQ291bGRuJ3Qgc2V0IFJUSVJEZWZhdWx0
RGFzaGJvYXJkOiAkbXNnIik7CiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICB9LAogICAgc3Vi
IHsKICAgICAgICBteSAkY2xhc3MgPSBSVDo6Q2xhc3MtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsK
ICAgICAgICBteSAoJG9rLCAkbXNnKSA9ICRjbGFzcy0+TG9hZCgnSW5jaWRlbnRzIFByb2Nlc3Nl
cycpOwogICAgICAgIFJULT5Mb2dnZXItPmVycm9yKCJVbmFibGUgdG8gbG9hZCBjbGFzcyBJbmNp
ZGVudHMgUHJvY2Vzc2VzOiAkbXNnIikgdW5sZXNzICRvazsKCiAgICAgICAgbXkgJGNvbnRlbnQg
PSBSVDo6Q3VzdG9tRmllbGQtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsKICAgICAgICAkY29udGVu
dC0+TG9hZEJ5TmFtZSggTmFtZSA9PiAnQ29udGVudCcsIExvb2t1cFR5cGUgPT4gUlQ6OkFydGlj
bGUtPkN1c3RvbUZpZWxkTG9va3VwVHlwZSApOwoKICAgICAgICBteSBAc2tpcHMgPSAoICJOYW1l
IiwgIlN1bW1hcnkiLCAiTGlua1RvVGlja2V0IiwgJGNvbnRlbnQtPklkID8gIkNGLVRpdGxlLSIg
LiAkY29udGVudC0+SWQgOiAoKSApOwogICAgICAgICRjbGFzcy0+U2V0QXR0cmlidXRlKE5hbWUg
PT4gIlNraXAtJF8iLCBDb250ZW50ID0+IDEpIGZvciBAc2tpcHM7CgogICAgICAgIG15ICRncm91
cCA9IFJUOjpHcm91cC0+bmV3KCBSVC0+U3lzdGVtVXNlciApOwogICAgICAgICRncm91cC0+TG9h
ZFVzZXJEZWZpbmVkR3JvdXAoIkR1dHlUZWFtIik7CiAgICAgICAgZGllICJDYW4ndCBsb2FkIGdy
b3VwIiB1bmxlc3MgJGdyb3VwLT5JZDsKICAgICAgICAkZ3JvdXAtPlByaW5jaXBhbE9iai0+R3Jh
bnRSaWdodCggUmlnaHQgPT4gJF8sIE9iamVjdCA9PiAkY2xhc3MgKQogICAgICAgICAgICBmb3Ig
cXcvU2hvd0FydGljbGUgU2VlQ3VzdG9tRmllbGQgQWRtaW5DbGFzcyBBZG1pblRvcGljcyBDcmVh
dGVBcnRpY2xlIE1vZGlmeUFydGljbGUgTW9kaWZ5QXJ0aWNsZVRvcGljcyBTZWVDbGFzcyBTaG93
QXJ0aWNsZUhpc3RvcnkgRGVsZXRlQXJ0aWNsZS87CiAgICAgICAgfQopOwoAAAAHY29udGVudAoF
Ni4wLjEAAAALZXh0X3ZlcnNpb24KGS9hcHAvcnRpci9ldGMvaW5pdGlhbGRhdGEAAAAIZmlsZW5h
bWUKJEIzN0Y3QTZBLUY0OTItMTFGMC1CNTE5LTg4MENDRkQ3RUQ5NAAAAAdmdWxsX2lkCiRCM0Mz
Q0VFQS1GNDkyLTExRjAtQjUxOS04ODBDQ0ZEN0VEOTQAAAANaW5kaXZpZHVhbF9pZAoFNi4wLjIA
AAAKcnRfdmVyc2lvbgoGYmVmb3JlAAAABXN0YWdlCWltF5AAAAAJdGltZXN0YW1wBAMAAAAFCiRC
M0MzQ0VFQS1GNDkyLTExRjAtQjUxOS04ODBDQ0ZEN0VEOTQAAAANaW5kaXZpZHVhbF9pZAQCAAAA
AgiBChNEb25lIGluc2VydGluZyBkYXRhAAAADHJldHVybl92YWx1ZQoFNi4wLjIAAAAKcnRfdmVy
c2lvbgoFYWZ0ZXIAAAAFc3RhZ2UJaW0XkgAAAAl0aW1lc3RhbXAAAAAGUlQ6OklS
',	'storable',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:38'),
(2,	'QueueCacheNeedsUpdate',	NULL,	'1768757386.19558',	'',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:29:46'),
(3,	'CatalogCacheNeedsUpdate',	NULL,	'1768757386.29641',	'',	'RT::System',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:29:46');

DROP TABLE IF EXISTS "authtokens";
DROP SEQUENCE IF EXISTS authtokens_id_seq;
CREATE SEQUENCE authtokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 5 CACHE 1;

CREATE TABLE "public"."authtokens" (
    "id" integer DEFAULT nextval('authtokens_id_seq') NOT NULL,
    "owner" integer DEFAULT '0' NOT NULL,
    "token" character varying(256),
    "description" character varying(255) DEFAULT '' NOT NULL,
    "lastused" timestamp,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "expires" timestamp,
    CONSTRAINT "authtokens_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX authtokensowner ON public.authtokens USING btree (owner);

INSERT INTO "authtokens" ("id", "owner", "token", "description", "lastused", "creator", "created", "lastupdatedby", "lastupdated", "expires") VALUES
(1,	14,	'!bcrypt!12!PiRGTAhyMXh3isa/NhEc6OOul4z92CU9E778FKKZPhMSkPrkCmarq',	'My init token',	NULL,	14,	'2026-01-18 17:27:37',	14,	'2026-01-18 17:27:37',	NULL),
(2,	44,	'!bcrypt!12!QonDLKC/Bmkv7eNXX4pN9OdWnktSPwhH5.nx2.uaGHxyxbsci/5Ea',	'HeroToken',	NULL,	44,	'2026-01-18 17:36:27',	44,	'2026-01-18 17:36:27',	NULL),
(3,	46,	'!bcrypt!12!UOdPdk/waWBCl.es5zaP2upCFEquxuCQIVZdSG7JJv0H/fbEw4A7G',	'Invisible token',	NULL,	46,	'2026-01-18 17:38:04',	46,	'2026-01-18 17:38:04',	NULL),
(4,	48,	'!bcrypt!12!rd/TD8pbUqQsxkPX40eEPOthLGqSGKMXgmTRVghJK6PCaE95TT6Q.',	'Madness is like token',	NULL,	48,	'2026-01-18 17:40:32',	48,	'2026-01-18 17:40:32',	NULL);

DROP TABLE IF EXISTS "cachedgroupmembers";
DROP SEQUENCE IF EXISTS cachedgroupmembers_id_seq;
CREATE SEQUENCE cachedgroupmembers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 68 CACHE 1;

CREATE TABLE "public"."cachedgroupmembers" (
    "id" integer DEFAULT nextval('cachedgroupmembers_id_seq') NOT NULL,
    "groupid" integer,
    "memberid" integer,
    "via" integer,
    "immediateparentid" integer,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "cachedgroupmembers_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX cachedgroupmembers2 ON public.cachedgroupmembers USING btree (memberid, groupid, disabled);

CREATE INDEX disgroumem ON public.cachedgroupmembers USING btree (groupid, memberid, disabled);

CREATE INDEX cachedgroupmembers3 ON public.cachedgroupmembers USING btree (memberid, immediateparentid);

CREATE INDEX cachedgroupmembers4 ON public.cachedgroupmembers USING btree (via);

INSERT INTO "cachedgroupmembers" ("id", "groupid", "memberid", "via", "immediateparentid", "disabled") VALUES
(1,	2,	2,	1,	2,	0),
(56,	45,	45,	56,	45,	0),
(2,	2,	1,	2,	2,	0),
(3,	3,	3,	3,	3,	0),
(57,	45,	44,	57,	45,	0),
(4,	4,	4,	4,	4,	0),
(5,	5,	5,	5,	5,	0),
(58,	3,	44,	58,	3,	0),
(6,	7,	7,	6,	7,	0),
(7,	7,	6,	7,	7,	0),
(59,	4,	44,	59,	4,	0),
(8,	3,	6,	8,	3,	0),
(9,	5,	6,	9,	5,	0),
(60,	47,	47,	60,	47,	0),
(10,	8,	8,	10,	8,	0),
(11,	8,	6,	11,	8,	0),
(61,	47,	46,	61,	47,	0),
(12,	9,	9,	12,	9,	0),
(13,	10,	10,	13,	10,	0),
(62,	3,	46,	62,	3,	0),
(14,	11,	11,	14,	11,	0),
(15,	12,	12,	15,	12,	0),
(63,	4,	46,	63,	4,	0),
(16,	13,	13,	16,	13,	0),
(17,	15,	15,	17,	15,	0),
(64,	49,	49,	64,	49,	0),
(18,	15,	14,	18,	15,	0),
(19,	3,	14,	19,	3,	0),
(65,	49,	48,	65,	49,	0),
(20,	4,	14,	20,	4,	0),
(21,	16,	16,	21,	16,	0),
(66,	3,	48,	66,	3,	0),
(22,	17,	17,	22,	17,	0),
(23,	18,	18,	23,	18,	0),
(67,	4,	48,	67,	4,	0),
(24,	18,	6,	24,	18,	0),
(25,	19,	19,	25,	19,	0),
(26,	20,	20,	26,	20,	0),
(27,	21,	21,	27,	21,	0),
(28,	22,	22,	28,	22,	0),
(29,	22,	6,	29,	22,	0),
(30,	23,	23,	30,	23,	0),
(31,	24,	24,	31,	24,	0),
(32,	24,	6,	32,	24,	0),
(33,	25,	25,	33,	25,	0),
(34,	26,	26,	34,	26,	0),
(35,	27,	27,	35,	27,	0),
(36,	28,	28,	36,	28,	0),
(37,	29,	29,	37,	29,	0),
(38,	30,	30,	38,	30,	0),
(39,	30,	6,	39,	30,	0),
(40,	31,	31,	40,	31,	0),
(41,	32,	32,	41,	32,	0),
(42,	33,	33,	42,	33,	0),
(43,	34,	34,	43,	34,	0),
(44,	34,	6,	44,	34,	0),
(45,	35,	35,	45,	35,	0),
(46,	36,	36,	46,	36,	0),
(47,	37,	37,	47,	37,	0),
(48,	38,	38,	48,	38,	0),
(49,	38,	6,	49,	38,	0),
(50,	39,	39,	50,	39,	0),
(51,	40,	40,	51,	40,	0),
(52,	41,	41,	52,	41,	0),
(53,	42,	42,	53,	42,	0),
(54,	42,	6,	54,	42,	0),
(55,	43,	43,	55,	43,	0);

DROP TABLE IF EXISTS "catalogs";
DROP SEQUENCE IF EXISTS catalogs_id_seq;
CREATE SEQUENCE catalogs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 2 CACHE 1;

CREATE TABLE "public"."catalogs" (
    "id" integer DEFAULT nextval('catalogs_id_seq') NOT NULL,
    "name" character varying(255) DEFAULT '' NOT NULL,
    "lifecycle" character varying(32) DEFAULT 'assets' NOT NULL,
    "description" character varying(255) DEFAULT '' NOT NULL,
    "disabled" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "catalogs_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX catalogsname ON public.catalogs USING btree (lower((name)::text));

CREATE INDEX catalogsdisabled ON public.catalogs USING btree (disabled);

INSERT INTO "catalogs" ("id", "name", "lifecycle", "description", "disabled", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'General assets',	'assets',	'The default catalog',	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34');

DROP TABLE IF EXISTS "classes";
DROP SEQUENCE IF EXISTS classes_id_seq;
CREATE SEQUENCE classes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 4 CACHE 1;

CREATE TABLE "public"."classes" (
    "id" integer DEFAULT nextval('classes_id_seq') NOT NULL,
    "name" character varying(255) DEFAULT '' NOT NULL,
    "description" character varying(255) DEFAULT '' NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "disabled" smallint DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "classes_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "classes" ("id", "name", "description", "sortorder", "disabled", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'General',	'The default class',	0,	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(2,	'Templates',	'Response templates',	0,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(3,	'Incidents Processes',	'Processes to be followed in the event of an incident',	0,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36');

DROP TABLE IF EXISTS "configurations";
DROP SEQUENCE IF EXISTS configurations_id_seq;
CREATE SEQUENCE configurations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."configurations" (
    "id" integer DEFAULT nextval('configurations_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content" text,
    "contenttype" character varying(80),
    "disabled" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "configurations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX configurations1 ON public.configurations USING btree (lower((name)::text), disabled);

CREATE INDEX configurations2 ON public.configurations USING btree (disabled);


DROP TABLE IF EXISTS "customfields";
DROP SEQUENCE IF EXISTS customfields_id_seq;
CREATE SEQUENCE customfields_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 18 CACHE 1;

CREATE TABLE "public"."customfields" (
    "id" integer DEFAULT nextval('customfields_id_seq') NOT NULL,
    "name" character varying(200),
    "type" character varying(200),
    "rendertype" character varying(64),
    "maxvalues" integer DEFAULT '0' NOT NULL,
    "valuesclass" character varying(64),
    "basedon" integer,
    "pattern" character varying(65536),
    "lookuptype" character varying(255) NOT NULL,
    "entryhint" character varying(255),
    "validationhint" character varying(255),
    "description" character varying(255),
    "sortorder" integer DEFAULT '0' NOT NULL,
    "uniquevalues" integer DEFAULT '0' NOT NULL,
    "canonicalizeclass" character varying(64),
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "customfields_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "customfields" ("id", "name", "type", "rendertype", "maxvalues", "valuesclass", "basedon", "pattern", "lookuptype", "entryhint", "validationhint", "description", "sortorder", "uniquevalues", "canonicalizeclass", "creator", "created", "lastupdatedby", "lastupdated", "disabled") VALUES
(1,	'Content',	'HTML',	NULL,	1,	NULL,	NULL,	'',	'RT::Class-RT::Article',	'Fill in one HTML area',	NULL,	'Content',	0,	0,	NULL,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34',	0),
(2,	'RTIR Constituency',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue',	'Select one value',	NULL,	'Associates RTIR queues with constituencies',	0,	0,	NULL,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36',	0),
(3,	'RTIR default WHOIS server',	'Freeform',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue',	'Enter one value',	NULL,	'If set, defines the default WHOIS server for an RTIR Queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:37',	0),
(4,	'Classification',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'Classification for Incidents RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(5,	'Function',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'Function for Incidents RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(6,	'Resolution',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'Resolution for Incidents RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(7,	'CVE ID',	'Freeform',	NULL,	0,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter multiple values',	NULL,	'CVE ID for RTIR queues',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(8,	'How Reported',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'How the incident was reported for Incident Reports RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(9,	'Reporter Type',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'Reporter type for Incident Reports RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(10,	'IP',	'IPAddressRange',	NULL,	0,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter multiple IP address ranges',	NULL,	'IP address for RTIR queues',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(11,	'Netmask',	'Freeform',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter one value',	NULL,	'Network mask for Countermeasures',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(12,	'Port',	'Freeform',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter one value',	NULL,	'Port for Countermeasures',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(13,	'Where Blocked',	'Freeform',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter one value',	NULL,	'Where the block is placed for Countermeasures',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(14,	'Customer',	'Select',	NULL,	0,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select multiple values',	NULL,	'Customer for Incident Reports RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(15,	'Customer',	'Select',	NULL,	1,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Select one value',	NULL,	'Customer for Investigations RTIR queue',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(16,	'Domain',	'Freeform',	NULL,	0,	NULL,	NULL,	'',	'RT::Queue-RT::Ticket',	'Enter multiple values',	NULL,	'Domain for RTIR queues',	0,	0,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37',	0),
(17,	'Response',	'Text',	NULL,	1,	NULL,	NULL,	'',	'RT::Class-RT::Article',	'Fill in one text area',	NULL,	'Response to be inserted into the ticket',	0,	0,	NULL,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0);

DROP TABLE IF EXISTS "customfieldvalues";
DROP SEQUENCE IF EXISTS customfieldvalues_id_seq;
CREATE SEQUENCE customfieldvalues_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 27 CACHE 1;

CREATE TABLE "public"."customfieldvalues" (
    "id" integer DEFAULT nextval('customfieldvalues_id_seq') NOT NULL,
    "customfield" integer NOT NULL,
    "name" character varying(200),
    "description" character varying(255),
    "sortorder" integer DEFAULT '0' NOT NULL,
    "category" character varying(255),
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "customfieldvalues_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX customfieldvalues1 ON public.customfieldvalues USING btree (customfield);

INSERT INTO "customfieldvalues" ("id", "customfield", "name", "description", "sortorder", "category", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	4,	'Spam',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(2,	4,	'System Compromise',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(3,	4,	'Query',	NULL,	3,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(4,	4,	'Scan',	NULL,	4,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(5,	4,	'Denial of Service',	NULL,	5,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(6,	4,	'Piracy',	NULL,	6,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(7,	5,	'AbuseDesk',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(8,	5,	'IncidentCoord',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(9,	6,	'successfully resolved',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(10,	6,	'no resolution reached',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(11,	6,	'no response from customer',	NULL,	3,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(12,	6,	'no response from other ISP',	NULL,	4,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(13,	8,	'API',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(14,	8,	'CLI',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(15,	8,	'Email',	NULL,	3,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(16,	8,	'REST',	NULL,	4,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(17,	8,	'REST2',	NULL,	5,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(18,	8,	'Web',	NULL,	6,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(19,	8,	'Telephone',	NULL,	7,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(20,	8,	'Other',	NULL,	8,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(21,	9,	'customer',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(22,	9,	'external individual',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(23,	9,	'other ISP',	NULL,	3,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(24,	9,	'police',	NULL,	4,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(25,	9,	'other IRT',	NULL,	5,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(26,	9,	'other',	NULL,	6,	NULL,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "customroles";
DROP SEQUENCE IF EXISTS customroles_id_seq;
CREATE SEQUENCE customroles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."customroles" (
    "id" integer DEFAULT nextval('customroles_id_seq') NOT NULL,
    "name" character varying(200),
    "description" character varying(255),
    "maxvalues" integer DEFAULT '0' NOT NULL,
    "entryhint" character varying(255),
    "lookuptype" character varying(255) NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "customroles_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "dashboards";
DROP SEQUENCE IF EXISTS dashboards_id_seq;
CREATE SEQUENCE dashboards_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 3 CACHE 1;

CREATE TABLE "public"."dashboards" (
    "id" integer DEFAULT nextval('dashboards_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" character varying(255),
    "principalid" integer NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "dashboards_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX dashboards1 ON public.dashboards USING btree (name);

CREATE INDEX dashboards2 ON public.dashboards USING btree (principalid, disabled);

INSERT INTO "dashboards" ("id", "name", "description", "principalid", "creator", "created", "lastupdatedby", "lastupdated", "disabled") VALUES
(1,	'Homepage',	'Homepage',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(2,	'RTIRDefaultDashboard',	'RTIR Default Dashboard',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0);

DROP TABLE IF EXISTS "dashboardsubscriptions";
DROP SEQUENCE IF EXISTS dashboardsubscriptions_id_seq;
CREATE SEQUENCE dashboardsubscriptions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."dashboardsubscriptions" (
    "id" integer DEFAULT nextval('dashboardsubscriptions_id_seq') NOT NULL,
    "userid" integer NOT NULL,
    "dashboardid" integer NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "dashboardsubscriptions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX dashboardsubscriptions1 ON public.dashboardsubscriptions USING btree (userid);

CREATE INDEX dashboardsubscriptions2 ON public.dashboardsubscriptions USING btree (dashboardid);


DROP TABLE IF EXISTS "groupmembers";
DROP SEQUENCE IF EXISTS groupmembers_id_seq;
CREATE SEQUENCE groupmembers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 25 CACHE 1;

CREATE TABLE "public"."groupmembers" (
    "id" integer DEFAULT nextval('groupmembers_id_seq') NOT NULL,
    "groupid" integer DEFAULT '0' NOT NULL,
    "memberid" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "groupmembers_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX groupmembers1 ON public.groupmembers USING btree (groupid, memberid);

INSERT INTO "groupmembers" ("id", "groupid", "memberid", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	2,	1,	0,	'2026-01-18 17:25:33',	0,	'2026-01-18 17:25:33'),
(2,	7,	6,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(3,	3,	6,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(4,	5,	6,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(5,	8,	6,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(6,	15,	14,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(7,	3,	14,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(8,	4,	14,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(9,	18,	6,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(10,	22,	6,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(11,	24,	6,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(12,	30,	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(13,	34,	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(14,	38,	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(15,	42,	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(16,	45,	44,	14,	'2026-01-18 17:32:33',	14,	'2026-01-18 17:32:33'),
(17,	3,	44,	14,	'2026-01-18 17:32:33',	14,	'2026-01-18 17:32:33'),
(18,	4,	44,	14,	'2026-01-18 17:32:33',	14,	'2026-01-18 17:32:33'),
(19,	47,	46,	14,	'2026-01-18 17:34:02',	14,	'2026-01-18 17:34:02'),
(20,	3,	46,	14,	'2026-01-18 17:34:02',	14,	'2026-01-18 17:34:02'),
(21,	4,	46,	14,	'2026-01-18 17:34:02',	14,	'2026-01-18 17:34:02'),
(22,	49,	48,	14,	'2026-01-18 17:35:27',	14,	'2026-01-18 17:35:27'),
(23,	3,	48,	14,	'2026-01-18 17:35:27',	14,	'2026-01-18 17:35:27'),
(24,	4,	48,	14,	'2026-01-18 17:35:27',	14,	'2026-01-18 17:35:27');

DROP TABLE IF EXISTS "groups";
DROP SEQUENCE IF EXISTS groups_id_seq;
CREATE SEQUENCE groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."groups" (
    "id" integer DEFAULT nextval('groups_id_seq') NOT NULL,
    "name" character varying(200),
    "description" character varying(255),
    "domain" character varying(64),
    "instance" integer,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "groups_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX groups1 ON public.groups USING btree (lower((domain)::text), lower((name)::text), instance);

CREATE INDEX groups2 ON public.groups USING btree (instance);

INSERT INTO "groups" ("id", "name", "description", "domain", "instance", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(2,	'UserEquiv',	'ACL equiv. for user 1',	'ACLEquivalence',	1,	0,	'2026-01-18 17:25:33',	0,	'2026-01-18 17:25:33'),
(3,	'Everyone',	'Pseudogroup for internal use',	'SystemInternal',	0,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(4,	'Privileged',	'Pseudogroup for internal use',	'SystemInternal',	0,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(5,	'Unprivileged',	'Pseudogroup for internal use',	'SystemInternal',	0,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(7,	'UserEquiv',	'ACL equiv. for user 6',	'ACLEquivalence',	6,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(8,	'Owner',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(9,	'Requestor',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(10,	'Cc',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(11,	'AdminCc',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(12,	'HeldBy',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(13,	'Contact',	NULL,	'RT::System-Role',	1,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(15,	'UserEquiv',	'ACL equiv. for user 14',	'ACLEquivalence',	14,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(16,	'AdminCc',	NULL,	'RT::Queue-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(17,	'Cc',	NULL,	'RT::Queue-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(18,	'Owner',	NULL,	'RT::Queue-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(19,	'Requestor',	NULL,	'RT::Queue-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(20,	'AdminCc',	NULL,	'RT::Queue-Role',	2,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(21,	'Cc',	NULL,	'RT::Queue-Role',	2,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(22,	'Owner',	NULL,	'RT::Queue-Role',	2,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(23,	'Requestor',	NULL,	'RT::Queue-Role',	2,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(24,	'Owner',	NULL,	'RT::Catalog-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(25,	'HeldBy',	NULL,	'RT::Catalog-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(26,	'Contact',	NULL,	'RT::Catalog-Role',	1,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(27,	'DutyTeam',	'Duty Team Members',	'UserDefined',	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(28,	'AdminCc',	NULL,	'RT::Queue-Role',	3,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(29,	'Cc',	NULL,	'RT::Queue-Role',	3,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(30,	'Owner',	NULL,	'RT::Queue-Role',	3,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(31,	'Requestor',	NULL,	'RT::Queue-Role',	3,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(32,	'AdminCc',	NULL,	'RT::Queue-Role',	4,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(33,	'Cc',	NULL,	'RT::Queue-Role',	4,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(34,	'Owner',	NULL,	'RT::Queue-Role',	4,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(35,	'Requestor',	NULL,	'RT::Queue-Role',	4,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(36,	'AdminCc',	NULL,	'RT::Queue-Role',	5,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(37,	'Cc',	NULL,	'RT::Queue-Role',	5,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(38,	'Owner',	NULL,	'RT::Queue-Role',	5,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(39,	'Requestor',	NULL,	'RT::Queue-Role',	5,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(40,	'AdminCc',	NULL,	'RT::Queue-Role',	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(41,	'Cc',	NULL,	'RT::Queue-Role',	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(42,	'Owner',	NULL,	'RT::Queue-Role',	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(43,	'Requestor',	NULL,	'RT::Queue-Role',	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(45,	'UserEquiv',	'ACL equiv. for user 44',	'ACLEquivalence',	44,	14,	'2026-01-18 17:32:33',	14,	'2026-01-18 17:32:33'),
(47,	'UserEquiv',	'ACL equiv. for user 46',	'ACLEquivalence',	46,	14,	'2026-01-18 17:34:02',	14,	'2026-01-18 17:34:02'),
(49,	'UserEquiv',	'ACL equiv. for user 48',	'ACLEquivalence',	48,	14,	'2026-01-18 17:35:27',	14,	'2026-01-18 17:35:27');

DROP TABLE IF EXISTS "links";
DROP SEQUENCE IF EXISTS links_id_seq;
CREATE SEQUENCE links_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 10 CACHE 1;

CREATE TABLE "public"."links" (
    "id" integer DEFAULT nextval('links_id_seq') NOT NULL,
    "base" character varying(240),
    "target" character varying(240),
    "type" character varying(20) NOT NULL,
    "localtarget" integer DEFAULT '0' NOT NULL,
    "localbase" integer DEFAULT '0' NOT NULL,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    CONSTRAINT "links_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX links1 ON public.links USING btree (base);

CREATE INDEX links2 ON public.links USING btree (target);

CREATE INDEX links3 ON public.links USING btree (localbase);

CREATE INDEX links4 ON public.links USING btree (localtarget);

CREATE INDEX links5 ON public.links USING btree (type);

INSERT INTO "links" ("id", "base", "target", "type", "localtarget", "localbase", "lastupdatedby", "lastupdated", "creator", "created") VALUES
(1,	'dashboard://my.local/1',	'savedsearch://my.local/2',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(2,	'dashboard://my.local/1',	'savedsearch://my.local/1',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(3,	'dashboard://my.local/1',	'savedsearch://my.local/3',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(4,	'attribute://my.local/5',	'dashboard://my.local/1',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(5,	'dashboard://my.local/2',	'savedsearch://my.local/4',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(6,	'dashboard://my.local/2',	'savedsearch://my.local/6',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(7,	'dashboard://my.local/2',	'savedsearch://my.local/7',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(8,	'dashboard://my.local/2',	'savedsearch://my.local/5',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38'),
(9,	'attribute://my.local/15',	'dashboard://my.local/2',	'DependsOn',	0,	0,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38');

DROP TABLE IF EXISTS "objectclasses";
DROP SEQUENCE IF EXISTS objectclasses_id_seq;
CREATE SEQUENCE objectclasses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 6 CACHE 1;

CREATE TABLE "public"."objectclasses" (
    "id" integer DEFAULT nextval('objectclasses_id_seq') NOT NULL,
    "class" integer NOT NULL,
    "objecttype" character varying(255) DEFAULT '' NOT NULL,
    "objectid" integer NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "objectclasses_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "objectclasses" ("id", "class", "objecttype", "objectid", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	1,	'RT::System',	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(2,	2,	'RT::Queue',	3,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(3,	2,	'RT::Queue',	4,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(4,	2,	'RT::Queue',	5,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(5,	2,	'RT::Queue',	6,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36');

DROP TABLE IF EXISTS "objectcontents";
DROP SEQUENCE IF EXISTS objectcontents_id_seq;
CREATE SEQUENCE objectcontents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 10 CACHE 1;

CREATE TABLE "public"."objectcontents" (
    "id" bigint DEFAULT nextval('objectcontents_id_seq') NOT NULL,
    "objecttype" character varying(64) NOT NULL,
    "objectid" integer NOT NULL,
    "contentencoding" character varying(64),
    "content" text,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "objectcontents_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX objectcontents1 ON public.objectcontents USING btree (objecttype, objectid, disabled);

INSERT INTO "objectcontents" ("id", "objecttype", "objectid", "contentencoding", "content", "creator", "created", "lastupdatedby", "lastupdated", "disabled") VALUES
(1,	'RT::SavedSearch',	1,	'json',	'{"Format":"''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__id__</a>/TITLE:#'',''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__Subject__</a>/TITLE:Subject'',Priority, QueueName, ExtendedStatus","Order":"DESC","OrderBy":"Priority","Query":" Owner = ''__CurrentUser__'' AND Status = ''__Active__''"}',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(2,	'RT::SavedSearch',	2,	'json',	'{"Format":"''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__id__</a>/TITLE:#'',''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__Subject__</a>/TITLE:Subject'',QueueName, ExtendedStatus, CreatedRelative, ''<A HREF=\"__WebPath__/Ticket/Display.html?Action=Take&id=__id__\">__loc(Take)__</a>/TITLE:NBSP''","Order":"DESC","OrderBy":"Created","Query":" Owner = ''Nobody'' AND Status = ''__Active__''"}',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(3,	'RT::SavedSearch',	3,	'json',	'{"Format":"''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__id__</a>/TITLE:#'',''<a href=\"__WebPath__/Ticket/Display.html?id=__id__\">__Subject__</a>/TITLE:Subject'',Priority, QueueName, ExtendedStatus, Bookmark","Order":"DESC","OrderBy":"LastUpdated","Query":"id = ''__Bookmarked__''"}',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(4,	'RT::Dashboard',	1,	'json',	'{"Elements":[{"Elements":[[{"description":"Ticket: My Tickets","id":1,"portlet_type":"search"},{"description":"Ticket: Unowned Tickets","id":2,"portlet_type":"search"},{"description":"Ticket: Bookmarked Tickets","id":3,"portlet_type":"search"},{"component":"QuickCreate","description":"QuickCreate","path":"/Elements/QuickCreate","portlet_type":"component"}],[{"component":"MyReminders","description":"MyReminders","path":"/Elements/MyReminders","portlet_type":"component"},{"component":"QueueList","description":"QueueList","path":"/Elements/QueueList","portlet_type":"component"},{"component":"Dashboards","description":"Dashboards","path":"/Elements/Dashboards","portlet_type":"component"}]],"Layout":"col-md-8,col-md-4"}]}',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(5,	'RT::SavedSearch',	4,	'json',	'{"ExtraQueryParams":"RTIR","Format":"''<b><a href=\"__RTIRTicketURI__\">__id__</a></b>/TITLE:#'',''<b><a href=\"__RTIRTicketURI__\">__Subject__</a></b>/TITLE:Subject'',Requestors,OwnerName,DueRelative,QueueName,Take","Order":"ASC|ASC|ASC|ASC","OrderBy":"Due","Query":"Lifecycle = ''incident_reports'' AND Status = ''new''","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(6,	'RT::SavedSearch',	5,	'json',	'{"ExtraQueryParams":"RTIR","Format":"''<b><a href=\"__RTIRTicketURI__\">__id__</a></b>/TITLE:#'',''<b><a href=\"__RTIRTicketURI__\">__Subject__</a></b>/TITLE:Subject'',DueRelative, OwnerName, __Priority__,''UnreadMessages/TITLE:Updates''","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = ''incidents'' AND Status = ''__Active__'' AND Owner = ''__CurrentUser__''","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(7,	'RT::SavedSearch',	6,	'json',	'{"ExtraQueryParams":"RTIR","Format":"''<b><a href=\"__RTIRTicketURI__\">__id__</a></b>/TITLE:#'',''<b><a href=\"__RTIRTicketURI__\">__Subject__</a></b>/TITLE:Subject'',DueRelative, OwnerName, __Priority__,''UnreadMessages/TITLE:Updates''","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = ''incidents'' AND Status = ''__Active__'' AND Owner = ''Nobody''","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(8,	'RT::SavedSearch',	7,	'json',	'{"ExtraQueryParams":"RTIR","Format":"''<b><a href=\"__RTIRTicketURI__\">__id__</a></b>/TITLE:#'',''<b><a href=\"__RTIRTicketURI__\">__Subject__</a></b>/TITLE:Subject'',DueRelative, OwnerName, __Priority__,''UnreadMessages/TITLE:Updates''","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = ''incidents'' AND Status = ''__Active__''","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(9,	'RT::Dashboard',	2,	'json',	'{"Elements":[{"Elements":[[{"description":"Ticket: New unlinked Incident Reports","id":4,"portlet_type":"search"},{"description":"Ticket: Most due incidents I own","id":5,"portlet_type":"search"},{"description":"Ticket: Most due unowned incidents","id":6,"portlet_type":"search"},{"description":"Ticket: Most due incidents","id":7,"portlet_type":"search"}],[{"component":"/RTIR/Elements/WorkWithConstituency","description":"/RTIR/Elements/WorkWithConstituency","path":"/RTIR/Elements/WorkWithConstituency","portlet_type":"component"},{"component":"/RTIR/Elements/QueueSummary","description":"/RTIR/Elements/QueueSummary","path":"/RTIR/Elements/QueueSummary","portlet_type":"component"}]],"Layout":"col-md-8,col-md-4"}]}',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0);

DROP TABLE IF EXISTS "objectcustomfields";
DROP SEQUENCE IF EXISTS objectcustomfields_id_s;
CREATE SEQUENCE objectcustomfields_id_s INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 30 CACHE 1;

CREATE TABLE "public"."objectcustomfields" (
    "id" integer DEFAULT nextval('objectcustomfields_id_s') NOT NULL,
    "customfield" integer NOT NULL,
    "objectid" integer NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "objectcustomfields_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX objectcustomfields1 ON public.objectcustomfields USING btree (objectid);

INSERT INTO "objectcustomfields" ("id", "customfield", "objectid", "sortorder", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	1,	0,	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(2,	2,	0,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36'),
(3,	3,	3,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(4,	3,	4,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(5,	3,	5,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(6,	3,	6,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(7,	4,	3,	0,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(8,	5,	3,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(9,	6,	3,	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(10,	7,	3,	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(11,	7,	4,	0,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(12,	7,	5,	0,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(13,	7,	6,	0,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(14,	8,	4,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(15,	9,	4,	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(16,	10,	3,	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(17,	10,	4,	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(18,	10,	5,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(19,	10,	6,	1,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(20,	11,	6,	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(21,	12,	6,	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(22,	13,	6,	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(23,	14,	4,	4,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(24,	15,	5,	2,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(25,	16,	3,	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(26,	16,	4,	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(27,	16,	5,	3,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(28,	16,	6,	5,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(29,	17,	2,	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38');

DROP TABLE IF EXISTS "objectcustomfieldvalues";
DROP SEQUENCE IF EXISTS objectcustomfieldvalues_id_s;
CREATE SEQUENCE objectcustomfieldvalues_id_s INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 7 CACHE 1;

CREATE TABLE "public"."objectcustomfieldvalues" (
    "id" integer DEFAULT nextval('objectcustomfieldvalues_id_s') NOT NULL,
    "customfield" integer NOT NULL,
    "objecttype" character varying(255),
    "objectid" bigint NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "content" character varying(255),
    "largecontent" text,
    "contenttype" character varying(80),
    "contentencoding" character varying(80),
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "objectcustomfieldvalues_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX objectcustomfieldvalues1 ON public.objectcustomfieldvalues USING btree (customfield, objecttype, objectid, content);

CREATE INDEX objectcustomfieldvalues2 ON public.objectcustomfieldvalues USING btree (customfield, objecttype, objectid);

CREATE INDEX objectcustomfieldvalues3 ON public.objectcustomfieldvalues USING btree (sortorder);

INSERT INTO "objectcustomfieldvalues" ("id", "customfield", "objecttype", "objectid", "sortorder", "content", "largecontent", "contenttype", "contentencoding", "creator", "created", "lastupdatedby", "lastupdated", "disabled") VALUES
(1,	1,	'RT::Article',	1,	0,	'This is the content of the process for handling spam',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(2,	1,	'RT::Article',	2,	0,	'This is the content of the process for handling system compromise',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(3,	1,	'RT::Article',	3,	0,	'This is the content of the process for handling queries',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(4,	1,	'RT::Article',	4,	0,	'This is the content of the process for handling scans',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(5,	1,	'RT::Article',	5,	0,	'This is the content of the process for handling denial of service',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(6,	1,	'RT::Article',	6,	0,	'This is the content of the process for handling piracy',	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0);

DROP TABLE IF EXISTS "objectcustomroles";
DROP SEQUENCE IF EXISTS objectscrips_id_seq;
CREATE SEQUENCE objectscrips_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 75 CACHE 1;

CREATE TABLE "public"."objectcustomroles" (
    "id" integer DEFAULT nextval('objectscrips_id_seq') NOT NULL,
    "customrole" integer NOT NULL,
    "objectid" integer NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "objectcustomroles_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX objectcustomroles1 ON public.objectcustomroles USING btree (objectid, customrole);


DROP TABLE IF EXISTS "objectscrips";
DROP SEQUENCE IF EXISTS objectscrips_id_seq;
CREATE SEQUENCE objectscrips_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 75 CACHE 1;

CREATE TABLE "public"."objectscrips" (
    "id" integer DEFAULT nextval('objectscrips_id_seq') NOT NULL,
    "scrip" integer NOT NULL,
    "stage" character varying(32) DEFAULT 'TransactionCreate' NOT NULL,
    "objectid" integer NOT NULL,
    "sortorder" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "objectscrips_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX objectscrips1 ON public.objectscrips USING btree (objectid, scrip);

INSERT INTO "objectscrips" ("id", "scrip", "stage", "objectid", "sortorder", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	1,	'TransactionCreate',	0,	0,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(2,	2,	'TransactionCreate',	0,	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(3,	3,	'TransactionCreate',	0,	2,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(4,	4,	'TransactionCreate',	0,	3,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(5,	5,	'TransactionCreate',	0,	4,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(6,	6,	'TransactionCreate',	0,	5,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(7,	7,	'TransactionCreate',	0,	6,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(8,	8,	'TransactionCreate',	0,	7,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(9,	9,	'TransactionCreate',	0,	8,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(10,	10,	'TransactionCreate',	0,	9,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(11,	11,	'TransactionCreate',	0,	10,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(12,	12,	'TransactionCreate',	0,	11,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(13,	13,	'TransactionCreate',	0,	12,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(14,	14,	'TransactionCreate',	0,	13,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(15,	15,	'TransactionCreate',	0,	14,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(16,	16,	'TransactionCreate',	0,	15,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(17,	17,	'TransactionCreate',	0,	16,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(18,	18,	'TransactionCreate',	4,	17,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(19,	19,	'TransactionCreate',	6,	17,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(20,	20,	'TransactionCreate',	4,	18,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(21,	21,	'TransactionCreate',	4,	19,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(22,	22,	'TransactionCreate',	4,	20,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(23,	23,	'TransactionCreate',	4,	21,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(24,	23,	'TransactionCreate',	5,	17,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(25,	23,	'TransactionCreate',	6,	18,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(26,	24,	'TransactionCreate',	3,	17,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(27,	25,	'TransactionCreate',	3,	18,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(28,	26,	'TransactionCreate',	3,	19,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(29,	27,	'TransactionCreate',	4,	22,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(30,	27,	'TransactionCreate',	5,	18,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(31,	27,	'TransactionCreate',	6,	19,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(32,	28,	'TransactionCreate',	4,	23,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(33,	28,	'TransactionCreate',	5,	19,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(34,	28,	'TransactionCreate',	6,	20,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(35,	29,	'TransactionCreate',	3,	20,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(36,	30,	'TransactionCreate',	6,	21,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(37,	31,	'TransactionCreate',	3,	21,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(38,	31,	'TransactionCreate',	4,	24,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(39,	31,	'TransactionCreate',	5,	20,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(40,	31,	'TransactionCreate',	6,	22,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(41,	32,	'TransactionCreate',	3,	22,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(42,	32,	'TransactionCreate',	4,	25,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(43,	32,	'TransactionCreate',	5,	21,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(44,	32,	'TransactionCreate',	6,	23,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(45,	33,	'TransactionCreate',	3,	23,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(46,	33,	'TransactionCreate',	4,	26,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(47,	33,	'TransactionCreate',	5,	22,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(48,	33,	'TransactionCreate',	6,	24,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(49,	34,	'TransactionCreate',	3,	24,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(50,	34,	'TransactionCreate',	4,	27,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(51,	34,	'TransactionCreate',	5,	23,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(52,	34,	'TransactionCreate',	6,	25,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(53,	35,	'TransactionCreate',	3,	25,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(54,	35,	'TransactionCreate',	4,	28,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(55,	35,	'TransactionCreate',	5,	24,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(56,	35,	'TransactionCreate',	6,	26,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(57,	36,	'TransactionCreate',	3,	26,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(58,	36,	'TransactionCreate',	4,	29,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(59,	36,	'TransactionCreate',	5,	25,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(60,	36,	'TransactionCreate',	6,	27,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(61,	37,	'TransactionCreate',	4,	30,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(62,	38,	'TransactionCreate',	3,	27,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(63,	38,	'TransactionCreate',	4,	31,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(64,	38,	'TransactionCreate',	5,	26,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(65,	38,	'TransactionCreate',	6,	28,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(66,	39,	'TransactionCreate',	3,	28,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(67,	39,	'TransactionCreate',	4,	32,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(68,	39,	'TransactionCreate',	5,	27,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(69,	39,	'TransactionCreate',	6,	29,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(70,	40,	'TransactionCreate',	3,	29,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(71,	40,	'TransactionCreate',	4,	33,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(72,	40,	'TransactionCreate',	5,	28,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(73,	40,	'TransactionCreate',	6,	30,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(74,	41,	'TransactionCreate',	4,	34,	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "objecttopics";
DROP SEQUENCE IF EXISTS objecttopics_id_seq;
CREATE SEQUENCE objecttopics_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."objecttopics" (
    "id" integer DEFAULT nextval('objecttopics_id_seq') NOT NULL,
    "topic" integer NOT NULL,
    "objecttype" character varying(64) DEFAULT '' NOT NULL,
    "objectid" integer NOT NULL,
    CONSTRAINT "objecttopics_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "principals";
DROP SEQUENCE IF EXISTS principals_id_seq;
CREATE SEQUENCE principals_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 50 CACHE 1;

CREATE TABLE "public"."principals" (
    "id" integer DEFAULT nextval('principals_id_seq') NOT NULL,
    "principaltype" character varying(16) NOT NULL,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "principals_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "principals" ("id", "principaltype", "disabled") VALUES
(1,	'User',	0),
(2,	'Group',	0),
(3,	'Group',	0),
(4,	'Group',	0),
(5,	'Group',	0),
(6,	'User',	0),
(7,	'Group',	0),
(8,	'Group',	0),
(9,	'Group',	0),
(10,	'Group',	0),
(11,	'Group',	0),
(12,	'Group',	0),
(13,	'Group',	0),
(14,	'User',	0),
(15,	'Group',	0),
(16,	'Group',	0),
(17,	'Group',	0),
(18,	'Group',	0),
(19,	'Group',	0),
(20,	'Group',	0),
(21,	'Group',	0),
(22,	'Group',	0),
(23,	'Group',	0),
(24,	'Group',	0),
(25,	'Group',	0),
(26,	'Group',	0),
(27,	'Group',	0),
(28,	'Group',	0),
(29,	'Group',	0),
(30,	'Group',	0),
(31,	'Group',	0),
(32,	'Group',	0),
(33,	'Group',	0),
(34,	'Group',	0),
(35,	'Group',	0),
(36,	'Group',	0),
(37,	'Group',	0),
(38,	'Group',	0),
(39,	'Group',	0),
(40,	'Group',	0),
(41,	'Group',	0),
(42,	'Group',	0),
(43,	'Group',	0),
(44,	'User',	0),
(45,	'Group',	0),
(46,	'User',	0),
(47,	'Group',	0),
(48,	'User',	0),
(49,	'Group',	0);

DROP TABLE IF EXISTS "queues";
DROP SEQUENCE IF EXISTS queues_id_seq;
CREATE SEQUENCE queues_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 7 CACHE 1;

CREATE TABLE "public"."queues" (
    "id" integer DEFAULT nextval('queues_id_seq') NOT NULL,
    "name" character varying(200) NOT NULL,
    "description" character varying(255),
    "correspondaddress" character varying(120),
    "commentaddress" character varying(120),
    "lifecycle" character varying(32),
    "subjecttag" character varying(120),
    "sortorder" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "sladisabled" integer DEFAULT '1' NOT NULL,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "queues_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX queues1 ON public.queues USING btree (lower((name)::text));

INSERT INTO "queues" ("id", "name", "description", "correspondaddress", "commentaddress", "lifecycle", "subjecttag", "sortorder", "creator", "created", "lastupdatedby", "lastupdated", "sladisabled", "disabled") VALUES
(1,	'General',	'The default queue',	'',	'',	'default',	NULL,	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34',	1,	0),
(2,	'___Approvals',	'A system-internal queue for the approvals system',	'',	'',	'approvals',	NULL,	0,	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34',	1,	2),
(3,	'Incidents',	'',	'',	'',	'incidents',	NULL,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36',	1,	0),
(4,	'Incident Reports',	'',	'',	'',	'incident_reports',	NULL,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36',	0,	0),
(5,	'Investigations',	'',	'',	'',	'investigations',	NULL,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36',	0,	0),
(6,	'Countermeasures',	'',	'',	'',	'countermeasures',	NULL,	0,	1,	'2026-01-18 17:25:36',	1,	'2026-01-18 17:25:36',	0,	0);

DROP TABLE IF EXISTS "savedsearches";
DROP SEQUENCE IF EXISTS savedsearches_id_seq;
CREATE SEQUENCE savedsearches_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 8 CACHE 1;

CREATE TABLE "public"."savedsearches" (
    "id" integer DEFAULT nextval('savedsearches_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" character varying(255),
    "type" character varying(64) DEFAULT 'Ticket' NOT NULL,
    "principalid" integer NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "disabled" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "savedsearches_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX savedsearches1 ON public.savedsearches USING btree (name);

CREATE INDEX savedsearches2 ON public.savedsearches USING btree (principalid, disabled);

INSERT INTO "savedsearches" ("id", "name", "description", "type", "principalid", "creator", "created", "lastupdatedby", "lastupdated", "disabled") VALUES
(1,	'My Tickets',	'[_1] highest priority tickets I own',	'Ticket',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(2,	'Unowned Tickets',	'[_1] newest unowned tickets',	'Ticket',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(3,	'Bookmarked Tickets',	'Bookmarked Tickets',	'Ticket',	1,	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35',	0),
(4,	'New unlinked Incident Reports',	'New unlinked Incident Reports',	'Ticket',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(5,	'My most due incidents',	'Most due incidents I own',	'Ticket',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(6,	'Most due unowned incidents',	'Most due unowned incidents',	'Ticket',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0),
(7,	'Most due incidents',	'Most due incidents',	'Ticket',	1,	1,	'2026-01-18 17:25:38',	1,	'2026-01-18 17:25:38',	0);

DROP TABLE IF EXISTS "scripactions";
DROP SEQUENCE IF EXISTS scripactions_id_seq;
CREATE SEQUENCE scripactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 44 CACHE 1;

CREATE TABLE "public"."scripactions" (
    "id" integer DEFAULT nextval('scripactions_id_seq') NOT NULL,
    "name" character varying(200),
    "description" character varying(255),
    "execmodule" character varying(60),
    "argument" character varying(255),
    "lookuptype" character varying(255) NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "scripactions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "scripactions" ("id", "name", "description", "execmodule", "argument", "lookuptype", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'Autoreply To Requestors',	'Always sends a message to the requestors independent of message sender',	'Autoreply',	'Requestor',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(2,	'Notify Requestors',	'Sends a message to the requestors',	'Notify',	'Requestor',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(3,	'Notify Owner as Comment',	'Sends mail to the owner',	'NotifyAsComment',	'Owner',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(4,	'Notify Owner',	'Sends mail to the owner',	'Notify',	'Owner',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(5,	'Notify Ccs as Comment',	'Sends mail to the Ccs as a comment',	'NotifyAsComment',	'Cc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(6,	'Notify Ccs',	'Sends mail to the Ccs',	'Notify',	'Cc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:34',	1,	'2026-01-18 17:25:34'),
(7,	'Notify AdminCcs as Comment',	'Sends mail to the administrative Ccs as a comment',	'NotifyAsComment',	'AdminCc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(8,	'Notify AdminCcs',	'Sends mail to the administrative Ccs',	'Notify',	'AdminCc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(9,	'Notify Owner and AdminCcs',	'Sends mail to the Owner and administrative Ccs',	'Notify',	'Owner,AdminCc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(10,	'Notify Owner or AdminCcs',	'Sends mail to the Owner if set, otherwise administrative Ccs',	'NotifyOwnerOrAdminCc',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(11,	'Notify Requestors and Ccs as Comment',	'Send mail to requestors and Ccs as a comment',	'NotifyAsComment',	'Requestor,Cc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(12,	'Notify Requestors and Ccs',	'Send mail to requestors and Ccs',	'Notify',	'Requestor,Cc',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(13,	'Notify Owner, Requestors, Ccs and AdminCcs as Comment',	'Send mail to owner and all watchers as a "comment"',	'NotifyAsComment',	'All',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(14,	'Notify Owner, Requestors, Ccs and AdminCcs',	'Send mail to owner and all watchers',	'Notify',	'All',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(15,	'Notify Other Recipients as Comment',	'Sends mail to explicitly listed Ccs and Bccs',	'NotifyAsComment',	'OtherRecipients',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(16,	'Notify Other Recipients',	'Sends mail to explicitly listed Ccs and Bccs',	'Notify',	'OtherRecipients',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(17,	'User Defined',	'Perform a user-defined action',	'UserDefined',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(18,	'Create Tickets',	'Create new tickets based on this scrip''s template',	'CreateTickets',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(19,	'Open Tickets',	'Open tickets on correspondence',	'AutoOpen',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(20,	'Open Inactive Tickets',	'Open inactive tickets',	'AutoOpenInactive',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(21,	'Extract Subject Tag',	'Extract tags from a Transaction''s subject and add them to the Ticket''s subject.',	'ExtractSubjectTag',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(22,	'Send Forward',	'Send forwarded message',	'SendForward',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(23,	'Set starts date according to SLA',	'Set the starts date according to an agreement',	'SLA_SetStarts',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(24,	'Set due date according to SLA',	'Set the due date according to an agreement',	'SLA_SetDue',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(25,	'Clear Custom Field Value Template',	'Template action for clearing a custom field. Use "Copy Action" to create an action for s specific custom field.',	'ClearCustomFieldValues',	'Your Custom Field Name Or Id',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(26,	'User Defined',	'Perform a user-defined action',	'UserDefined',	NULL,	'RT::Catalog-RT::Asset',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(27,	'User Defined',	'Perform a user-defined action',	'UserDefined',	NULL,	'RT::Class-RT::Article',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(28,	'RTIR Set Incident Due',	'Set the due date of parent Incident',	'RTIR_SetDueIncident',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(29,	'RTIR Set How Reported',	'Set how the Incident Report was reported',	'RTIR_SetHowReported',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(30,	'RTIR Resolve Children',	'Resolve an Incident''s children',	'RTIR_ResolveChildren',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(31,	'RTIR Change Child Ownership',	'Change the ownership of Incident''s children',	'RTIR_ChangeChildOwnership',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(32,	'RTIR Change Parent Ownership',	'Change the ownership of the parent Incident',	'RTIR_ChangeParentOwnership',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(33,	'RTIR Open Parent',	'Open the parent Incident when a child reopens',	'RTIR_OpenParent',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(34,	'RTIR Set Countermeasure Status',	'Set the status of a Countermeasure',	'RTIR_SetCountermeasureStatus',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(35,	'RTIR Set Incident Resolution',	'Set the default resolution of an Incident',	'RTIR_SetIncidentResolution',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(36,	'RTIR parse message for IPs',	'Set IP custom field from message content',	'RTIR_FindIP',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(37,	'RTIR merge IPs',	'Merge multiple IPs on ticket merge',	'RTIR_MergeIPs',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(38,	'RTIR Activate Ticket',	'Set status to first active possible',	'RTIR_Activate',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(39,	'RTIR Change Child Constituencies',	'Move all tickets related to an incident to a new constituency',	'RTIR_ChangeChildConstituencies',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(40,	'RTIR parse message for Domains',	'Set Domain custom field from message content',	'RTIR_FindDomain',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(41,	'RTIR merge Domains',	'Merge multiple Domains on ticket merge',	'RTIR_MergeDomains',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(42,	'RTIR parse message for CVEs',	'Set CVE custom field from message content',	'RTIR_FindCVE',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(43,	'RTIR merge CVEs',	'Merge multiple CVEs on ticket merge',	'RTIR_MergeCVEs',	NULL,	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "scripconditions";
DROP SEQUENCE IF EXISTS scripconditions_id_seq;
CREATE SEQUENCE scripconditions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 37 CACHE 1;

CREATE TABLE "public"."scripconditions" (
    "id" integer DEFAULT nextval('scripconditions_id_seq') NOT NULL,
    "name" character varying(200),
    "description" character varying(255),
    "execmodule" character varying(60),
    "argument" character varying(255),
    "applicabletranstypes" character varying(60),
    "lookuptype" character varying(255) NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "scripconditions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "scripconditions" ("id", "name", "description", "execmodule", "argument", "applicabletranstypes", "lookuptype", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'On Create',	'When a ticket is created',	'AnyTransaction',	NULL,	'Create',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(2,	'On Create Via Email',	'When a ticket is created via Email',	'ViaInterface',	'Email',	'Create',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(3,	'On Create Via Web',	'When a ticket is created via Web',	'ViaInterface',	'Web,Mobile',	'Create',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(4,	'On Transaction',	'When anything happens',	'AnyTransaction',	NULL,	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(5,	'On Correspond',	'Whenever correspondence comes in',	'AnyTransaction',	NULL,	'Correspond',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(6,	'On Forward',	'Whenever a ticket or transaction is forwarded',	'AnyTransaction',	NULL,	'Forward Transaction,Forward Ticket',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(7,	'On Forward Ticket',	'Whenever a ticket is forwarded',	'AnyTransaction',	NULL,	'Forward Ticket',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(8,	'On Forward Transaction',	'Whenever a transaction is forwarded',	'AnyTransaction',	NULL,	'Forward Transaction',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(9,	'On Comment',	'Whenever comments come in',	'AnyTransaction',	NULL,	'Comment',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(10,	'On Status Change',	'Whenever a ticket''s status changes',	'AnyTransaction',	NULL,	'Status',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(11,	'On Priority Change',	'Whenever a ticket''s priority changes',	'PriorityChange',	NULL,	'Set',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(12,	'On Owner Change',	'Whenever a ticket''s owner changes',	'OwnerChange',	NULL,	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(13,	'On Queue Change',	'Whenever a ticket''s queue changes',	'QueueChange',	NULL,	'Set',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(14,	'On Resolve',	'Whenever a ticket is resolved',	'StatusChange',	'resolved',	'Status',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(15,	'On Reject',	'Whenever a ticket is rejected',	'StatusChange',	'rejected',	'Status',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(16,	'User Defined',	'Whenever a user-defined condition occurs',	'UserDefined',	NULL,	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(17,	'On Close',	'Whenever a ticket is closed',	'CloseTicket',	NULL,	'Status,Set',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(18,	'On Reopen',	'Whenever a ticket is reopened',	'ReopenTicket',	NULL,	'Status,Set',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(19,	'Require Starts set according to SLA',	'Detect a situation when we should set Starts date',	'SLA_RequireStartsSet',	NULL,	'Create,Set',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(20,	'Require Due set according to SLA',	'Detect a situation when we should set Due date',	'SLA_RequireDueSet',	NULL,	'Create,Correspond,Set,Status',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(21,	'On TimeWorked Change',	'When TimeWorked Change',	'TimeWorkedChange',	NULL,	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(22,	'User Defined',	'Whenever a user-defined condition occurs',	'UserDefined',	NULL,	'Any',	'RT::Catalog-RT::Asset',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(23,	'On Transaction',	'When anything happens',	'AnyTransaction',	NULL,	'Any',	'RT::Catalog-RT::Asset',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(24,	'On Create',	'When an asset is created',	'AnyTransaction',	NULL,	'Create',	'RT::Catalog-RT::Asset',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(25,	'On Status Change',	'Whenever an asset''s status changes',	'AnyTransaction',	NULL,	'Status',	'RT::Catalog-RT::Asset',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(26,	'User Defined',	'Whenever a user-defined condition occurs',	'UserDefined',	NULL,	'Any',	'RT::Class-RT::Article',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(27,	'On Transaction',	'When anything happens',	'AnyTransaction',	NULL,	'Any',	'RT::Class-RT::Article',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(28,	'On Create',	'When an article is created',	'AnyTransaction',	NULL,	'Create',	'RT::Class-RT::Article',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(29,	'RTIR Customer Response',	'Detect an external response',	'RTIR_CustomerResponse',	NULL,	'Correspond',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(30,	'RTIR Staff Response',	'Detect an internal response',	'RTIR_StaffResponse',	NULL,	'Correspond',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(31,	'RTIR Close Ticket',	'A ticket is rejected or resolved',	'StatusChange',	'old: initial, active; new: inactve',	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(32,	'RTIR Reopen Ticket',	'A closed ticket is reopened',	'StatusChange',	'old: inactive; new: initial, active',	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(33,	'RTIR Require Due Change',	'The due date of the parent incident must be changed',	'RTIR_RequireDueChange',	NULL,	'Any',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(34,	'RTIR Linking To Incident',	'Whenever ticket is linked to incident or created with link',	'RTIR_LinkingToIncident',	NULL,	'Create,AddLink',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(35,	'RTIR Merge',	'Whenever ticket is merged into another one',	'RTIR_Merge',	NULL,	'AddLink',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(36,	'RTIR Require IRs Activation',	'Whenever it''s time to activate report',	'RTIR_RequireReportActivation',	NULL,	'Correspond',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "scrips";
DROP SEQUENCE IF EXISTS scrips_id_seq;
CREATE SEQUENCE scrips_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 42 CACHE 1;

CREATE TABLE "public"."scrips" (
    "id" integer DEFAULT nextval('scrips_id_seq') NOT NULL,
    "description" character varying(255),
    "scripcondition" integer DEFAULT '0' NOT NULL,
    "scripaction" integer DEFAULT '0' NOT NULL,
    "customisapplicablecode" text,
    "custompreparecode" text,
    "customcommitcode" text,
    "disabled" integer DEFAULT '0' NOT NULL,
    "template" character varying(200) NOT NULL,
    "lookuptype" character varying(255) NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "scrips_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "scrips" ("id", "description", "scripcondition", "scripaction", "customisapplicablecode", "custompreparecode", "customcommitcode", "disabled", "template", "lookuptype", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'On Comment Notify AdminCcs as Comment',	9,	7,	NULL,	NULL,	NULL,	0,	'Admin Comment in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(2,	'On Comment Notify Other Recipients as Comment',	9,	15,	NULL,	NULL,	NULL,	0,	'Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(3,	'On Correspond Notify Owner and AdminCcs',	5,	9,	NULL,	NULL,	NULL,	0,	'Admin Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(4,	'On Correspond Notify Other Recipients',	5,	16,	NULL,	NULL,	NULL,	0,	'Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(5,	'On Correspond Notify Requestors and Ccs',	5,	12,	NULL,	NULL,	NULL,	0,	'Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(6,	'On Correspond Open Inactive Tickets',	5,	20,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(7,	'On Create Autoreply To Requestors',	1,	1,	NULL,	NULL,	NULL,	0,	'Autoreply in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(8,	'On Create Notify Owner and AdminCcs',	1,	9,	NULL,	NULL,	NULL,	0,	'Transaction in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(9,	'On Create Notify Ccs',	1,	6,	NULL,	NULL,	NULL,	0,	'Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(10,	'On Create Notify Other Recipients',	1,	16,	NULL,	NULL,	NULL,	0,	'Correspondence in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(11,	'On Owner Change Notify Owner',	12,	4,	NULL,	NULL,	NULL,	0,	'Transaction in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(12,	'On Resolve Notify Requestors',	14,	2,	NULL,	NULL,	NULL,	0,	'Resolved in HTML',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(13,	'On transaction, add any tags in the transaction''s subject to the ticket''s subject',	4,	21,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(14,	'On Forward Transaction Send forwarded message',	8,	22,	NULL,	NULL,	NULL,	0,	'Forward',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(15,	'On Forward Ticket Send forwarded message',	7,	22,	NULL,	NULL,	NULL,	0,	'Forward Ticket',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(16,	'Set starts date if needed according to SLA',	19,	23,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(17,	'Set due date if needed according to SLA',	20,	24,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:35',	1,	'2026-01-18 17:25:35'),
(18,	'SetHowReported',	1,	29,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(19,	'On Correspond Change Status of the Countermeasure',	5,	34,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(20,	'On Linking To Incident Activate Report',	34,	38,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(21,	'On Correspond (not every) Activate Report',	36,	38,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(22,	'On Linking To Incident Copy IPs',	34,	37,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(23,	'Set Due Date On Incident',	33,	28,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(24,	'ResolveAllChildren',	10,	30,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(25,	'Propagate Constituency Changes',	13,	39,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(26,	'FixOwnership',	12,	31,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(27,	'FixOwnership',	12,	32,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(28,	'ReopenIncident',	10,	33,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(29,	'SetDefaultIncidentResolution',	10,	35,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(30,	'NotifyOnClose',	31,	2,	NULL,	NULL,	NULL,	0,	'CountermeasureRemoved',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(31,	'SetIPFromContent',	5,	36,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(32,	'SetIPFromContent',	1,	36,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(33,	'MergeIPs',	35,	37,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(34,	'SetDomainFromContent',	5,	40,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(35,	'SetDomainFromContent',	1,	40,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(36,	'MergeDomains',	35,	41,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(37,	'On Linking To Incident Copy Domains',	34,	41,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(38,	'SetCVEFromContent',	5,	42,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(39,	'SetCVEFromContent',	1,	42,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(40,	'MergeCVEs',	35,	43,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37'),
(41,	'On Linking To Incident Copy CVEs',	34,	43,	NULL,	NULL,	NULL,	0,	'Blank',	'RT::Queue-RT::Ticket',	1,	'2026-01-18 17:25:37',	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "sessions";
CREATE TABLE "public"."sessions" (
    "id" character(32) NOT NULL,
    "a_session" bytea,
    "lastupdated" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "sessions" ("id", "a_session", "lastupdated") VALUES
('14dbdb979a1bff7ef56a59e428f99dff',	'BQsDAAAABCMAAAAEUkVTVAiGAAAAAWkEAwAAAAEEAwAAAAEKAS8AAAADdXJsAAAAIDAwMzRkODE0
MTNlYjEyNGE5ZmRkNzI4ZjVkYTA1ZTQyAAAACE5leHRQYWdlCiAxNGRiZGI5NzlhMWJmZjdlZjU2
YTU5ZTQyOGY5OWRmZgAAAAtfc2Vzc2lvbl9pZA==
',	'2026-01-18 17:41:21.190072');

DROP TABLE IF EXISTS "shorteners";
DROP SEQUENCE IF EXISTS shorteners_id_seq;
CREATE SEQUENCE shorteners_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 8 CACHE 1;

CREATE TABLE "public"."shorteners" (
    "id" integer DEFAULT nextval('shorteners_id_seq') NOT NULL,
    "code" character varying(40) NOT NULL,
    "content" text NOT NULL,
    "permanent" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "lastaccessedby" integer DEFAULT '0' NOT NULL,
    "lastaccessed" timestamp,
    CONSTRAINT "shorteners_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX shorteners1 ON public.shorteners USING btree (code);

INSERT INTO "shorteners" ("id", "code", "content", "permanent", "creator", "created", "lastupdatedby", "lastupdated", "lastaccessedby", "lastaccessed") VALUES
(1,	'e5b1c18e',	'Format=''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23''%2C''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject''%2CPriority%2C+QueueName%2C+ExtendedStatus&Order=DESC&OrderBy=Priority&Query=+Owner+%3D+''__CurrentUser__''+AND+Status+%3D+''__Active__''',	0,	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42'),
(2,	'a5b363a4',	'Format=''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23''%2C''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject''%2CQueueName%2C+ExtendedStatus%2C+CreatedRelative%2C+''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3FAction%3DTake%26amp%3Bid%3D__id__%22%3ETake%3C%2Fa%3E%2FTITLE%3ANBSP''&Order=DESC&OrderBy=Created&Query=+Owner+%3D+''Nobody''+AND+Status+%3D+''__Active__''',	0,	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42'),
(3,	'1ca4eda9',	'Format=''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23''%2C''%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject''%2CPriority%2C+QueueName%2C+ExtendedStatus%2C+Bookmark&Order=DESC&OrderBy=LastUpdated&Query=id+%3D+''__Bookmarked__''',	0,	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42',	14,	'2026-01-18 17:26:42'),
(4,	'df7ac9e7',	'ExtraQueryParams=RTIR&Format=''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__id__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3A%23''%2C''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__Subject__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3ASubject''%2CRequestors%2COwnerName%2CDueRelative%2CQueueName%2CTake&Order=ASC%7CASC%7CASC%7CASC&OrderBy=Due&Query=Lifecycle+%3D+''incident_reports''+AND+Status+%3D+''new''&RTIR=1&RowsPerPage=10',	0,	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06'),
(5,	'6fc11d4b',	'ExtraQueryParams=RTIR&Format=''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__id__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3A%23''%2C''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__Subject__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3ASubject''%2CDueRelative%2C+OwnerName%2C+__Priority__%2C''UnreadMessages%2FTITLE%3AUpdates''&Order=ASC%7CDESC%7CASC%7CASC&OrderBy=Due%7CPriority&Query=Lifecycle+%3D+''incidents''+AND+Status+%3D+''__Active__''+AND+Owner+%3D+''__CurrentUser__''&RTIR=1&RowsPerPage=10',	0,	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06'),
(6,	'38d6090d',	'ExtraQueryParams=RTIR&Format=''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__id__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3A%23''%2C''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__Subject__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3ASubject''%2CDueRelative%2C+OwnerName%2C+__Priority__%2C''UnreadMessages%2FTITLE%3AUpdates''&Order=ASC%7CDESC%7CASC%7CASC&OrderBy=Due%7CPriority&Query=Lifecycle+%3D+''incidents''+AND+Status+%3D+''__Active__''+AND+Owner+%3D+''Nobody''&RTIR=1&RowsPerPage=10',	0,	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06'),
(7,	'09da572b',	'ExtraQueryParams=RTIR&Format=''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__id__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3A%23''%2C''%3Cb%3E%3Ca+href%3D%22__RTIRTicketURI__%22%3E__Subject__%3C%2Fa%3E%3C%2Fb%3E%2FTITLE%3ASubject''%2CDueRelative%2C+OwnerName%2C+__Priority__%2C''UnreadMessages%2FTITLE%3AUpdates''&Order=ASC%7CDESC%7CASC%7CASC&OrderBy=Due%7CPriority&Query=Lifecycle+%3D+''incidents''+AND+Status+%3D+''__Active__''&RTIR=1&RowsPerPage=10',	0,	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06',	44,	'2026-01-18 17:36:06');

DROP TABLE IF EXISTS "templates";
DROP SEQUENCE IF EXISTS templates_id_seq;
CREATE SEQUENCE templates_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 45 CACHE 1;

CREATE TABLE "public"."templates" (
    "id" integer DEFAULT nextval('templates_id_seq') NOT NULL,
    "objectid" integer DEFAULT '0' NOT NULL,
    "name" character varying(200) NOT NULL,
    "description" character varying(255),
    "type" character varying(16),
    "content" text,
    "lookuptype" character varying(255) NOT NULL,
    "lastupdated" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    CONSTRAINT "templates_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "templates" ("id", "objectid", "name", "description", "type", "content", "lookuptype", "lastupdated", "lastupdatedby", "creator", "created") VALUES
(1,	0,	'Blank',	'A blank template',	'Perl',	'',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(2,	0,	'Autoreply',	'Plain text Autoresponse template',	'Perl',	'Subject: AutoReply: {$Ticket->Subject}


Greetings,

This message has been automatically generated in response to the
creation of a trouble ticket regarding:
        "{$Ticket->Subject()}", 
a summary of which appears below.

There is no need to reply to this message right now.  Your ticket has been
assigned an ID of { $Ticket->SubjectTag }.

Please include the string:

         { $Ticket->SubjectTag }

in the subject line of all future correspondence about this issue. To do so, 
you may reply to this message.

                        Thank you,
                        {$Ticket->QueueObj->CorrespondAddress()}

-------------------------------------------------------------------------
{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(3,	0,	'Autoreply in HTML',	'HTML Autoresponse template',	'Perl',	'Subject: AutoReply: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>This message has been automatically generated in response to the
creation of a trouble ticket regarding <b>{$Ticket->Subject()}</b>,
a summary of which appears below.</p>

<p>There is no need to reply to this message right now.  Your ticket has been
assigned an ID of <b>{$Ticket->SubjectTag}</b>.</p>

<p>Please include the string <b>{$Ticket->SubjectTag}</b>
in the subject line of all future correspondence about this issue. To do so,
you may reply to this message.</p>

<p>Thank you,<br/>
{$Ticket->QueueObj->CorrespondAddress()}</p>

<hr/>
{$Transaction->Content(Type => ''text/html'')}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(4,	0,	'Transaction',	'Plain text transaction template',	'Perl',	'RT-Attach-Message: yes


{$Transaction->CreatedAsString}: Request {$Ticket->id} was acted upon.
 Transaction: {$Transaction->Description}
       Queue: {$Ticket->QueueObj->Name}
     Subject: {$Transaction->Subject || $Ticket->Subject || "(No subject given)"}
       Owner: {$Ticket->OwnerObj->Name}
  Requestors: {$Ticket->RequestorAddresses}
      Status: {$Ticket->Status}
 Ticket <URL: {RT->Config->Get(''WebURL'')}Ticket/Display.html?id={$Ticket->id} >


{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(5,	0,	'Transaction in HTML',	'HTML transaction template',	'Perl',	'RT-Attach-Message: yes
Content-Type: text/html

<b>{$Transaction->CreatedAsString}: Request <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{$Ticket->id}</a> was acted upon by {$Transaction->CreatorObj->Name}.</b>
<br>
<table border="0">
<tr><td align="right"><b>Transaction:</b></td><td>{$Transaction->Description}</td></tr>
<tr><td align="right"><b>Queue:</b></td><td>{$Ticket->QueueObj->Name}</td></tr>
<tr><td align="right"><b>Subject:</b></td><td>{$Transaction->Subject || $Ticket->Subject || "(No subject given)"} </td></tr>
<tr><td align="right"><b>Owner:</b></td><td>{$Ticket->OwnerObj->Name}</td></tr>
<tr><td align="right"><b>Requestors:</b></td><td>{$Ticket->RequestorAddresses}</td></tr>
<tr><td align="right"><b>Status:</b></td><td>{$Ticket->Status}</td></tr>
<tr><td align="right"><b>Ticket URL:</b></td><td><a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a></td></tr>
</table>
<br/>
<br/>
{$Transaction->Content( Type => "text/html")}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(6,	2,	'Transaction in HTML',	'[no description]',	'Perl',	'',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(7,	2,	'Transaction',	'[no description]',	'Perl',	'',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(8,	0,	'Admin Correspondence',	'Plain text admin correspondence template',	'Perl',	'RT-Attach-Message: yes


<URL: {RT->Config->Get(''WebURL'')}Ticket/Display.html?id={$Ticket->id} >

{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(9,	0,	'Admin Correspondence in HTML',	'HTML admin correspondence template',	'Perl',	'RT-Attach-Message: yes
Content-Type: text/html

Ticket URL: <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a>
<br />
<br />
{$Transaction->Content(Type => "text/html");}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(10,	0,	'Correspondence',	'Plain text correspondence template',	'Perl',	'RT-Attach-Message: yes

{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(11,	0,	'Correspondence in HTML',	'HTML correspondence template',	'Perl',	'RT-Attach-Message: yes
Content-Type: text/html

{$Transaction->Content( Type => "text/html")}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(12,	0,	'Admin Comment',	'Plain text admin comment template',	'Perl',	'Subject: [Comment] {my $s=($Transaction->Subject||$Ticket->Subject||""); $s =~ s/\[Comment\]\s*//g; $s =~ s/^Re:\s*//i; $s;}
RT-Attach-Message: yes


{RT->Config->Get(''WebURL'')}Ticket/Display.html?id={$Ticket->id}
This is a comment.  It is not sent to the Requestor(s):

{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(13,	0,	'Admin Comment in HTML',	'HTML admin comment template',	'Perl',	'Subject: [Comment] {my $s=($Transaction->Subject||$Ticket->Subject||""); $s =~ s/\[Comment\]\s*//g; $s =~ s/^Re:\s*//i; $s;}
RT-Attach-Message: yes
Content-Type: text/html

<p>This is a comment about <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">ticket {$Ticket->id}</a>. It is not sent to the Requestor(s):</p>

{$Transaction->Content(Type => "text/html")}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(14,	0,	'Reminder',	'Default reminder template',	'Perl',	'Subject:{$Ticket->Subject} is due {$Ticket->DueObj->AsString}

This reminder is for ticket #{$Target = $Ticket->RefersTo->First->TargetObj;$Target->Id}.

{RT->Config->Get(''WebURL'')}Ticket/Display.html?id={$Target->Id}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(15,	0,	'Status Change',	'Ticket status changed',	'Perl',	'Subject: Status Changed to: {$Transaction->NewValue}


{RT->Config->Get(''WebURL'')}Ticket/Display.html?id={$Ticket->id}

{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(16,	0,	'Status Change in HTML',	'HTML Ticket status changed',	'Perl',	'Subject: Status Changed to: {$Transaction->NewValue}
Content-Type: text/html

<a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a>
<br/>
<br/>
{$Transaction->Content(Type => "text/html")}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(17,	0,	'Resolved',	'Ticket Resolved',	'Perl',	'Subject: Resolved: {$Ticket->Subject}

According to our records, your request has been resolved. If you have any
further questions or concerns, please respond to this message.
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(18,	0,	'Resolved in HTML',	'HTML Ticket Resolved',	'Perl',	'Subject: Resolved: {$Ticket->Subject}
Content-Type: text/html

<p>According to our records, your request has been resolved.  If you have any further questions or concerns, please respond to this message.</p>
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(19,	2,	'New Pending Approval',	'Notify Owners and AdminCcs of new items pending their approval',	'Perl',	'Subject: New Pending Approval: {$Ticket->Subject}

Greetings,

There is a new item pending your approval: "{$Ticket->Subject()}", 
a summary of which appears below.

Please visit {RT->Config->Get(''WebURL'')}Approvals/Display.html?id={$Ticket->id}
to approve or reject this ticket, or {RT->Config->Get(''WebURL'')}Approvals/ to
batch-process all your pending approvals.

-------------------------------------------------------------------------
{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(20,	2,	'New Pending Approval in HTML',	'Notify Owners and AdminCcs of new items pending their approval',	'Perl',	'Subject: New Pending Approval: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>There is a new item pending your approval: <b>{$Ticket->Subject()}</b>,
a summary of which appears below.</p>

<p>Please <a href="{RT->Config->Get(''WebURL'')}Approvals/Display.html?id={$Ticket->id}">approve
or reject this ticket</a>, or visit the <a href="{RT->Config->Get(''WebURL'')}Approvals/">approvals
overview</a> to batch-process all your pending approvals.</p>

<hr />
{$Transaction->Content()}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(21,	2,	'Approval Passed',	'Notify Requestor of their ticket has been approved by some approver',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}

Greetings,

Your ticket has been approved by { eval { $Approver->Name } }.
Other approvals may be pending.

Approver''s notes: { $Notes }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(22,	2,	'Approval Passed in HTML',	'Notify Requestor of their ticket has been approved by some approver',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>Your ticket has been approved by <b>{ eval { $Approver->Name } }</b>.
Other approvals may be pending.</p>

<p>Approver''s notes:</p>
<blockquote>{ $Notes }</blockquote>
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(23,	2,	'All Approvals Passed',	'Notify Requestor of their ticket has been approved by all approvers',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}

Greetings,

Your ticket has been approved by { eval { $Approver->Name } }.
Its Owner may now start to act on it.

Approver''s notes: { $Notes }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(24,	2,	'All Approvals Passed in HTML',	'Notify Requestor of their ticket has been approved by all approvers',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>Your ticket has been approved by <b>{ eval { $Approver->Name } }</b>.
Its Owner may now start to act on it.</p>

<p>Approver''s notes:</p>
<blockquote>{ $Notes }</blockquote>
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(25,	2,	'Approval Rejected',	'Notify Owner of their rejected ticket',	'Perl',	'Subject: Ticket Rejected: {$Ticket->Subject}

Greetings,

Your ticket has been rejected by { eval { $Approver->Name } }.

Approver''s notes: { $Notes }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(26,	2,	'Approval Rejected in HTML',	'Notify Owner of their rejected ticket',	'Perl',	'Subject: Ticket Rejected: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>Your ticket has been rejected by <b>{ eval { $Approver->Name } }</b>.</p>

<p>Approver''s notes:</p>
<blockquote>{ $Notes }</blockquote>
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(27,	2,	'Approval Ready for Owner',	'Notify Owner of their ticket has been approved and is ready to be acted on',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}

Greetings,

The ticket has been approved, you may now start to act on it.

',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(28,	2,	'Approval Ready for Owner in HTML',	'Notify Owner of their ticket has been approved and is ready to be acted on',	'Perl',	'Subject: Ticket Approved: {$Ticket->Subject}
Content-Type: text/html

<p>Greetings,</p>

<p>The ticket has been approved, you may now start to act on it.</p>

',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(29,	0,	'Forward',	'Forwarded message',	'Perl',	'

{ $ForwardTransaction->Content =~ /\S/ ? $ForwardTransaction->Content : "This is a forward of transaction #".$Transaction->id." of ticket #". $Ticket->id }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(30,	0,	'Forward Ticket',	'Forwarded ticket message',	'Perl',	'

{ $ForwardTransaction->Content =~ /\S/ ? $ForwardTransaction->Content : "This is a forward of ticket #". $Ticket->id }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(31,	0,	'Error: unencrypted message',	'Inform user that their unencrypted mail has been rejected',	'Perl',	'Subject: RT requires that all incoming mail be encrypted

You received this message because RT received mail from you that was not encrypted.  As such, it has been rejected.
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(32,	0,	'Error: public key',	'Inform user that he has problems with public key and couldn''t recieve encrypted content',	'Perl',	'Subject: Your public key in RT is missing or unusable

You received this message because we were unable to encrypt a message to your public key, either because it is missing or has a problem.  Please inform the administrator about the problem.
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(33,	0,	'Error to RT owner: public key',	'Inform RT owner that user(s) have problems with public keys',	'Perl',	'Subject: Some users have problems with public keys

You received this message as RT has problems with public keys of the following user:
{
    foreach my $e ( @BadRecipients ) {
        $OUT .= "* ". $e->{''Message''} ."\n";
    }
}',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(34,	0,	'Error: no private key',	'Inform user that we received an encrypted email and we have no private keys to decrypt',	'Perl',	'Subject: we received message we cannot decrypt

You sent an encrypted message with subject ''{ $Message->head->get(''Subject'') }'',
but we have no private key it''s encrypted to.

Please, check that you encrypt messages with correct keys
or contact the system administrator.',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(35,	0,	'Error: bad encrypted data',	'Inform user that a message he sent has invalid encryption data',	'Perl',	'Subject: We received a message we cannot handle

You sent us a message that we cannot handle due to corrupted signature or encrypted block. we get the following error(s):
{ foreach my $msg ( @Messages ) {
    $OUT .= "* $msg\n";
  }
}',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(36,	0,	'PasswordChange',	'Inform user that his password has been reset',	'Perl',	'Subject: [{RT->Config->Get(''rtname'')}] Password reset

Greetings,

Someone at {$ENV{''REMOTE_ADDR''}} requested a password reset for you on {RT->Config->Get(''WebURL'')}

Your new password is:
  {$NewPassword}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(37,	0,	'Email Digest',	'Email template for periodic notification digests',	'Perl',	'Subject: RT Email Digest

{ $Argument }
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(38,	0,	'Error: Missing dashboard',	'Inform user that a dashboard he subscribed to is missing',	'Perl',	'Subject: [{RT->Config->Get(''rtname'')}] Missing dashboard!

Greetings,

You are subscribed to a dashboard that is currently missing. Most likely, the dashboard was deleted.

RT will remove this subscription as it is no longer useful. Here''s the information RT had about your subscription:

DashboardID:  { $SubscriptionObj->SubValue(''DashboardId'') }
Frequency:    { $SubscriptionObj->SubValue(''Frequency'') }
Hour:         { $SubscriptionObj->SubValue(''Hour'') }
{
    $SubscriptionObj->SubValue(''Frequency'') eq ''weekly''
    ? "Day of week:  " . $SubscriptionObj->SubValue(''Dow'')
    : $SubscriptionObj->SubValue(''Frequency'') eq ''monthly''
      ? "Day of month: " . $SubscriptionObj->SubValue(''Dom'')
      : ''''
}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(39,	0,	'Auth tokens expiring in 7 days in HTML',	'Auth tokens expiring in 7 days',	'Perl',	'Subject: [{RT->Config->Get(''rtname'')}] You have auth tokens that will expire in 7 days
Content-Type: text/html

<p>Hello { $UserObj->RealName || $UserObj->Name }:</p>

<p>
The following tokens will expire within the next 7 days:
<ul>
{
    for my $token (@AuthTokens) {
        $OUT .= ''<li>'' . $token->Description .  '' (expires at '' . $token->ExpiresObj->AsString . '')</li>'';
    }
}
</ul>
</p>

{
    if (   $UserObj->HasRight( Right => ''ModifySelf'', Object => RT->System )
        && $UserObj->HasRight( Right => ''ManageAuthTokens'', Object => RT->System ) )
    {
        $OUT .= ''<p>You can revoke them and generate new ones on the <a href="'' . RT->Config->Get(''WebURL'') . ''Prefs/AuthTokens.html'' . ''">Auth Tokens</a> page in RT.</p>'';
    }
    else {
        $OUT .= "<p>If you are still using them, please contact your RT manager to generate new ones for you.</p>";
    }
}
',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(40,	0,	'Blank',	'A blank template',	'Perl',	'',	'RT::Catalog-RT::Asset',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(41,	0,	'Blank',	'A blank template',	'Perl',	'',	'RT::Class-RT::Article',	'2026-01-18 17:25:35',	1,	1,	'2026-01-18 17:25:35'),
(42,	6,	'Autoreply',	'Sent when a countermeasure is created',	'Perl',	'RT-Attach-Message: yes
Subject: { $Ticket->Subject }

{ $Transaction->Content }

{ my $output = "";
  my @mailfields = ( "IP", "Netmask", "Port", "Where Blocked" );

  my $CustomFields = $Ticket->QueueObj->TicketCustomFields;
  while ( my $CustomField = $CustomFields->Next ) {
    my $name = $CustomField->Name;
    next unless grep lc $_ eq lc $name, @mailfields;

    my $Values = $Ticket->CustomFieldValues( $CustomField->Id );
    while ( my $Value = $Values->Next ) {
      $output .= $name .": ". $Value->Content ."\n";
    }
  }
  return $output;
}
-------------------------------------------------------------------------
Please include the string:

         [{ $Ticket->SubjectTag } #{ $Ticket->id }]

in the subject line of all future correspondence about this issue. To do so, 
you may reply to this message.

                        Thank you,
                        { $Ticket->QueueObj->CorrespondAddress }',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:37',	1,	1,	'2026-01-18 17:25:37'),
(43,	6,	'CountermeasureRemoved',	'Sent when a countermeasure is removed',	'Perl',	'Subject: {$Ticket->Subject}

Countermeasure #{$Ticket->id} was removed.

{ my $output = "";
  my @mailfields = ( "IP", "Netmask", "Port", "Where Blocked" );

  my $CustomFields = $Ticket->QueueObj->TicketCustomFields;
  while ( my $CustomField = $CustomFields->Next ) {
    my $name = $CustomField->Name;
    next unless grep lc $_ eq lc $name, @mailfields;

    my $Values = $Ticket->CustomFieldValues( $CustomField->Id );
    while ( my $Value = $Values->Next ) {
      $output .= $name .": ". $Value->Content ."\n";
    }
  }
  return $output;
}
-------------------------------------------------------------------------
Please include the string:

         [{ $Ticket->SubjectTag } #{$Ticket->id}]

in the subject line of all future correspondence about this issue. To do so, 
you may reply to this message.

                        Thank you,
                        {$Ticket->QueueObj->CorrespondAddress()}',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:37',	1,	1,	'2026-01-18 17:25:37'),
(44,	5,	'Autoreply',	'Sent when an investigation is launched',	'Perl',	'RT-Attach-Message: yes
Subject: {$Ticket->Subject}

{$Transaction->Content()}

-------------------------------------------------------------------------
Please include the string:

         [{ $Ticket->SubjectTag } #{$Ticket->id}]

in the subject line of all future correspondence about this issue. To do so, 
you may reply to this message.

                        Thank you,
                        {$Ticket->QueueObj->CorrespondAddress()}',	'RT::Queue-RT::Ticket',	'2026-01-18 17:25:37',	1,	1,	'2026-01-18 17:25:37');

DROP TABLE IF EXISTS "tickets";
DROP SEQUENCE IF EXISTS tickets_id_seq;
CREATE SEQUENCE tickets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."tickets" (
    "id" integer DEFAULT nextval('tickets_id_seq') NOT NULL,
    "effectiveid" integer DEFAULT '0' NOT NULL,
    "ismerged" smallint,
    "queue" integer DEFAULT '0' NOT NULL,
    "type" character varying(16),
    "owner" integer DEFAULT '0' NOT NULL,
    "subject" character varying(200) DEFAULT '[no subject]',
    "description" text,
    "initialpriority" integer DEFAULT '0' NOT NULL,
    "finalpriority" integer DEFAULT '0' NOT NULL,
    "priority" integer DEFAULT '0' NOT NULL,
    "timeestimated" integer DEFAULT '0' NOT NULL,
    "timeworked" integer DEFAULT '0' NOT NULL,
    "status" character varying(64),
    "sla" character varying(64),
    "timeleft" integer DEFAULT '0' NOT NULL,
    "told" timestamp,
    "starts" timestamp,
    "started" timestamp,
    "due" timestamp,
    "resolved" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    CONSTRAINT "tickets_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX tickets1 ON public.tickets USING btree (queue, status);

CREATE INDEX tickets2 ON public.tickets USING btree (owner);

CREATE INDEX tickets3 ON public.tickets USING btree (effectiveid);

CREATE INDEX tickets7 ON public.tickets USING gin (to_tsvector('simple'::regconfig, description));


DROP TABLE IF EXISTS "topics";
DROP SEQUENCE IF EXISTS topics_id_seq;
CREATE SEQUENCE topics_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."topics" (
    "id" integer DEFAULT nextval('topics_id_seq') NOT NULL,
    "parent" integer DEFAULT '0' NOT NULL,
    "name" character varying(255) DEFAULT '' NOT NULL,
    "description" character varying(255) DEFAULT '' NOT NULL,
    "objecttype" character varying(64) DEFAULT '' NOT NULL,
    "objectid" integer NOT NULL,
    CONSTRAINT "topics_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "transactions";
DROP SEQUENCE IF EXISTS transactions_id_seq;
CREATE SEQUENCE transactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 247 CACHE 1;

CREATE TABLE "public"."transactions" (
    "id" bigint DEFAULT nextval('transactions_id_seq') NOT NULL,
    "objecttype" character varying(255) NOT NULL,
    "objectid" integer DEFAULT '0' NOT NULL,
    "timetaken" integer DEFAULT '0' NOT NULL,
    "timeworker" integer DEFAULT '0' NOT NULL,
    "timeworkeddate" date,
    "type" character varying(20),
    "field" character varying(255),
    "oldvalue" character varying(255),
    "newvalue" character varying(255),
    "referencetype" character varying(255),
    "oldreference" integer,
    "newreference" integer,
    "data" character varying(255),
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX transactions1 ON public.transactions USING btree (objecttype, objectid);

INSERT INTO "transactions" ("id", "objecttype", "objectid", "timetaken", "timeworker", "timeworkeddate", "type", "field", "oldvalue", "newvalue", "referencetype", "oldreference", "newreference", "data", "creator", "created") VALUES
(1,	'RT::Group',	3,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(2,	'RT::Group',	4,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(3,	'RT::Group',	5,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(4,	'RT::User',	6,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(5,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'7',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:33'),
(6,	'RT::Group',	8,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(7,	'RT::Group',	9,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(8,	'RT::Group',	10,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(9,	'RT::Group',	11,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(10,	'RT::Group',	12,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(11,	'RT::Group',	13,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33'),
(12,	'RT::User',	14,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(13,	'RT::Group',	16,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(14,	'RT::Group',	17,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(15,	'RT::Group',	18,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(16,	'RT::Group',	19,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(17,	'RT::Queue',	1,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(18,	'RT::Group',	20,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(19,	'RT::Group',	21,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(20,	'RT::Group',	22,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(21,	'RT::Group',	23,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(22,	'RT::Queue',	2,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(23,	'RT::Group',	24,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(24,	'RT::Group',	25,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(25,	'RT::Group',	26,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(26,	'RT::Catalog',	1,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:34'),
(27,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'15',	NULL,	'SuperUser',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:34'),
(28,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowApprovalsTab',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:34'),
(29,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowSearchAdvanced',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:34'),
(30,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowSearchBulkUpdate',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:34'),
(31,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:34'),
(32,	'RT::SavedSearch',	1,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:35'),
(33,	'RT::SavedSearch',	2,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:35'),
(34,	'RT::SavedSearch',	3,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:35'),
(35,	'RT::Dashboard',	1,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:35'),
(36,	'RT::Group',	27,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(37,	'RT::Group',	28,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(38,	'RT::Group',	29,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(39,	'RT::Group',	30,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(40,	'RT::Group',	31,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(41,	'RT::Queue',	3,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(42,	'RT::Group',	32,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(43,	'RT::Group',	33,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(44,	'RT::Group',	34,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(45,	'RT::Group',	35,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(46,	'RT::Queue',	4,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(47,	'RT::Group',	36,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(48,	'RT::Group',	37,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(49,	'RT::Group',	38,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(50,	'RT::Group',	39,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(51,	'RT::Queue',	5,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(52,	'RT::Group',	40,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(53,	'RT::Group',	41,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(54,	'RT::Group',	42,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(55,	'RT::Group',	43,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(56,	'RT::Queue',	6,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(57,	'RT::Article',	1,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(58,	'RT::Article',	2,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(59,	'RT::Article',	3,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(60,	'RT::Article',	4,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(61,	'RT::Article',	5,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(62,	'RT::Article',	6,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:36'),
(63,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'30',	NULL,	'ModifyTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(64,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'34',	NULL,	'ModifyTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(65,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'38',	NULL,	'ModifyTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(66,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'42',	NULL,	'ModifyTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(67,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(68,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTemplate',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(69,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(70,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CommentOnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(71,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeQueue',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(72,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(73,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicketComments',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(74,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'StealTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(75,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'TakeTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(76,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'Watch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(77,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowOutgoingEmail',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(78,	'RT::Queue',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ForwardMessage',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(79,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(80,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTemplate',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(81,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(82,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CommentOnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(83,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeQueue',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(84,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(85,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicketComments',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(86,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'StealTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(87,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'TakeTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(88,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'Watch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(89,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowOutgoingEmail',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(90,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ForwardMessage',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(91,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(92,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTemplate',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(93,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(94,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CommentOnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(95,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeQueue',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(96,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(97,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicketComments',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(98,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'StealTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(99,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'TakeTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(100,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'Watch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(101,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowOutgoingEmail',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(102,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ForwardMessage',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(103,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(104,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTemplate',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(105,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(106,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CommentOnTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(107,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeQueue',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(108,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(109,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowTicketComments',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(110,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'StealTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(111,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'TakeTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(112,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'Watch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(113,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowOutgoingEmail',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(114,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ForwardMessage',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(115,	'RT::Queue',	5,	0,	0,	NULL,	'GrantRight',	'3',	NULL,	'ReplyToTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(116,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'3',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(117,	'RT::Queue',	4,	0,	0,	NULL,	'GrantRight',	'3',	NULL,	'ReplyToTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(118,	'RT::Queue',	6,	0,	0,	NULL,	'GrantRight',	'3',	NULL,	'ReplyToTicket',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(119,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifySelf',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(120,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeOwnSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(121,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminOwnSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(122,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeGroupSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(123,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminGroupSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(124,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeOwnDashboard',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(125,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminOwnDashboard',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(126,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeGroupDashboard',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(127,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminGroupDashboard',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(128,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'LoadSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(129,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminSavedSearch',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(130,	'RT::CustomField',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(131,	'RT::CustomField',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(132,	'RT::CustomField',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(133,	'RT::CustomField',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(134,	'RT::CustomField',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(135,	'RT::CustomField',	4,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(136,	'RT::CustomField',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(137,	'RT::CustomField',	5,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(138,	'RT::CustomField',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(139,	'RT::CustomField',	6,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(140,	'RT::CustomField',	7,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(141,	'RT::CustomField',	7,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(142,	'RT::CustomField',	8,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(143,	'RT::CustomField',	8,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(144,	'RT::CustomField',	9,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(145,	'RT::CustomField',	9,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(146,	'RT::CustomField',	10,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(147,	'RT::CustomField',	10,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(148,	'RT::CustomField',	11,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(149,	'RT::CustomField',	11,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(150,	'RT::CustomField',	12,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(151,	'RT::CustomField',	12,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(152,	'RT::CustomField',	13,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(153,	'RT::CustomField',	13,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(154,	'RT::CustomField',	14,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(155,	'RT::CustomField',	14,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(156,	'RT::CustomField',	15,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(157,	'RT::CustomField',	15,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(158,	'RT::CustomField',	16,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(159,	'RT::CustomField',	16,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:37'),
(160,	'RT::Article',	1,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	1,	NULL,	1,	'2026-01-18 17:25:38'),
(161,	'RT::Article',	2,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	2,	NULL,	1,	'2026-01-18 17:25:38'),
(162,	'RT::Article',	3,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	3,	NULL,	1,	'2026-01-18 17:25:38'),
(163,	'RT::Article',	4,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	4,	NULL,	1,	'2026-01-18 17:25:38'),
(164,	'RT::Article',	5,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	5,	NULL,	1,	'2026-01-18 17:25:38'),
(165,	'RT::Article',	6,	0,	0,	NULL,	'CustomField',	'1',	NULL,	NULL,	'RT::ObjectCustomFieldValue',	NULL,	6,	NULL,	1,	'2026-01-18 17:25:38'),
(166,	'RT::SavedSearch',	4,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:38'),
(167,	'RT::SavedSearch',	5,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:38'),
(168,	'RT::SavedSearch',	6,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:38'),
(169,	'RT::SavedSearch',	7,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:38'),
(170,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(171,	'RT::CustomField',	17,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(172,	'RT::CustomField',	17,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(173,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminClass',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(174,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminTopics',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(175,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(176,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(177,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyArticleTopics',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(178,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeClass',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(179,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(180,	'RT::Class',	2,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowArticleHistory',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(181,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowArticlesMenu',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(182,	'RT::Dashboard',	2,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:38'),
(183,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(184,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(185,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminClass',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(186,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'AdminTopics',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(187,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'CreateArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(188,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyArticle',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(189,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ModifyArticleTopics',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(190,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'SeeClass',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(191,	'RT::Class',	3,	0,	0,	NULL,	'GrantRight',	'27',	NULL,	'ShowArticleHistory',	NULL,	NULL,	NULL,	'',	1,	'2026-01-18 17:25:38'),
(192,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SetInitialCustomField',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(193,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(194,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'StealTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(195,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ReassignTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(196,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'DeleteTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(197,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'Watch',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(198,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeQueue',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(199,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyArticleTopics',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(200,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'CommentOnTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(201,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyOwnMembership',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(202,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyAsset',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(203,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ManageAuthTokens',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(204,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowArticle',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(205,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(206,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeDashboard',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(207,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeGroupDashboard',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(208,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'CreateArticle',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(209,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowArticleHistory',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(210,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeClass',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(211,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyGroupLinks',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(212,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'AdminOwnDashboard',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(213,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'AdminOwnSavedSearch',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(214,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowArticlesMenu',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(215,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeGroupSavedSearch',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(216,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowAssetsMenu',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(217,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'OwnTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(218,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ReplyToTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(219,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'CreateTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(220,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyArticle',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(221,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifySelf',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(222,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ForwardMessage',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(223,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeOwnDashboard',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(224,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'DisableArticle',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(225,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SubscribeDashboard',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(226,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowGlobalTemplates',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(227,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'CreateAsset',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(228,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowAsset',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(229,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowOutgoingEmail',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(230,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeOwnSavedSearch',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(231,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowUserHistory',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(232,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'LoadSavedSearch',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(233,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowTicketComments',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(234,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeGroup',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(235,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ShowCatalog',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(236,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeSelfServiceGroupTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(237,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'WatchAsAdminCc',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(238,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'TakeTicket',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(239,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'SeeCustomField',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(240,	'RT::System',	1,	0,	0,	NULL,	'GrantRight',	'4',	NULL,	'ModifyCustomField',	NULL,	NULL,	NULL,	'',	14,	'2026-01-18 17:29:46'),
(241,	'RT::User',	44,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:32:33'),
(242,	'RT::User',	44,	0,	0,	NULL,	'Set',	'Password',	'********',	'********',	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:32:33'),
(243,	'RT::User',	46,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:34:02'),
(244,	'RT::User',	46,	0,	0,	NULL,	'Set',	'Password',	'********',	'********',	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:34:02'),
(245,	'RT::User',	48,	0,	0,	NULL,	'Create',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:35:27'),
(246,	'RT::User',	48,	0,	0,	NULL,	'Set',	'Password',	'********',	'********',	NULL,	NULL,	NULL,	NULL,	14,	'2026-01-18 17:35:28');

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(200) NOT NULL,
    "password" character varying(256),
    "authtoken" character varying(16),
    "comments" text,
    "signature" text,
    "emailaddress" character varying(120),
    "freeformcontactinfo" text,
    "organization" character varying(200),
    "realname" character varying(120),
    "nickname" character varying(16),
    "lang" character varying(16),
    "gecos" character varying(16),
    "homephone" character varying(30),
    "workphone" character varying(30),
    "mobilephone" character varying(30),
    "pagerphone" character varying(30),
    "address1" character varying(200),
    "address2" character varying(200),
    "city" character varying(100),
    "state" character varying(100),
    "zip" character varying(16),
    "country" character varying(50),
    "timezone" character varying(50),
    "smimecertificate" text,
    "imagecontenttype" character varying(80),
    "image" text,
    "creator" integer DEFAULT '0' NOT NULL,
    "created" timestamp,
    "lastupdatedby" integer DEFAULT '0' NOT NULL,
    "lastupdated" timestamp,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX users1 ON public.users USING btree (lower((name)::text));

CREATE INDEX users4 ON public.users USING btree (lower((emailaddress)::text));

INSERT INTO "users" ("id", "name", "password", "authtoken", "comments", "signature", "emailaddress", "freeformcontactinfo", "organization", "realname", "nickname", "lang", "gecos", "homephone", "workphone", "mobilephone", "pagerphone", "address1", "address2", "city", "state", "zip", "country", "timezone", "smimecertificate", "imagecontenttype", "image", "creator", "created", "lastupdatedby", "lastupdated") VALUES
(1,	'RT_System',	'*NO-PASSWORD*',	NULL,	'Do not delete or modify this user. It is integral to RT''s internal database structures',	NULL,	NULL,	NULL,	NULL,	'The RT System itself',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(6,	'Nobody',	'*NO-PASSWORD*',	NULL,	'Do not delete or modify this user. It is integral to RT''s internal data structures',	NULL,	'',	NULL,	NULL,	'Nobody in particular',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2026-01-18 17:25:33',	1,	'2026-01-18 17:25:33'),
(14,	'root',	'!bcrypt!12!qRlsVxT9ETJ8kA4pSzlDQO0fEeG7SOlXz8UWLyku6aYN9oCQSIjo6',	NULL,	'Yes, I am SuperUser',	NULL,	'admin@localhost',	NULL,	NULL,	'Jon Snow',	'WhiteWolf',	'en',	'root',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Winterfell',	NULL,	NULL,	'Westeros',	'UTC',	NULL,	NULL,	NULL,	1,	'2026-01-18 14:45:04',	1,	'2026-01-18 14:45:04'),
(44,	'tony',	'!bcrypt!12!1jkvw5nLECtgsgbGiM4hc.S/hKEYFHUajslwOR6zIDFszqfLG7sBy',	NULL,	NULL,	'Best regards

Tony - genius, inventor, Incident Handler',	'tony@localhost',	NULL,	NULL,	'Tony Stark',	'ironman',	'en',	'tony',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UTC',	NULL,	NULL,	NULL,	14,	'2024-11-18 14:48:09',	14,	'2024-11-18 14:48:09'),
(46,	'yoda',	'!bcrypt!12!7kTXP2o8PsiCGvJmr8C18e9JKAY.CBcCcxw.mxg1dsZg7ytZtoLvy',	NULL,	NULL,	'Best regards

Yoda - Jedi Master, mentor, Incident Handler',	'yoda@localhost',	NULL,	NULL,	'Master Yoda',	'grandmaster',	'en',	'yoda',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UTC',	NULL,	NULL,	NULL,	14,	'2025-01-18 11:30:19',	14,	'2025-01-18 11:30:19'),
(48,	'joker',	'!bcrypt!12!YOFxI5/2DkFjY.FoP36DI.7Es9jPGd6BDwgJvTSltvRUozW.sKzCe',	NULL,	NULL,	'Best regards

Joker - chaos agent, prankster, Incident Handler',	'joker@localhost',	NULL,	NULL,	'The Joker',	'jo"ker;;😈',	'en',	'joker',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'UTC',	NULL,	NULL,	NULL,	14,	'2024-12-18 09:02:25',	14,	'2024-12-18 09:02:25');

ALTER TABLE ONLY "public"."cachedgroupmembers" ADD CONSTRAINT "cachedgroupmembers_via_fkey" FOREIGN KEY (via) REFERENCES cachedgroupmembers(id) ON DELETE CASCADE NOT DEFERRABLE;

