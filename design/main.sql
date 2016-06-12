/*
Navicat SQLite Data Transfer

Source Server         : blog
Source Server Version : 30808
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30808
File Encoding         : 65001

Date: 2016-06-12 14:41:01
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS "main"."api";
CREATE TABLE "api" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"authname"  TEXT NOT NULL,
"url"  TEXT NOT NULL,
"describe"  TEXT
);

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO "main"."api" VALUES (2, 'overview', '/admin/overview', 'overview访问权下');
INSERT INTO "main"."api" VALUES (3, 'custume', '/admin/custume', '个性化访问权限');
INSERT INTO "main"."api" VALUES (4, 'addblog', '/articles/addblog', '添加一个博客');
INSERT INTO "main"."api" VALUES (5, 'editblog', '/articles/editblog', '修改一个博客');
INSERT INTO "main"."api" VALUES (6, 'deleteblog', '/articles/deleteblog', '删除一个博客');
INSERT INTO "main"."api" VALUES (7, 'addcmt', '/articles/comment/add', '添加一个评论');
INSERT INTO "main"."api" VALUES (8, 'updatecmt', '/articles/comment/update', '修改一个评论');
INSERT INTO "main"."api" VALUES (9, 'deletecmt', '/articles/comment/delete', '删除一条评论');
INSERT INTO "main"."api" VALUES (10, 'adduser', '/admin/users/add', null);
INSERT INTO "main"."api" VALUES (11, 'deleteuser', '/admin/users/delete', null);
INSERT INTO "main"."api" VALUES (12, 'getuser', '/admin/users/get', null);
INSERT INTO "main"."api" VALUES (13, 'updateuser', '/admin/users/update', null);
INSERT INTO "main"."api" VALUES (14, 'login', '/login', null);
INSERT INTO "main"."api" VALUES (15, 'register', '/register', null);
INSERT INTO "main"."api" VALUES (16, 'logout', '/logout', null);
INSERT INTO "main"."api" VALUES (17, 'usertypeadd', '/admin/auth/usertype/add', null);
INSERT INTO "main"."api" VALUES (18, 'usertypeupdate', '/admin/auth/usertype/update', null);
INSERT INTO "main"."api" VALUES (19, 'usertypapienable', '/admin/auth/usertypeapi/enable', null);
INSERT INTO "main"."api" VALUES (20, 'usertypeapidisable', '/admin/auth/usertypeapi/disable', null);
INSERT INTO "main"."api" VALUES (21, 'usertypeviewenable', '/admin/auth/usertypeview/enable', null);
INSERT INTO "main"."api" VALUES (22, 'usertypeviewdisable', '/admin/auth/usertypeview/disable', null);
INSERT INTO "main"."api" VALUES (23, 'costome', '/admin/costume', null);
INSERT INTO "main"."api" VALUES (24, 'usertypedelete', '/admin/auth/usertype/delete', null);

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS "main"."articles";
CREATE TABLE "articles" (
"id"  INTEGER NOT NULL,
"title"  TEXT NOT NULL,
"content"  TEXT,
"userid"  INTEGER NOT NULL,
"create_date"  INTEGER,
"modify_date"  INTEGER,
PRIMARY KEY ("id" ASC),
CONSTRAINT "fk_articles_user_1" FOREIGN KEY ("userid") REFERENCES "user" ("id")
);

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO "main"."articles" VALUES (2, '第二篇文章', '<p>第二篇文章依旧是一篇测试文 &nbsp; &nbsp; &nbsp;&nbsp;</p>', 2, 1464588802347, 1464588802346);
INSERT INTO "main"."articles" VALUES (3, '你好呀', 'Hello World 与任何电子设备一样，当产品开启时请尤其小心。在极少数情况下，您可能会注意到产品中散发出
异味或者冒出烟雾或火花。或者会听到类似爆音、裂音或嘶嘶声的声音。这些情况可能仅表示某个
内部电子元件发生故障，但仍处于安全和受控的状态。也可能表示存在安全隐患。但是请勿贸然采
取措施或尝试自行诊断这些情况。请联系客户支持中心寻求进一步的指导。要获取服务与支持电话
号码列表，请访问以下Web 站', 3, 1464588802347, 1464588802347);
INSERT INTO "main"."articles" VALUES (6, '测试5', '<p>
/r
/n
/r/n
换行
 
</p>
<p>
    事实证明
</p>
<p>
    这些换行都是无效的
</p>', 1, 1464588802347, 1464588802347);
INSERT INTO "main"."articles" VALUES (8, '发挥是开发', '<p><span style="font-family:微软雅黑, Microsoft YaHei">灰化肥会发挥</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei"><br/></span></p>', 1, 1464588802347, 1464588802347);
INSERT INTO "main"."articles" VALUES (9, '新的文章', '<div><br/></div><div>我这一生最美好的场景</div><div>就是遇见你</div>', 1, 1464588802347, 1464861139360);
INSERT INTO "main"."articles" VALUES (10, 'TEST1', '<p>涛山阻隔秦帝船</p><p>汉宫彻夜捧金盘</p><p>玉肌枉然生白骨</p><p>不如剑啸易水寒</p>', 1, 1464588802347, 1464588802347);
INSERT INTO "main"."articles" VALUES (11, '红豆', '<p><span style="font-family:微软雅黑, Microsoft YaHei">红豆生南国</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">春来发几枝</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">愿君多采撷</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">此物最相思</span></p>', 1, 1464588802300, 1464588802347);
INSERT INTO "main"."articles" VALUES (12, '', '<p>所爱隔山海</p><p>山海不可平</p><p>这是一篇没有标题的文章,所以它的标题应该显示为无题<br/></p>', 1, 1464588802341, 1464588802347);
INSERT INTO "main"."articles" VALUES (13, '改一下标题试试', '<p><span style="font-family:微软雅黑, Microsoft YaHei">我这一生最美好的场景</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">就是 遇见你</span></p>', 1, 1464588802342, 1464588802347);
INSERT INTO "main"."articles" VALUES (14, 'Hello World', '<p>#include&lt;stdio.h&gt;</p><p><br/></p><p>main(){<br/>&nbsp; print(&quot;hello world&quot;);</p><p>}</p>', 1, 1464588802343, 1464588802346);
INSERT INTO "main"."articles" VALUES (15, 'The Great Man I Admire Most', '<p><span style="font-family:微软雅黑, Microsoft YaHei">The great man I admire most is Charles Robert Darwin, he was born in</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">England small village and wrote The Origin of Species in 2 centuries ago.</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">For a naturalist, he attended a global navigation from 1831 to 1836, in this</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">period time, he thought about the origin about human and animals, after the</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">navigation, he started to write the note about species. as a result , in 1859, he</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">published his great work--The Origin of Species. In this book, Darwin thought</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">about the origin about species, and proved that the evolvement consist of</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">artificial selection and natural selection. He created biological evolution theory,</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">which was considered to be one of most great discoveries in the 19 century.</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">For me, apparently, he had a really excellent insight, and he discovered</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">wonderful things by it, so it means insight is really important for scientists, it</span></p><p><span style="font-family:微软雅黑, Microsoft YaHei">was really attractive for me.</span></p><p><br/></p><p>test modify<br/></p>', 1, 1464588802344, 1464588802347);
INSERT INTO "main"."articles" VALUES (16, '关于高薪养廉的思考', '<p style="line-height:150%"><span style="font-family:微软雅黑, Microsoft YaHei"><strong><span style="font-size: 16px; line-height: 150%;">摘要: </span></strong><span style="font-size: 16px; line-height: 150%;">文章就人们为何不愿廉政，高薪是否可以养廉，官员是否可以获得高薪三个问题进行了一些浅薄的讨论，并在每个问题后给出了自己一些浅薄的观点。<strong></strong></span></span></p><p style="line-height:150%"><span style="font-family:微软雅黑, Microsoft YaHei"><strong><span style="font-size: 16px; line-height: 150%;">关键词<span>: </span></span></strong><span style="font-size: 16px; line-height: 150%;">腐败 廉政 新加坡 </span></span></p><p style="line-height:150%"><strong><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">正文<span>: </span></span></strong></p><p style="line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">一，什么原因导致人们不愿廉政</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">廉政一词最早出现在《晏子春秋·问下四》：廉政而长久，其行何也？其反义词为<span>“</span>腐败<span>”</span>。现在所说的“廉政”主要指政府工作人员在履行其职能时不以权谋私，办事公正廉洁。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">与廉政相对的是腐败，在世界范围内，腐败犯罪早已超越国界、种族、文化传统和社会制度，成为各国现代化建设和人类文明发展的一大障碍。有学者断言，如果说癌症是目前危害人类生理躯体的难治之症的话，那么腐败则是侵蚀人类社会肌体的“政治之癌”。面对腐败犯罪的严重威胁，世界各国都加大了预防和惩治的力度。我国正处在社会转型的关键时期，腐败现象的滋生和蔓延有其历史原因和现实条件。面对腐败，我们不能被吓倒，要寻求科学的反腐战略和反腐制度，这是历史赋予我们的使命。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">人们因为选择了腐败，所以就放弃了廉政，所以要想知道人们为何不愿廉政，首先就需要知道腐败产生的原因。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">人与权力、利益的结合为什么会产生腐败，使人们不愿廉政<span>?</span></span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">其一，人的天性是有缺陷的。在人区别于动物的一系列高级心理活动中有一根本特征，即占有和支配心理，这一心理既是权力存在的心理基础，也是腐败产生的根源。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">其二，权力本身蕴藏着导致腐败的因素。权力本质上具有强制性、支配性、扩张性和任意性。权力的这种本性往往与人类自身的弱点联姻，从而使双方互相强化，并诱惑人们去扩张权力、滥用权力。法国启蒙思想家孟德斯鸠曾经说过：“一切有权力的人都容易滥用权力，这是万古不易的一条经验。<span>”</span></span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">其三，高回报的利益是引发腐败的催化剂。人类的绝大多数行为无不在追求利益的最大化。“如果有<span>10</span>％的利润，它就保证到处被使用；有<span>20</span>％的利润，它就活跃起来；有<span>50</span>％的利润，它就铤而走险；有<span>100</span>％的利润，它就敢践踏世间一切法律；有<span>300</span>％的利润，它就敢犯任何罪行，甚至冒绞首的危险。”腐败犯罪意识和行为的演变过程，往往循此路径发展。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">腐败现象在古今中外数千年历史中，屡见不鲜，甚至可以说，只要欲望和利益存在，那么腐败也就同时存在，但是通过人们的主观努力，是可以争取廉洁的政治环境，从外部促使官员减少，甚至放弃腐败行为。</span></p><p style="text-indent: 32px;line-height: 115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">通过对于腐败现象的分析，我们可以得出腐败行为发生的原因，也就可以从原因着手，从源头出手遏制腐败现象。</span></p><p style="line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">&nbsp;</span></p><p style="line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">二，高薪是否可以养廉</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">在第一节，我们已经分析了腐败发生的三个主要原因，第三条原因就是官员经受不住高额的利益诱惑，那么我们是否可以通过高薪养廉，严惩腐败两种措施来诱导官员廉政呢<span>?</span></span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">作为一个例子，我们首先分析一下亚洲最清廉的国家新加坡。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">根据透明国际全球腐败指数显示，<span>2005</span>年全球最清廉的国家和地区排名中，新加坡名列第五。新加坡的政府廉洁为世界所公认。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">新加坡政府实行官员高薪制的主要目的不是用来养廉的，而是为了吸引人才。据国大政治学系反腐研究专家<span>JonS</span>．<span>T</span>．<span>Quah</span>教授研究，新加坡政府官员高薪制是<span>20</span>世纪<span>80</span>年代中后期真正开始实行的。在这以前，新加坡政府就解决了廉政问题。新加坡<span>1989</span>年较大幅度提高工资，<span>1994</span>年实行部长和高级公务员年薪与<span>6</span>个私营企业界前<span>4</span>名高级人员的平均工资挂钩的政策，部长和高级官员拿他们<span>2</span>／<span>3</span>的薪水，并根据经济状况上下浮动<strong><sup><span>[1]</span></sup></strong>。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">以廉政作为人民行动党的强烈的执政理念。可以说，世界上没有一个政府像新加坡政府，把廉政作为如此重要的执政理念。所以，人民行动党的党徽中间白色部分就是表明“廉洁与正直”。<span>1959</span>年人民行动党赢得第一届大选组织政府时，内阁成员就一律穿统一白色装宣誓就职。这套白装成了人民行动党的党服，在重大集会和节日，行动党都穿它，以表明这个党以廉政为最重要的价值。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">所以我们可以看出新加坡虽然看起来是高薪养廉，但是高薪制度其实是在新加坡解决廉政问题之后才实行的，所以新加坡并不是真正意义上的以高薪来养廉，而是通过党派内部的一种行动纲领，来促使官员廉政。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">除了新加坡，挪威和瑞典政府的廉政程度，也都排在全球前十，那它们的公务员薪水是什么状况呢？我们做了一个计算，挪威公务员的薪水是社会平均工资的<span>1.02 </span>倍，瑞典公务员的平均工资是社会平均工资的<span>0.99 </span>倍。也就是说，这两个国家的公务员并没有享受高薪，但却廉洁。这说明，“高薪”和廉政并没有什么必然关系。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">中国古代曾经<span>(</span>多次<span>)</span>实行过“高薪养廉”，但都没有成功。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">宋朝的王安石推行过“高薪养廉”，结果失败了———王安石发现，人的贪欲是无止境的，无论你给官员多少钱，他们都不会满足。还有清朝，从雍正皇帝开始就有了“养廉银”<strong><sup><span>[2]</span></sup></strong>，就拿晚清名将、台湾巡抚刘铭传来讲吧，他的年俸是<span>155</span>两白银，他的“养廉银”是<span>1 </span>万两白银，相当于本薪的<span>65</span>倍。而且刘铭传不是个例，因为清朝官员的“养廉银”普遍是本薪的<span>10</span>～<span>100</span>倍。结果呢，清朝末年的腐败令人咋舌。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">由近年来，特别是习近平主席上台以来的反腐行动看来，数个<span>”</span>大老虎<span>”</span>，当然我们不可否认，打击这些大老虎有着一定的政治原因，但是他们身居高位，衣食无忧，但是犹是贪心不足，依旧深陷腐败的淤泥之中，不可自拔，才有会留下把柄。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 115%;">我国官员的素质是参差不齐的，甘当人民公仆的固然很多，可是尸位素餐、鱼肉人民的干部也不少。</span> <span style="font-size: 16px; line-height: 115%;">18 </span><span style="font-size: 16px; line-height: 115%;">世纪的英国哲学家休谟提出：每个人的本性都是恶的，所以任何政府在制定制约和监控机制的时候，都必须把每一个政府成员想成是无赖。这些官员就是为了谋求私利来到政府的，他们天生野心非常大，给多少权力和金钱都没法满足<strong><sup><span>[3]</span></sup></strong>。让群众用高薪来供奉这样的“国家干部”，群众可以接受么<span>?</span>此外，国家机关工作人员也没有理由独享高薪。 </span></span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">从世界诸国的经验看来，高薪和养廉并无直接的联系。从国情来看，高薪养廉在中国是不可行的，至少是当前处于社会主义初期的中国无法承受的，人民也是无法理解的。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">综上所述，当前情况下，高薪养廉不可行的。从各国经验来看，只有加强政治思想教育，提高官员的素质，建立强有力的监督约束机制和健全的法律制度，形成“不敢贪、不能贪”的社会环境，才能从根本上减少和消除腐败。</span></p><p style="line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">&nbsp;</span></p><p style="line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">三，高薪不可以养廉，那么官员是否可以高薪呢。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">在第二节我们已经提到，新加坡的廉政和高薪是无关的，他们的高薪，主要是用来吸引高级的管理人才来任职官员，那么官员是否可以获得高薪呢<span>?</span></span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">就新加坡来讲，李光耀在新加坡推行精英政治。他希望把各界精英都吸收到政府担任高级领导人。他纳贤的对象主要是医生、律师、会计、大学教授、企业家、银行家等有能力、并且诚实和品德优秀的杰出人物。如果发现合适的人选，行动党会劝他们弃职从政。这意味着他们可能放弃<span>200</span>万、<span>300</span>万，甚至<span>500</span>万的年薪。在这种情况下，即使来当一个部长少于<span>100</span>万，也是不太容易劝人家来从政的。可见，新加坡的政治生态与中国完全不同，新加坡人不太愿意从政，要从社会招揽人才。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">而中国社会是官本位，直到今天很多大学生仍以考公务员为第一志愿。一个公务员职位招考少则几十人，多则几百人、上千人报名。在这种情况下，如果实行公务员高薪，这个社会的价值观念更会偏斜。为了当官而争斗，官场腐败会更加严重。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">新加坡政府的廉洁在于它经过几十年的国民教育，公民具有良好的素质，已经建立起廉政的良好的舆论氛围和社会文化。中国现在需要加强对于年轻人的教育，潜移默化的影响他们，一步一步渐渐让他们放弃官本位思想，除此之外，还要加强反腐制度的建设，通过完备的监督机制，从内外两方面约束引导下一代政治家的廉政思想。</span></p><p style="text-indent:32px;line-height:115%"><span style="font-size: 16px; line-height: 115%;font-family:微软雅黑, Microsoft YaHei">在政府廉政推行到足够的地步时，我们是可以向新加坡那样，对于官员实行一定的高薪制度，毕竟这些官员为人民服务，创造了巨大的价值，不能在权利或者地位上给予他们奖励，但是通过金钱让他们过得更加舒适一些，我认为是可行的。</span></p><p style="text-indent:32px;line-height:150%"><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">&nbsp;</span></p><p style="line-height:150%"><strong><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">注释<span>: </span></span></strong></p><p style="line-height:115%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 115%;">[1]</span> <span style="font-size: 16px; line-height: 115%;">以<span>2000</span>年为例，总理年薪为<span>194</span>万新元，部长为<span>142</span>万新元，政务部长或其他顶级公务员在<span>110</span>万新元左右，常任秘书约<span>60</span>万～<span>70</span>万新元，中级官员约<span>10</span>多万新元。</span></span></p><p style="line-height:115%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 115%;">[2] </span><span style="font-size: 16px; line-height: 115%;">雍正的高薪养廉制度是有一定成效的<span>,</span>但是雍正的继任者乾隆在位期间<span>,</span>出现了一位<span>“</span>贪污之王<span>”</span>和珅，和珅的家产相当于清政府五年的收入，高层都有人敢如此肆无忌惮的贪污，更别说那些低层的官吏了。</span></span></p><p style="line-height:115%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 115%;">[3]</span> <span style="font-size: 16px; line-height: 115%;">当然，休谟的意思不是说每一个当官的人都是无赖，他只是建议说要按照“最差情况”来设计机制。也就是说，假设每一个官员都会在各自的职位上有贪腐行为。那基于这个假设，我们就必须在一开始设计制度的时候，就要想办法堵上可能出现的漏洞。</span></span></p><p style="line-height:150%"><strong><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">参考文献<span>: </span></span></strong></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">1)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">杨蕾等 反腐倡廉建设研究之网络反腐问题研究 河南社会科学<span>2011</span>年<span>3</span>月第<span>19</span>卷 第二期</span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">2)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">郎咸平 “高薪”和廉政没有必然关系 <span>IT</span>时代周刊<span> 2014(20)</span></span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">3)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">郭东阳 单纯高薪“养”不出廉政 检察风云<span> 2014(7)</span></span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">4)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">王明高 构建中国特色的科学反腐制度 湘潭大学学报（哲学社会科学版）<span> 2015(1)</span></span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">5)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">蔡定剑 新加坡<span>,&quot;</span>廉政<span>&quot;</span>并非高薪养 中国社会导刊<span> 2006(12)</span></span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">6)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">百度百科 廉政<span> 2016</span>年</span></span></p><p style="margin-left: 28px;line-height: 150%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 150%;">7)<span style="font-stretch: normal; font-size: 9px; line-height: normal;">&nbsp;&nbsp; </span></span><span style="font-size: 16px; line-height: 150%;">百度百科 反腐倡廉<span> 2016</span>年</span></span></p><p style="line-height:150%"><strong><span style="font-size: 16px; line-height: 150%;font-family:微软雅黑, Microsoft YaHei">作者介绍<span>: </span></span></strong></p><p style="text-indent: 32px;line-height: 115%"><span style="font-family:微软雅黑, Microsoft YaHei"><span style="font-size: 16px; line-height: 115%;">孙韬，男，</span><span style="font-size:16px;line-height:115%">95</span><span style="font-size: 16px; line-height: 115%;">年</span><span style="font-size:16px;line-height:115%">11</span><span style="font-size: 16px; line-height: 115%;">月，四川成都，电子科大信软学院大二学生，手机</span><span style="font-size:16px;line-height:115%">15680437825</span><span style="font-size: 16px; line-height: 115%;">，邮箱</span><span style="font-size:16px;line-height:115%">mrls@live.cn</span></span></p><p><br/></p>', 1, 1464588802345, 1464588802347);
INSERT INTO "main"."articles" VALUES (18, '你好 孙韬', '<p>滴滴答</p><p>福建大厦南方</p><p>发多少就爱你</p><p>发动机上来看</p><p>发的啥好看</p><p>你好</p><p>哈哈</p><p><img src="/images/parallax1.jpg" _src="/images/parallax1.jpg" height="467" width="701"/></p><p>修改一下<br/></p><p><br/></p>', 1, 1464588802346, 1464595230195);
INSERT INTO "main"."articles" VALUES (19, '测试一下发送新文章', '<p>因为时间戳的问题</p><p><br/></p><p>所以需要测试一下修改之后时间是否显示正常<br/></p><p><br/></p><p>修改看看时间是否正常<br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', 3, 1464588802347, 1464588802347);
INSERT INTO "main"."articles" VALUES (20, '如果说', '<p>减肥的拉萨减肥了肯定撒</p><p>放到了空间撒范德萨</p><p>附近的萨克雷锋</p><p><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', 3, 1464589163201, 1464589163201);
INSERT INTO "main"."articles" VALUES (21, '新的文章', '<p>分页测试<br/></p>', 1, 1464592721971, 1464592744823);
INSERT INTO "main"."articles" VALUES (22, '致郭襄', '<p>我走过山时，山不说话，<br/>我路过海时，海不说话，<br/>小毛驴滴滴答答，倚天剑伴我走天涯。<br/>大家都说我因为爱着杨过大侠，才在峨眉山上出了家，<br/>其实我只是爱上了峨眉山上的云和霞，<br/>像极了十六岁那年的烟花。</p>', 1, 1464597072286, 1464925426595);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "main"."comment";
CREATE TABLE "comment" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT NULL,
"articleid"  INTEGER NOT NULL,
"userid"  INTEGER NOT NULL,
"comment"  TEXT(120) NOT NULL,
"createdate"  INTEGER,
CONSTRAINT "c_a_fk" FOREIGN KEY ("articleid") REFERENCES "articles" ("id"),
CONSTRAINT "fk_comment_user_1" FOREIGN KEY ("userid") REFERENCES "user" ("id")
);

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO "main"."comment" VALUES (21, 18, 1, '新的评论', 1464580170802);
INSERT INTO "main"."comment" VALUES (22, 18, 3, '修改不了', 1464588821991);
INSERT INTO "main"."comment" VALUES (24, 22, 1, '所谓的人生啊', 1464796437006);
INSERT INTO "main"."comment" VALUES (27, 23, 17, '哈哈', 1465207650638);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS "main"."setting";
CREATE TABLE "setting" (
"id" INTEGER NOT NULL,
"key" TEXT,
"value" TEXT,
PRIMARY KEY ("id") ,
CONSTRAINT "key_unq" UNIQUE ("key" ASC)
);

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO "main"."setting" VALUES (1, 'site', '{"sitename":"见善-1","footertitle":"少年游-1","footercontent":"林花谢了春红 太匆匆 -1 ","footercorp":"© 2016 Suntao Copyright -1","headclr":"blue","footclr":"blue"}');

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "main"."sqlite_sequence" VALUES ('comment', 27);
INSERT INTO "main"."sqlite_sequence" VALUES ('api', 24);
INSERT INTO "main"."sqlite_sequence" VALUES ('usertype', 4);
INSERT INTO "main"."sqlite_sequence" VALUES ('usertypeview', 39);
INSERT INTO "main"."sqlite_sequence" VALUES ('view', 19);
INSERT INTO "main"."sqlite_sequence" VALUES ('usertypeapi', 60);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "main"."user";
CREATE TABLE "user" (
"id"  INTEGER NOT NULL,
"username"  TEXT(32) NOT NULL,
"passwd"  TEXT(32) NOT NULL,
"usertype"  INTEGER NOT NULL DEFAULT 4,
"nickname"  TEXT,
"comment"  TEXT(100),
"lastlogindate"  INTEGER,
"lastloginip"  TEXT,
PRIMARY KEY ("id" ASC),
CONSTRAINT "usertyep_fk" FOREIGN KEY ("usertype") REFERENCES "usertype" ("id"),
CONSTRAINT "username_unq" UNIQUE ("username" ASC)
);

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "main"."user" VALUES (1, 'suntao', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, '孙韬', '用户管理员', 1465358068827, '::1');
INSERT INTO "main"."user" VALUES (2, 'wangweiguo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '王伟国', '备注测试', null, null);
INSERT INTO "main"."user" VALUES (3, 'zhaoqiang', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '赵强', '测试备注', 1465354454283, '::1');
INSERT INTO "main"."user" VALUES (7, 'wahaha', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '哇哈', null, null, null);
INSERT INTO "main"."user" VALUES (8, 'hahafdasjklajsf', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, 'fdjsaklf', null, null, null);
INSERT INTO "main"."user" VALUES (9, '测试', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '大厦环境', '哈哈哈', null, null);
INSERT INTO "main"."user" VALUES (10, 'testRegister', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '测试注册', '测试注册', null, null);
INSERT INTO "main"."user" VALUES (11, 'pagetestuser', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '分页用户测试', '哈哈', null, null);
INSERT INTO "main"."user" VALUES (12, 'pagetestuser2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '分页测试用户2', 'admin', null, null);
INSERT INTO "main"."user" VALUES (14, 'fhkjdsafa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, 'fdkjsal', '测试用', null, null);
INSERT INTO "main"."user" VALUES (15, 'passtest', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '密码加密测试', '加密测试用', 1464696979856, '::ffff:127.0.0.1');
INSERT INTO "main"."user" VALUES (16, 'unlogined', '25395a0c90f0712b2b48e8822464b1299830cb42ecb710ab36c70b8bf474078c', 1, '未登录用户', '测试用', null, null);
INSERT INTO "main"."user" VALUES (17, 'regtest1', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2, '注册测试1', 'reggest', 1465208021874, '::1');
INSERT INTO "main"."user" VALUES (18, 'fhdsakfdshfd', 'aac9f07b4351da60bf9a277f8c3851f43c62e6af33107af56aa97ee1af94581a', 1, 'fdhsakjfds', '', null, null);
INSERT INTO "main"."user" VALUES (19, 'fhdhdaks', '7a9a3d86581a848b674987e76c5573b480b2508a3f5dadec891200c80346bb4c', 2, 'f', 'fdsafhdsa', null, null);

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS "main"."usertype";
CREATE TABLE "usertype" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertype"  TEXT(20) NOT NULL,
"descripe"  TEXT
);

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO "main"."usertype" VALUES (0, '未登录', '尚未登录');
INSERT INTO "main"."usertype" VALUES (1, '管理员', '管理员账户');
INSERT INTO "main"."usertype" VALUES (2, '普通用户', '普通的博客用户');

-- ----------------------------
-- Table structure for usertypeapi
-- ----------------------------
DROP TABLE IF EXISTS "main"."usertypeapi";
CREATE TABLE "usertypeapi" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertypeid"  INTEGER NOT NULL,
"apiid"  INTEGER NOT NULL,
CONSTRAINT "fk_usertypyauth_usertype_1" FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id"),
CONSTRAINT "fk_usertypyauth_auth_1" FOREIGN KEY ("apiid") REFERENCES "api" ("id")
);

-- ----------------------------
-- Records of usertypeapi
-- ----------------------------
INSERT INTO "main"."usertypeapi" VALUES (2, 1, 2);
INSERT INTO "main"."usertypeapi" VALUES (3, 1, 3);
INSERT INTO "main"."usertypeapi" VALUES (4, 1, 4);
INSERT INTO "main"."usertypeapi" VALUES (5, 1, 5);
INSERT INTO "main"."usertypeapi" VALUES (6, 1, 6);
INSERT INTO "main"."usertypeapi" VALUES (7, 1, 7);
INSERT INTO "main"."usertypeapi" VALUES (8, 1, 8);
INSERT INTO "main"."usertypeapi" VALUES (9, 1, 9);
INSERT INTO "main"."usertypeapi" VALUES (10, 1, 10);
INSERT INTO "main"."usertypeapi" VALUES (11, 1, 11);
INSERT INTO "main"."usertypeapi" VALUES (12, 1, 12);
INSERT INTO "main"."usertypeapi" VALUES (13, 1, 13);
INSERT INTO "main"."usertypeapi" VALUES (14, 1, 14);
INSERT INTO "main"."usertypeapi" VALUES (15, 1, 15);
INSERT INTO "main"."usertypeapi" VALUES (16, 0, 14);
INSERT INTO "main"."usertypeapi" VALUES (17, 1, 16);
INSERT INTO "main"."usertypeapi" VALUES (18, 2, 4);
INSERT INTO "main"."usertypeapi" VALUES (19, 2, 5);
INSERT INTO "main"."usertypeapi" VALUES (20, 2, 6);
INSERT INTO "main"."usertypeapi" VALUES (21, 1, 17);
INSERT INTO "main"."usertypeapi" VALUES (22, 1, 18);
INSERT INTO "main"."usertypeapi" VALUES (23, 1, 19);
INSERT INTO "main"."usertypeapi" VALUES (24, 1, 20);
INSERT INTO "main"."usertypeapi" VALUES (38, 1, 21);
INSERT INTO "main"."usertypeapi" VALUES (39, 1, 22);
INSERT INTO "main"."usertypeapi" VALUES (42, 2, 7);
INSERT INTO "main"."usertypeapi" VALUES (47, 2, 2);
INSERT INTO "main"."usertypeapi" VALUES (49, 1, 23);
INSERT INTO "main"."usertypeapi" VALUES (50, 1, 24);
INSERT INTO "main"."usertypeapi" VALUES (56, 2, 16);
INSERT INTO "main"."usertypeapi" VALUES (57, 0, 15);
INSERT INTO "main"."usertypeapi" VALUES (58, 2, 9);
INSERT INTO "main"."usertypeapi" VALUES (59, 2, 8);

-- ----------------------------
-- Table structure for usertypeview
-- ----------------------------
DROP TABLE IF EXISTS "main"."usertypeview";
CREATE TABLE "usertypeview" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertypeid"  INTEGER NOT NULL,
"viewid"  INTEGER NOT NULL,
CONSTRAINT "usertype_fk" FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "view_fk" FOREIGN KEY ("viewid") REFERENCES "view" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Records of usertypeview
-- ----------------------------
INSERT INTO "main"."usertypeview" VALUES (1, 1, 1);
INSERT INTO "main"."usertypeview" VALUES (2, 1, 2);
INSERT INTO "main"."usertypeview" VALUES (3, 1, 3);
INSERT INTO "main"."usertypeview" VALUES (4, 1, 4);
INSERT INTO "main"."usertypeview" VALUES (5, 1, 5);
INSERT INTO "main"."usertypeview" VALUES (6, 1, 6);
INSERT INTO "main"."usertypeview" VALUES (7, 1, 7);
INSERT INTO "main"."usertypeview" VALUES (8, 1, 8);
INSERT INTO "main"."usertypeview" VALUES (9, 1, 9);
INSERT INTO "main"."usertypeview" VALUES (10, 1, 10);
INSERT INTO "main"."usertypeview" VALUES (11, 1, 11);
INSERT INTO "main"."usertypeview" VALUES (12, 1, 12);
INSERT INTO "main"."usertypeview" VALUES (13, 1, 13);
INSERT INTO "main"."usertypeview" VALUES (14, 0, 13);
INSERT INTO "main"."usertypeview" VALUES (15, 1, 14);
INSERT INTO "main"."usertypeview" VALUES (16, 0, 14);
INSERT INTO "main"."usertypeview" VALUES (17, 0, 5);
INSERT INTO "main"."usertypeview" VALUES (18, 0, 6);
INSERT INTO "main"."usertypeview" VALUES (19, 2, 14);
INSERT INTO "main"."usertypeview" VALUES (20, 2, 13);
INSERT INTO "main"."usertypeview" VALUES (21, 1, 15);
INSERT INTO "main"."usertypeview" VALUES (22, 1, 16);
INSERT INTO "main"."usertypeview" VALUES (23, 1, 17);
INSERT INTO "main"."usertypeview" VALUES (24, 1, 18);
INSERT INTO "main"."usertypeview" VALUES (25, 1, 19);
INSERT INTO "main"."usertypeview" VALUES (30, 3, 7);
INSERT INTO "main"."usertypeview" VALUES (31, 0, 7);
INSERT INTO "main"."usertypeview" VALUES (32, 2, 1);
INSERT INTO "main"."usertypeview" VALUES (33, 2, 2);
INSERT INTO "main"."usertypeview" VALUES (35, 2, 11);
INSERT INTO "main"."usertypeview" VALUES (36, 2, 10);
INSERT INTO "main"."usertypeview" VALUES (37, 2, 6);
INSERT INTO "main"."usertypeview" VALUES (38, 2, 5);

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS "main"."view";
CREATE TABLE "view" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"viewname"  TEXT NOT NULL,
"url"  TEXT NOT NULL,
"descripe"  TEXT
);

-- ----------------------------
-- Records of view
-- ----------------------------
INSERT INTO "main"."view" VALUES (1, 'newblog', '/articles/newblog', '添加博客 页面');
INSERT INTO "main"."view" VALUES (2, 'editblog', '/articles/editblog', '修改博客页面');
INSERT INTO "main"."view" VALUES (3, 'blogmanager', '/articles/blogmanager', '博客管理器');
INSERT INTO "main"."view" VALUES (4, 'commentmanager', '/articles/comment/commentmanager', null);
INSERT INTO "main"."view" VALUES (5, 'allblogs', '/articles/allblogs', '博客列表');
INSERT INTO "main"."view" VALUES (6, 'blog', '/articles/blog', '单独博客');
INSERT INTO "main"."view" VALUES (7, 'register', '/register', '注册页面');
INSERT INTO "main"."view" VALUES (8, 'usermanager', '/admin/users/usermanager', null);
INSERT INTO "main"."view" VALUES (9, 'adduser', '/admin/users/add', null);
INSERT INTO "main"."view" VALUES (10, 'updateuser', '/admin/users/update', null);
INSERT INTO "main"."view" VALUES (11, 'overview', '/admin/overview', null);
INSERT INTO "main"."view" VALUES (12, 'costume', '/admin/costume', null);
INSERT INTO "main"."view" VALUES (13, 'index', '/index', null);
INSERT INTO "main"."view" VALUES (14, 'login', '/login', null);
INSERT INTO "main"."view" VALUES (15, 'usertypemanager', '/admin/auth/usertype/manager', '用户类型管理');
INSERT INTO "main"."view" VALUES (16, 'usertypeapimanager', '/admin/auth/usertypeapi/manager', '用户权限管理');
INSERT INTO "main"."view" VALUES (17, 'usertypeviewmanager', '/admin/auth/usertypeview/manager', null);
INSERT INTO "main"."view" VALUES (18, 'usertypeadd', '/admin/auth/usertype/add', null);
INSERT INTO "main"."view" VALUES (19, 'userytpeupdate', '/admin/auth/usertype/update', null);

-- ----------------------------
-- Indexes structure for table setting
-- ----------------------------
CREATE UNIQUE INDEX "main"."key"
ON "setting" ("key" ASC);

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE UNIQUE INDEX "main"."password"
ON "user" ("username" ASC, "passwd" ASC);
