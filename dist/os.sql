-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-04-28 14:44:56
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `os`
--

-- --------------------------------------------------------

--
-- 表的结构 `answer`
--

CREATE TABLE `answer` (
  `userid` int(11) NOT NULL,
  `orderAnswer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `simulationAnswer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapterAnswer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `error` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `answer`
--

INSERT INTO `answer` (`userid`, `orderAnswer`, `simulationAnswer`, `chapterAnswer`, `error`) VALUES
(1, '{\"1\":[\"D\"],\"2\":[\"A\"],\"3\":[\"A\"],\"4\":[\"B\"],\"5\":[\"A\"]}', '{}', '{}', '[0,1,3,2]');

-- --------------------------------------------------------

--
-- 表的结构 `chapter`
--

CREATE TABLE `chapter` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `chapter`
--

INSERT INTO `chapter` (`id`, `label`, `value`) VALUES
(1, '绪论', '1'),
(2, '进程管理', '2'),
(3, '内存管理和虚拟存储', '3'),
(4, '文件管理', '4'),
(5, '输入/输出(I/O)管理', '5');

-- --------------------------------------------------------

--
-- 表的结构 `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `configuration`
--

INSERT INTO `configuration` (`id`, `notice`) VALUES
(999, '{\"notice\":\"test notcie\",\"switch\":false}');

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `analysis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `question`
--

INSERT INTO `question` (`id`, `type`, `tag`, `chapter`, `answer`, `text`, `src`, `analysis`, `options`) VALUES
(1, 1, '[]', 1, '[\"A\"]', '从用户的观点来看,操作系统是', '', 'B,C,D是从功能角度对操作系统的描述', '[\"用户与计算机之间的接口\",\"控制和管理计算机资源的软件\",\"合理地组织计算机工作流程的软件\",\"由若干层次的程序按照一定的结构组成的有机体\"]'),
(2, 1, '[]', 1, '[\"B\"]', '操作系统的功能是进行处理器管理、（  ）管理、设备管理、文件管理及提供用户接口。', '', '题目应该是从资源管理的观点来看的。如果从资源管理的观点来看，操作系统的功能应该包括：\n处理机管理：进程管理应该是属于处理机管理的一部分，不同类型的操作系统将针对不同情况来采取不同的调度策略。如先来先服务、优先级调度、分时轮转等调度策略，来提高系统资源的利用率。\n存储器管理：主要是指针对计算机的主存管理。\n设备管理：主要涉及对系统中的各种输入/输出设备等的管理和控制问题。\n文件管理：又称信息管理或文件系统，在现代计算机操作系统中，将各种信息资源组织成文件存储在计算机的硬盘或者磁带上。文件管理就是对这些信息资源进行存储、检索和保护，以便用户能方便、安全地访问它们。', '[\"进程\",\"存储器\",\"硬件\",\"软件\"]'),
(3, 1, '[]', 1, '[\"D\"]', '操作系统的（  ）管理部分负责对进程进行调度。', '', '进程管理就是控制进程如何使用处理器，所以归类于处理器管理部分。', '[\"主存储器\",\"控制器\",\"运算器\",\"处理器\"]'),
(4, 1, '[]', 1, '[\"C\"]', '在单处理器系统中实现并发技术后，（  ）。', '', '在单处理器系统中，进程与进程是不能并行的，但可以并发。', '[\"各进程在某一时刻并行运行，CPU和I/O设备间并行工作。\",\"各进程在一个时间段内并行运行，CPU和I/O设备间串行工作。\",\"各进程在一个时间段内并行运行，CPU和I/O设备间并行工作。\",\"各进程在某一时刻并行运行，CPU和I/O设备间串行工作。\"]'),
(5, 1, '[]', 1, '[\"D\"]', '订购机票系统处理来自各个终端的服务请求，处理后通过终端回答用户，所以它是一个（  ）', '', '订票系统需根据当前资源余量做出即时响应，属于实时系统。', '[\"分时系统\",\"多道批处理系统\",\"计算机网络\",\"实时信息处理系统\"]'),
(6, 1, '[]', 1, '[\"D\"]', '下列选项中，（  ）不是操作系统关心的主要问题。', '', '', '[\"管理计算机裸机\",\"设计提供用户程序与计算机硬件系统的界面\",\"管理计算机系统资源\",\"高级程序设计语言的编译器\"]'),
(7, 1, '[]', 1, '[\"C\"]', '批处理系统的主要缺点是（ \n ）', '', '多道批处理系统的缺点是延长了作业的周转时间，用户不能进行直接干预，缺少交互性，不利于程序的开发与调试。', '[\"CPU利用率\",\"不能并发执行\",\"缺少交互性\",\"以上都不是\"]'),
(8, 1, '[]', 2, '[\"A\"]', '以下关于进程的描述中，（ ）不符合操作系统对进程的理解。', '', '进程是程序关于某个数据集合在处理器上的一次执行过程，可以和别的进程并发执行。', '[\"一个进程只能执行一个程序\",\"进程可以由程序、数据和进程控制块描述\",\"进程是资源分配的基本单位，也是独立运行的基本单位\",\"进程是程序在一个数据集合上运行的过程，它是系统调度的独立单位\"]'),
(9, 1, '[]', 2, '[\"D\"]', '在进程状态转换时，下列转化中不可能发生的是（  ）', '', '阻塞态不能直接转换成执行态，只有就绪态可以变成执行状态。', '[\"就绪状态->执行状态\",\"执行状态->就绪状态\",\"执行状态->阻塞状态\",\"阻塞状态->执行状态\"]'),
(10, 1, '[]', 2, '[\"D\"]', '以下可能导致一个进程从执行状态变成就绪状态的事件是（  ）', '', '', '[\"一次I/O操作结束\",\"运行进程需要做I/O操作\",\"运行进程结束\",\"出现了比现在进程优先级更高的进程\"]'),
(11, 1, '[]', 2, '[\"C\"]', '进程在（  ）时处于非阻塞状态', '', '', '[\"等待键盘输入数据\",\"等待协助进程的一个信号\",\"等待操作系统分配CPU\",\"等待网络数据进入内存\"]'),
(12, 1, '[]', 2, '[\"A\"]', '下列关于线程和进程的叙述中，正确额是（  ）\nI. 线程包含CPU现场，可以独立执行程序\nII. 每个线程都有自己独立的地址空间\nIII. ', '', '', '[\"I、II、IV\",\"I、VI\",\"II、IV\",\"III、VI\"]');

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `label`, `value`) VALUES
(4, '死锁', 'Deadlock'),
(5, '线程', 'thread'),
(6, '状态', 'state');

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `type`
--

INSERT INTO `type` (`id`, `label`, `value`) VALUES
(1, '单选', 'radio'),
(2, '多选', 'checkbox');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appkey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `appkey`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '4251a24d19641f3cccebd161094a5941'),
(2, 'emlia', '18bf000c6b771e9e8e5641226399db7c', 'dff473d1c14e1efddeb0d46e31f67a04'),
(3, 'emlia11', '5907a4cd649cb2f14b0cf4af140ba0cb', 'e559ca6c3ea21fee888f6382a512803e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- 使用表AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
