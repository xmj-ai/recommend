<map>
		<node ID="root" TEXT="10常见架构">		<node TEXT=" 一、整体框架" ID="2b116b967ea14a186" STYLE="bubble" POSITION="right">
		<node TEXT="按照时间排序->信息流逐渐成为主流，按照兴趣排序[兴趣feed]" ID="27b16b968511940f7" STYLE="fork">
		</node>
		<node TEXT="信息流实现" ID="32616b968610a30f5" STYLE="fork">
		<node TEXT="1. 如何实现⼀个按照时间顺序排序的信息流系统？" ID="23716b96862b7b105" STYLE="fork">
		</node>
		<node TEXT="2. 如何给信息流内容按照兴趣重排序？" ID="1016b96865492003" STYLE="fork">
		<node TEXT="1. 日志收集，是所有排序训练的数据来源，要收集的最核数据就是用户在信息流上产生的行为，用于机器学习更新排序模型；" ID="29316b9687d3d8187" STYLE="fork">
		</node>
		<node TEXT="2. 内容发布，就是用推或者拉的模式把信息流的内容从源头发布到受众端；" ID="1e716b968834b314d1" STYLE="fork">
		</node>
		<node TEXT="3. 机器学习，从收集的用户行为日志中训练模型，然后为每一个用户即将收到的信息流内容提供打分服务；" ID="29c16b9689f40a17b" STYLE="fork">
		</node>
		<node TEXT="4. 信息流服务，为信息流的展示前端提供Rest API；" ID="20416b968abf490b" STYLE="fork">
		</node>
		<node TEXT="5. 监控，这是系统的运维标配，保证系统的安全和稳定等。" ID="2b216b968adde9132" STYLE="fork">
		</node>
		</node>
		</node>
		</node>
		<node TEXT="二、数据模型" ID="38d16b9680c48d025" STYLE="bubble" POSITION="right">
		<node TEXT="1.内容即Activity" ID="1f116b9680ee73094" STYLE="fork">
		<node TEXT="Time" ID="3ca16b969654320a3" STYLE="fork">
		</node>
		<node TEXT="Actor" ID="2f516b969658f20c1" STYLE="fork">
		</node>
		<node TEXT="Verb" ID="1bf16b96965ca306f" STYLE="fork">
		</node>
		<node TEXT="Object" ID="38116b9696601a0f5" STYLE="fork">
		</node>
		<node TEXT="Target" ID="fa16b9696644209a" STYLE="fork">
		</node>
		<node TEXT="Title" ID="24916b969668c4004" STYLE="fork">
		</node>
		<node TEXT="Summary" ID="33516b9695d6b1123" STYLE="fork">
		</node>
		</node>
		<node TEXT="2.关系即连接" ID="7116b968134da17a" STYLE="fork">
		<node TEXT="1. From：连接的发起方" ID="11b16b96a070f2039" STYLE="fork">
		</node>
		<node TEXT="2. To：被连接方" ID="f16b96a0b6c412d" STYLE="fork">
		</node>
		<node TEXT="3. Type/Name：就是Atom模型中的Verb，即连接的类型：关注、加好友、点赞、浏览、评论，等等。" ID="23116b96a102830f1" STYLE="fork">
		</node>
		<node TEXT="4. Affinity：连接的强弱。" ID="7116b96a12691146" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="三、动态发布" ID="28216b968343c603a" STYLE="bubble" POSITION="right">
		<node TEXT="1. 获取用户所有连接的终点（如好友、关注对象、兴趣标签）；" ID="2f16b96a1bdfc15b" STYLE="fork">
		</node>
		<node TEXT="2. 获取这些连接终点（关注对象）产生的新内容（Activity）" ID="25a16b96a206fa169" STYLE="fork">
		</node>
		<node TEXT="3. 按照某个指标排序后输出。" ID="316b96a21a5a003" STYLE="fork">
		</node>
		<node TEXT="模式" ID="7216b96abfd7312a" STYLE="fork">
		<node TEXT="“拉”模式（Fan-out-on-load）" ID="3de16b96ac147c056" STYLE="fork">
		<node TEXT="优点" ID="2ed16b96acb417183" STYLE="fork">
		<node TEXT="1. 实现简单直接：一句SQL语句就搞定了。" ID="36d16b96ace28c0fb" STYLE="fork">
		</node>
		<node TEXT="2. 实时：内容产⽣了，受众只要刷新就看得到。" ID="1b216b96ad21ca0e6" STYLE="fork">
		</node>
		</node>
		<node TEXT="不足" ID="27f16b96accded10a" STYLE="fork">
		<node TEXT="1. 随着连接数的增加，这个操作的复杂度指数级增加；" ID="23416b96ad535205e" STYLE="fork">
		</node>
		<node TEXT="2. 内存中要保留每个人产生的内容；" ID="1e16b96ad7131113" STYLE="fork">
		</node>
		<node TEXT="3. 服务很难做到高可用。" ID="3516b96adb3a511b" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="“推”模式（Fan-out-on-write）" ID="1eb16b96ae1e82002" STYLE="fork">
		<node TEXT="有点：在用户访问自己的信息流时，几乎没有任何复杂的查询操作，所以服务可用性较高。" ID="1316b96b0aacc05c" STYLE="fork">
		</node>
		<node TEXT="不足" ID="3d816b96ae2d62157" STYLE="fork">
		<node TEXT="1. 大量的写操作：每1个粉丝都要写1次。" ID="2e216b96aea0cd0ce" STYLE="fork">
		</node>
		<node TEXT="2. 大量的冗余存储：每1条内容都要存储N份（受众数量）。" ID="15216b96af13e1164" STYLE="fork">
		</node>
		<node TEXT="3. 非实时：1条内容产生后，有一定的延迟才会到达受众信息流中。" ID="17116b96af58e911d" STYLE="fork">
		</node>
		<node TEXT="4. 无法解决新用户的信息流产生问题。" ID="10e16b96afe0a206c" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="解决方案" ID="13f16b96b19cb4067" STYLE="fork">
		<node TEXT="1. 对于活跃度高的用户，使用推模式，每次他们刷新时不能等待太久，而且内容页相对多一些；" ID="22616b96b1c7a7076" STYLE="fork">
		</node>
		<node TEXT="2. 对于活跃度没有那么高的用户，使用拉模式，当他们登录时才拉取最新的内容；" ID="28816b96b29234137" STYLE="fork">
		</node>
		<node TEXT="3. 对于热门的内容生产者，缓存其最新的N条内容，用于不同场景下的拉取。" ID="20b16b96b35a31154" STYLE="fork">
		</node>
		</node>
		<node TEXT="分用户方案" ID="bb16b96b43729108" STYLE="fork">
		<node TEXT="1. 如果受众用户与内容产生用户之间的亲密度高，则优先推送，因为更可能被这个受众所感兴趣；" ID="27416b96b4636006" STYLE="fork">
		</node>
		<node TEXT="2. 如果受众用户与内容产生用户之间的亲密度低，则推迟推送或者不推送；" ID="22216b96b96c5012f" STYLE="fork">
		</node>
		<node TEXT="3. 也不是完全遵循亲密度顺序，而是采用与之相关的概率。" ID="29d16b96b9c1fc189" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="信息流的产生和存储工具" ID="18f16b96bae064188" STYLE="fork">
		<node TEXT="Redis等KV数据库, 使用uid作为key。" ID="38a16b96bb45eb0df" STYLE="fork">
		</node>
		<node TEXT="信息流推送的任务队列可以采用Celery等成熟框架" ID="4916b96bbb4e806e" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="四、信息流排序" ID="7816b96837910093" STYLE="bubble" POSITION="right">
		<node TEXT="1. 没有目标" ID="2dc16b969410ab0c5" STYLE="fork">
		</node>
		<node TEXT="2. 人工量化" ID="2fb16b96951de313b" STYLE="fork">
		<node TEXT="信息流的特征有三类" ID="27516b96befddb0fb" STYLE="fork">
		</node>
		<node TEXT="1. 用户特征，包括用户人口统计学属性、用户兴趣标签、活跃程度等；" ID="22116b96bf083b189" STYLE="fork">
		</node>
		<node TEXT="2. 内容特征，1条内容本身可以根据其属性提取文本、图像、音频等特征，并且可以利用主题模型提取更抽象的特征。" ID="12e16b96bf360a0f1" STYLE="fork">
		</node>
		<node TEXT="3. 其他特征，比如刷新时间、所处页面等。" ID="2b016b96bf4ce615b" STYLE="fork">
		</node>
		</node>
		<node TEXT="排序模型在实际使用时，通常做成RPC服务，以供发布信息流时调用。" ID="bc16b96c0a93c0cd" STYLE="fork">
		</node>
		</node>
		<node TEXT="五、数据管道" ID="1ef16b96838d0c02c" STYLE="bubble" POSITION="left">
		<node TEXT="相关数据" ID="24416b96c2a43c015" STYLE="fork">
		<node TEXT="1. 互动行为数据，用于记录每1个用户在信息流上的反馈行为；" ID="e616b96c2e60108f" STYLE="fork">
		</node>
		<node TEXT="2. 曝光内容，每1条曝光要有唯1的ID，曝光的内容仅记录ID即可；" ID="da16b96c2ebc101a1" STYLE="fork">
		</node>
		<node TEXT="3. 互动行为与曝光的映射关系，每条互动数据要对应到1条曝光数据；" ID="3dd16b96c2ebc11572" STYLE="fork">
		</node>
		<node TEXT="4. 用户画像内容，即用户画像，提供用户特征，具体请用我在第4、5、6三篇中的内容；" ID="36f16b96c2ebc103e3" STYLE="fork">
		</node>
		<node TEXT="5. 信息流的内容分析数据，提供内容特征，即物品画像。" ID="1b816b96c2ebc10414" STYLE="fork">
		</node>
		</node>
		<node TEXT="流程分块" ID="e016b96c43f6b098" STYLE="fork">
		<node TEXT="1. 生成训练样本，可离线；" ID="2e216b96c45a20107" STYLE="fork">
		<node TEXT="关注AUC" ID="1cc16b96c523e9181" STYLE="fork">
		</node>
		<node TEXT="线上AB测试" ID="2b716b96c4e8b2036" STYLE="fork">
		</node>
		<node TEXT="辅助指标" ID="3f16b96c4f0781921" STYLE="fork">
		</node>
		<node TEXT="对负样本采样" ID="39316b96c63fd810a" STYLE="fork">
		</node>
		<node TEXT="采样比例也是1个可以优化的参数" ID="f616b96c6868d0eb" STYLE="fork">
		</node>
		</node>
		<node TEXT="2. 排序模型训练，可离线；" ID="1a716b96c46cad0e31" STYLE="fork">
		</node>
		<node TEXT="3. 模型服务化，实时服务；" ID="22716b96c46cad0142" STYLE="fork">
		</node>
		</node>
		</node>
		<node TEXT="六、总结" ID="c016b9683ab5c11c" STYLE="bubble" POSITION="left">
		</node>
		<node TEXT="七、精选留言" ID="1e816b9683d05d0c9" STYLE="bubble" POSITION="left">
		</node>
</node>
</map>