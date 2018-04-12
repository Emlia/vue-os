-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-04-12 04:50:27
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
(0, '{\"1\":[\"B\"],\"2\":[],\"3\":[\"D\"],\"4\":[\"C\"],\"5\":[\"A\"],\"15\":[\"D\"],\"31\":[\"A\",\"D\"],\"32\":[\"D\"],\"34\":[\"B\"],\"35\":[\"A\",\"B\",\"D\"]}', '{\"6\":[\"B\"],\"8\":[\"B\"],\"12\":[\"C\"],\"16\":[\"C\"],\"18\":[\"C\"],\"20\":[\"E\"],\"26\":[],\"28\":[\"B\"],\"29\":[],\"30\":[]}', '{\"1\":[\"A\"],\"3\":[\"C\"],\"4\":[],\"5\":[],\"6\":[],\"7\":[],\"8\":[],\"9\":[],\"10\":[],\"11\":[],\"12\":[],\"13\":[],\"14\":[],\"15\":[],\"16\":[],\"17\":[],\"18\":[],\"19\":[],\"20\":[],\"21\":[],\"22\":[],\"23\":[],\"24\":[],\"25\":[],\"26\":[],\"27\":[],\"28\":[],\"29\":[]}', '[25,29,28,19,27,15,11,5,4,3,2,1,0,7,6,8,9,10,12,13,14,16,17,18,20,21,22,23,24,26,30,31,33,34]'),
(1, '{\"1\":[\"A\"],\"2\":[\"C\"]}', '{\"4\":[\"C\"],\"7\":[\"C\"],\"8\":[\"B\"],\"9\":[],\"10\":[\"C\"],\"13\":[\"A\"],\"14\":[],\"18\":[\"B\"],\"23\":[],\"30\":[\"C\"]}', '{\"1\":[\"A\"],\"3\":[\"B\"]}', '[3,6,7,8,9,12,13,17,22,29,0,2,1]');

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
(1, '操作系统引论', '1'),
(2, '进程的描述与控制', '2'),
(3, '处理机调度与死锁', '3'),
(4, '存储器管理', '4'),
(5, '虚拟存储器', '5'),
(6, '输入输出系统', '6'),
(7, '文件管理', '7'),
(8, '磁盘存储器的管理', '8'),
(9, '操作系统接口', '9'),
(10, '多处理机操作系统', '10'),
(11, '多媒体操作系统', '11'),
(12, '保护和安全', '12');

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
(1, 1, '[\"4\",\"6\",\"5\"]', 1, '[\"B\"]', '操作系统对进程的管理和控制主要是通过控制原语言实现的。', '', '操作系统执行和监督进程控制操作，往往通过执行各种原语操作实现。计算机控制器的机器指令是微操作构成的，原语是机器指令的延伸，是由若干条机器指令构成用以完成特定功能的一段程序。为保证操作的正确性，它们应当是原子操作(AtomicOperation)。所谓原子操作是指：一个操作中的所有动作，要么全做，要么全不做。原子操作是一个不可分割的操作。它的实现依靠提高处理机优先级屏蔽中断。 \n进程控制原语包括：进程创建，进程阻塞，唤醒进程和进程终止四个原语。', '[\"错\",\"对\"]'),
(2, 2, '[\"4\",\"6\",\"5\"]', 2, '[\"C\"]', '二分查找的时间复杂度（ ）', '', '因为二分查找每次排除掉一半的不适合值，所以对于n个元素的情况：\n一次二分剩下：n/2\n两次二分剩下：n/2/2 = n/4\n。。。\nm次二分剩下：n/(2^m)\n在最坏情况下是在排除到只剩下最后一个值之后得到结果，所以为\nn/(2^m)=1;\n2^m=n;\n所以时间复杂度为：log2(n)', '[\"O(N*log(N))\",\"O(N)\",\"O(log(N))\",\"O(N^2)\"]'),
(3, 1, '[\"4\",\"6\",\"5\"]', 1, '[\"C\"]', '一进程刚获得三个主存块的使用权，若该进程访问页面的次序是｛1321215123｝，采用LRU算法时，缺页数是______次。', '', 'LRU算法：Least Recently Used即最近最久未使用\n2 3 1  3次\n1 2 3 \n2 1 3\n1 2 3\n5 1 2  1次\n1 5 2\n2 1 5 \n2 1 3  1次\n缺页数一共5次', '[\"3\",\"4\",\"5\",\"6\"]'),
(4, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '如果I/O设备与存储设备间的数据交换不经过CPU来完成，则这种数据交换方式是____。', '', 'DMA 的英文拼写是“Direct Memory Access”,汉语的意思就是直接内存访问,是一种不经过CPU而直接从内存存取数据的数据交换模式。', '[\"程序查询方式\",\"中断方式\",\"DMA方式\",\"提供主、辅存接口\"]'),
(5, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"B\"]', '操作系统中两个进程争夺同一个资源会发生什么情况？', '', '只有满足死锁的四个必要条件 才有可能发生死锁\n①互斥条件 ②不可剥夺条件 ③请求与保持条件 ④循环等待条件\n', '[\"一定死锁或阻塞\",\"不一定死锁\",\"不会死锁\",\"以上说法都不对\"]'),
(6, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '摒弃不可剥夺条件的方法不能用于预防多个打印进程死锁的发生。', '', '死锁的4个条件\n1.不可剥夺\n2.互斥\n3.请求和保持\n4.环路等待\n破坏一个即可破坏死锁', '[\"错\",\"对\"]'),
(7, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '利用通道实现了（）之间数据的快速传输。', '', 'DMA控制器的出现已经减轻了CPU对数据输入输出的控制、使得CPU的效率合显著的提高．而通道的出现则进一步提高了CPU的效率．这是因为通道是一个特殊功能的处理 器．它有自己的指令和程序专门负责数据输入输出的传输控制．而CPU将“传输控制”的功能下放给通道后只负责“数据处理”功能．这样．通道与CPU分时使 用内存，实现了CPU内部运算与I/O设备的平行工作．', '[\"CPU和外设\",\"内存和CPU\",\"内存和外设\",\"外设和外设\"]'),
(8, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '引入多道程序的目的在于（）。', '', '多道程序设计，是在内存中同时存放几道相互独立的程序，无论何时都有程序在执行，充分利用CPU。', '[\"充分利用CPU，减少CPU等待时间\",\"提高实时响应速度\",\"有利于代码共享，减少主、辅存信息交换量\",\"充分利用存储器\"]'),
(9, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '页表的作用是实现从页号到物理块号的（ ）', '', '在页式管理中，页表的作用是实现从页号到物理块号的地址映射，存储页表的作用是记录内存页面的分配情况。 页表实际上就是进程的虚存空间与系统中的物理存储空间的一个映射关系。因为每个进程都有自己独立的虚存空间，所以操作系统需要为每个进程保存一个页表。进程切换的时候操作系统就会把即将调度运行的那个进程的页表加载MMU，完成地址空间的切换。', '[\"逻辑映射\",\"物理映射\",\"地址映射\",\"逻辑地址映射\"]'),
(10, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '下面所述步骤中，不是创建进程所必须的步骤是？', '', '1,申请空白PCB（进程控制块）；\n2,为新进程分派资源；\n3,初始化PCB；\n4,将新进程插入就绪队列；', '[\"由调度程序为进程分配CPU\",\"建立一个进程控制块\",\"为进程分配内存\",\"将进程控制块链入就绪队列\"]'),
(11, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '如果信号量的当前值为－4，则表示系统中在该信号量上有（）个进程等待。', '', '信号量当前值为-（m-1），当前为-4，表示有5个进程共享同一临界资源，但是临界资源只能由一个进程享用，因此等待的进程数为4，其实等待的进程数就是（m-1）', '[\"4\",\"3\",\"5\",\"0\"]'),
(12, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"D\"]', '一般用户更喜欢使用的系统是（）。', '', '们熟知的Windows XP、Linux、Mac OS X等都是多用户多任务分时操作系统，可见这个概念一直延续到了今天。它们最显著的特点就是可以让多个人使用同一台电脑而且不能互相窥探对方的秘密。当你使用电脑的时候可以边听音乐边看新闻，同时还能跟朋友聊天。只要你觉得你的大脑还能处理得过来，你还能让这台电脑同时干更多的事情。其实这类操作系统我们完全可以只用“分时”二字简要概述下来。因为“分时”就像它最初的定义那样：将电脑的时间资源适当分配给所有使用者身上，让所有使用者有独占机器的感觉。但是如果把“使用者”进行抽象，就不仅可以代表人，还可以将任务也理解为电脑时间资源的使用者，那么“分时”就是多用户和多任务的基础和前提。所以，既然是“分时”的，一般都会支持多用户和多任务\n', '[\"手工操作\",\"单道批处理\",\"多道批处理\",\"多用户分时系统\"]'),
(13, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"D\"]', '特权指令可以在（）中执行。', '', 'CPU状态分为管态和目态，CPU的状态属于程序状态字PSW的一位，\n管态又称特权状态、系统态或核心态。通常，操作系统在管态下运行，CPU在管态下可以执行指令系统的全集。 \n目态又称常态或用户态。机器处于目态时，程序只能执行非特权指令。用户程序只能在目态下运行。 \n\n一般说来，在单用户，单任务的计算机中不具有也不需要特权指令，而在多用户，多任务的计算机系统中，特权指令却是不可缺少的。它主要用于系统资源的分配和管理，包括改变系统的工作方式，检测用户的访问权限，修改虚拟存储器管理的段表，页表和完成任务的创建和切换等。 ', '[\"目态\",\"浏览器中\",\"任意的时间\",\"进程调度中\"]'),
(14, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '用户程序发出磁盘I/O 请求后， 系统的处理流程是：用户程序→系统调用处理程序→设备骆动程序→中断处理程序。其中，计算数据所在磁盘的柱面号、磁头号、扇区号的程序是（ ）。 ', '', '计算磁盘柱面号、磁头号和扇区号就是设备驱动程序要做的事……\n我的理解是，磁盘I/O是要直接和硬件打交道，一般来说不同的硬件需要用不同的设备驱动程序，然后针对具体的某个硬件来计算物理存储位置', '[\"用户程序\",\"系统调用处理程序\",\"设备驱动程序\",\"中断处理程序\"]'),
(15, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"D\"]', 'OS的不确定性是指（）', '', 'OS的四个特性：井发性、共享性,虚拟性和异步性。\n异步性： 在多道程序环境下，允许多个进程并发执行。但由于资源等因素的限制，进程的执行通常并非一气呵成，而是以走走停停的方式运行。内存中的每个进程在何时执行，何时暂停，以怎样的速度向前推进，每道程序总共需要多少时间才能完成，都是不可预知的。故而作业完成的先后次序与进入内存的次序并不完全一致，亦即进程是以异步方式运行的。所以异步性就是OS不确定性的原因，会导致 1. 程序的运行结果不确定   2. 程序的运行次序不确定  3. 程序多次运行的时间不确定', '[\"程序的运行结果不确定\",\"程序的运行次序不确定\",\"程序多次运行的时间不确定\",\"其他三项\"]'),
(16, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '若一个用户进程通过read 系统调用读取一个磁盘文件中的数据，则下列关于此过程的叙述中，正确的是（ ）。\nⅠ． 若该文件的数据不在内存中，则该进程进入睡眠等待状态 \nⅡ． 请求 read 系统调用会导致 CPU 从用户态切换到核心态 \nⅢ． read 系统调用的参数应包含文件的名称', '', '若文件的数据不在内存中，则进程进入睡眠模式的目的是等待内存对磁盘上文件的映射，因为磁盘的读取比较慢，所以事进入睡眠模式。\nread是系统调用，所以CPU从用户态切换到核心态。\nopen系统调用应该包含文件的名称，read只是包含输入流。', '[\"仅Ⅰ、 Ⅱ\",\"仅Ⅰ、 Ⅲ\",\"仅Ⅱ、 Ⅲ\",\"Ⅰ、 Ⅱ和Ⅲ\"]'),
(17, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"D\"]', '广告系统为了做地理位置定向，将IPV4分割为627672个区间，并标识了地理位置信息，区间之间无重叠，用二分查找将IP地址映射到地理位置信息，请问在最坏的情况下，需要查找多少次?', '', 'log(627672)/log(2) = 19.26', '[\"17\",\"18\",\"19\\n\",\"20\\n\"]'),
(18, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '在可变式分区分配方案中，只需要进行一次比较就可以判定系统是否能满足作业对主存空间要求的算法是（）。', '', '题目出的有问题吧，各个算法依次比较都能够判断判定系统是否能满足作业对主存空间要求；\n最先适应算法：依次判定后找到第一个满足要求的哈\n最佳适应算法：对空闲区按从小到大排序，第一个满足的就是啦\n最差适应算法：对空闲区按从大到小排序，第一个满足的就是啦\n\n固定式分区算法：是分区的', '[\"最先适应算法\",\"最佳适应算法\",\"最差适应算法\",\"固定式分区算法\"]'),
(19, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"C\"]', '下列措施中，能加快虚实地址转换的是 （）\n1增大快表（TLB）  2让页表常驻内存   3增大交换区', '', '增大TLB，是为了避免去内存中匹配页表。TLB本身就在cache里，而且能并行计算。把页表都放在内存里，也是可以的，但一般页表很大，可以经过多级页表和反置页表处理后再放在内存里。交换区是内存不够用时的解决手段，增大交换区能腾出更多地方。', '[\"仅1\",\"仅2\",\"仅1,2\",\"仅2,3\"]'),
(20, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"B\"]', '某操作系统采用分页存储管理方式，下图给出了进程A和进程B的页表结构。如果物理页的大小为512字节，那么进程A与进程B的物理内存总共使用了____字节。\n进程A页表：                         进程B页表：\n\n逻辑页    物理页                     逻辑页    物理页\n\n0            9                       0            1\n\n1            2                       1            3\n\n2            4                       2            4\n\n3            6                       3            7\n\n4                                    4            2\n\n5                                    5', '', '物理页可以在进程间共享，两个进程共使用了1,2,3,4,6,7,9，共7个物理页。\n故：7*512=3584', '[\"4608\",\"3584\",\"4096\",\"5120\",\"2560\",\"2048\"]'),
(21, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"B\"]', '把作业地址空间中使用的逻辑地址变成内存中物理地址称为（）。', '', '程序执行时，必须将地址空间变为绝对地址才能访问系统分配的内存\n\n地址重定位：操作系统把用户程序指令中的相对地址变换成为所在存储中的绝对地址的过程\n\n地址重定位实现了：从逻辑地址到物理地址的转换\n\n按照重定位时机分类：静态重定位、动态重定位\n\n1. 地址的静态重定位\n定义：在程序运行之前，为用户程序实行了地址重定位工作\n\n一般由操作系统中的重定位装入程序完成\n\n重定位装入程序的输入：用户把自己的作业链接装配成一个相对于 0 编址的目标程序\n\n过程：\n\n重定位装入程序根据当前内存的分配情况，按照分配区域的起始地址逐一调整目标程序指令中的地址部分。目标程序在经过重定位装入程序加工之后，不仅进入到分配给自己的绝对地址空间中，而且程序指令中的地址部分全部进行了修正，反映出了自己正确的存储位置，保证了程序的正确运行\n\n特点：\n\n在装入前实现调整\n\n地址要有标识\n\n每次装入都要进行定位\n\n装入后地址不再改变（静态）\n\n2. 地址的动态重定位\n定义：在程序执行寻址时进行重定位，访问地址时，通过地址变换机构改变为内存地址\n\n用户程序原封不动的装入内存，运行时再完成地址的定位工作\n\n动态重定位需要硬件的支持，要求系统中配备定位寄存器和加法器\n\n特点：\n\n程序可装入任意内存区域（不要求占用连续的内存区）\n\n只装入部分程序代码即可运行\n\n改变系统时不需要改变程序（程序占用的内存空间动态可变，只需要改变定位寄存器中的值即可）\n\n程序可方便共享\n\n', '[\"加载\",\"重定位\",\"物理化\",\"逻辑化\"]'),
(22, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"D\"]', '以下关于线程以下描述正确的是（）\n1.windows线程创建时，默认绑定在1个特定的CPU上\n2.可采用SetThreadAffinityMask接口设置线程与某个cpu绑定\n3._beginthreadex比CreateThread创建线程安全是因为使用_beginthreadex会创建一个_tiddata,在调用一些诸如strtok函数时会将需要保护的数据存入_tiddata\n4.使用_beginthread创建线程时，线程执行函数必须为_cdecl约束规范，而_beginthreadex指定的线程执行函数必须为_stdcall', '', '解释：1：不正确。windows线程创建时，不会绑定在特定的CPU上，需要手动绑定，或者调用 SetThreadAffinityMask接口进行绑定；\n           2：正确。参考  http://blog.csdn.net/beyond_cn/article/details/15813361\n           3：不正确。参考2的链接。欢迎各位纠正。\n           4：正确。参考msdn: \n            _beginthread 函数可创建在 start_address 开始执行例程的线程。  start_address 中的例程必须使用  __cdecl （用于本机代码）或  __clrcall （用于托管代码）调用约定，并且应没有返回值。\n            传递给  _beginthreadex   的   start_address   中的例程必须使用   __stdcall （用于本机代码）或   __clrcall （用于托管代码）调用约定，并且必须返回线程退出代码。\n            所以，通过1，就能选出D。', '[\"1，2\",\"1，3\",\"1\",\"以上都不正确\"]'),
(23, 1, '[\"4\",\"6\",\"5\"]', 0, '[\"A\"]', '存储管理方法中，（）用户可采用覆盖技术。', '', '在单道连续分配中，当存储空间容不下程序时，可采用覆盖方法来解决；覆盖基本思想：由于程序运行时并非各个部分都要访问，因此可以将用户空间分成一个固定区和多个覆盖区。将经常活跃的放入固定区，将那些将要用的段放入覆盖区，在需要时提前调入覆盖区，替换原有的段\n覆盖技术是早期在单一连续存储管理中使用的扩大存储器容量的一种技术。', '[\"单一连续区\",\"可变分区存储管理\",\"段式存储管理\",\"段页式存储管理\"]'),
(24, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"A\",\"B\",\"C\",\"D\"]', '以下哪一项是属于产生死锁的必要条件？', '', '操作系统死锁，在操作系统课程当中属于比较关注的一个知识点，在这里做个简单的梳理。\n1、死锁的四个必要条件\n操作系统中有若干进程并发执行，它们不断申请、使用、释放系统资源，虽然系统的进程协调、通信机构会对它们进行控制，但也可能出现若干进程都相互等待对方释放资源才能继续运行，否则就阻塞的情况。此时，若不借助外界因素，谁也不能释放资源，谁也不能解除阻塞状态。根据这样的情况，操作系统中的死锁被定义为系统中两个或者多个进程无限期地等待永远不会发生的条件，系统处于停滞状态，这就是死锁。\n产生死锁的原因主要是：\n（1） 因为系统资源不足。\n（2） 进程运行推进的顺序不合适。\n（3） 资源分配不当等。\n如果系统资源充足，进程的资源请求都能够得到满足，死锁出现的可能性就很低，否则就会因争夺有限的资源而陷入死锁。其次，进程运行推进顺序与速度不同，也可能产生死锁。产生死锁的四个必要条件：\n（1） 互斥条件：一个资源每次只能被一个进程使用。\n（2） 请求与保持条件：一个进程因请求资源而阻塞时，对已获得的资源保持不放。\n（3） 不剥夺条件:进程已获得的资源，在末使用完之前，不能强行剥夺。\n（4） 循环等待条件:若干进程之间形成一种头尾相接的循环等待资源关系。\n这四个条件是死锁的必要条件，只要系统发生死锁，这些条件必然成立，而只要上述条件之一不满足，就不会发生死锁。\n死锁的解除与预防：\n理解了死锁的原因，尤其是产生死锁的四个必要条件，就可以最大可能地避免、预防和解除死锁。所以，在系统设计、进程调度等方面注意如何不让这四个必要条件成立，如何确定资源的合理分配算法，避免进程永久占据系统资源。此外，也要防止进程在处于等待状态的情况下占用资源。因此，对资源的分配要给予合理的规划。', '[\"互斥条件\",\"请求与保持条件\",\"不剥夺条件\",\"循环等待条件\"]'),
(25, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"B\",\"C\",\"D\"]', '关于死锁的说法正确的有？', '', '首先，在做这道题时，需要知道死锁有哪些必要条件，必要条件是什么呢，就是说只要死锁，这些条件一定有成立。必要条件书上都有，照搬一下：\n互斥条件:指进程对所分配的资源进行排它性使用，也就是说在某一段时间内，某资源只被一个进程占用，如果还有其它进程请求该资源，则请求的进程只能等待，直到该资源被释放。\n请求和保持条件:指一个进程已经拥有了某些资源,但是它还需要其它资源,于是又提出新的申请,而该资源又偏偏被其它进程占用,此时该申请资源的进程产生了阻塞, 它又不释放自己已占有的资源。\n不剥夺条件:指进程已获得的资源不能被剥夺,只有自己使用完之后才释放.( 可见如果资源可被剥夺,该条就不成立,所以A错 )\n环路等待条件:指发生死锁的时候,一定存在一个环路:进程1-资源2(被进程2占用)-资源3(被进程3占用).............-进程n-资源1(被进程1占用)( 可见C正确 )\n      选项AC上面已解答,还差BD,先看B, 其实我们只需要知道临时性资源这个东东就可以解出答案了.我刚开始忘记它是什么了,临界资源吗???后来翻开书,找到了.\n       先举个例子： \n       永久性资源指不管你用不用,它就在那里,不消失.\n       那么临时性资源指的是某些资源被一个进程产生, 被其它进程使用一段时间以后便没有利用价值的资源.也就是说人家只用一会儿, 用完你就可以该干嘛干嘛去.那它为什么可能会产生死锁呢.\n        大家可以想一个,假如有3个进程P1，P2，P3\n         \n         p1产生s1资源, p2产生s2资源,p3产生s3资源,\n        但是,p1还需要s2资源,p2还需要s3资源,p3还需要s1资源.\n        这些资源都是进程产生的,但是进程结束后就消失的资源.\n        如果请求不恰当,就会造成死锁,例如p1先请求s2,但是s2又请求下去, 三个进程都需要对方产生的临\n        时资源才能运行, 死锁........................所以B也对；\n        再看D,其实这个答案我之前觉得不对,后来想想,全部请求才可以运行,不运行这些资源就不是它的,\n        它就不占用. 也就是说 计算机有几个资源,这些资源够谁用谁就运行,不够就不运行.因此也就不会出\n        现某进程运行一半的时候需要请求新资源,但又请求不到而死锁。所以D也正确\n        综上,答案BCD', '[\"竞争可剥夺资源会产生死锁\",\"竞争临时资源会产生死锁\",\"在发生死锁时，必然存在一个进程—资源的环形链\",\"如果进程在一次性申请其所需的全部资源成功后才运行，就不会发生死锁。\"]'),
(26, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"A\",\"C\"]', '下面会引起进程创建的事件是()。', '', '在多道程序环境中，只有进程才能在系统中运行。因此为了使程序运行必须为其创建进程，而导致进程创建的时间典型的有四种：\n1.用户登录。可以理解为，一个新的用户来了，需要为它提供服务，这个服务之前没有，所以要创建。\n2.作业调度。系统会为调度的作业分配资源，从后备队列中将其放入内存中，并为其创建进程。\n3.提供服务。\n4.应用请求。', '[\"用户登录\",\"设备中断\",\"作业调度\",\"执行系统调用\"]'),
(27, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"B\",\"C\",\"D\"]', '在154个元素组成有序表进行二分法查找，可能的比较次数为', '', '[log2(154)] = 7，最差的情况下找8次，所以8次及8次以内都有可能找到。', '[\"10\",\"8\",\"4\",\"1\"]'),
(28, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"A\",\"B\",\"D\"]', '下列哪一个选项是引入缓冲的原因（）。', '', 'A：CPU运算速度远高于I/O设备，如果没有缓冲区，必然导致打印机的速度跟不上，这样就会是CPU停下来等待\nB：我们之前每传送一位数据，就会中断一次CPU，假如我们采用8位的缓存寄存器，我们就可以减少CPU的中断频率\nD：我们可以在CPU执行后就处理下一个任务，打印机从缓冲区中取得数据\n', '[\"缓冲CPU和I/O设备间速度不匹配的矛盾\",\"减少对CPU的中断频率，放宽对蓄洪大响应时间的限制\",\"减少CPU对I/O控制的干预\",\"提高CPU和I/O设备之间的并行性\"]'),
(29, 2, '[\"4\",\"6\",\"5\"]', 0, '[\"A\",\"D\"]', '测得某个请求调页的计算机系统部分状态数据为：CPU利用率20%，用于对换空间的硬盘利用率为97.7%，其他设备的利用率为5%。由此断定该系统异常。此情况下（）能提高CPU的利用率。', '', '对换空间的硬盘利用率为97.7% 可见进程数目太多导致内存不足，导致频繁的换页', '[\"安装一个更快的硬盘。\",\"增加进程使用的盘块数目。\",\"增加运行进程的数目。\",\"减少运行的进程数目。\"]'),
(30, 2, '[\"4\",\"6\",\"5\"]', 2, '[\"B\",\"D\"]', '下列关于请求页式存储管理中，正确的是（）。', '', 'https://uploadfiles.nowcoder.net/images/20160905/6316247_1473087880717_958CCEE653DB98796A2C1F27F77A5622', '[\"采用静态重定位\",\"采用动态重定位\",\"内存静态分配\",\"内存动态分配\"]'),
(31, 2, '[]', 12, '[\"B\",\"A\"]', 'asdghyuas', '', 'eeeeeee', '[\"aaaa\",\"bbbbbbbbb\",\"cccccccccccccc\",\"dddddddd\",\"eeeeeeee\"]'),
(32, 1, '[]', 3, '[\"C\"]', '222', '333', '999', '[\"444\",\"555\",\"777\",\"888\"]'),
(34, 1, '[]', 2, '[\"B\"]', 'ewfrd', 'aafe', 'aefaw', '[\"saedf\",\"sdf\",\"sdf\",\"asdf\"]'),
(35, 2, '[]', -1, '[\"A\",\"B\",\"D\"]', 'eqwedqweqaw', '', 'qwaed', '[\"qweqwqw\",\"eqweedwqa\",\"weqw\",\"wqedq\"]');

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
(1, 'emlia', 'emlia103', 'cf5a956f3f9e58e05acbf89fc1a36fad'),
(2, 'admin', 'admin', 'cf5a956f3f9e58e05acbf89fc1a36fad'),
(3, '啦啦啦', 'eee', 'cf5a956f3f9e58e05acbf89fc1a36fad'),
(5, 'as', '213', '05ef3c699a99ab4be606885abbb1d70f'),
(6, 'as', '213', 'cf5a956f3f9e58e05acbf89fc1a36fad'),
(7, 'sdca', 'asd', 'bbf1b61a9d0c99a18dfef6741628b986'),
(8, 'sdca', 'asd', 'cfff630a335cca2c1fae5e1de001d8bd'),
(9, 'qqq', 'qqq', '1af1367c0fef80b1c5ca5bf5836ba275'),
(10, 'eee', 'eee', '788af8723168763e429c583ac8e2f93c');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
