# oauth2
这是一个oauth2的示例工程，还原了oauth2标准的完整实现流程，应用它可以加深我们对oauth2的理解。

# 由来
为了了解oauth2的流程，在git上找了一些工程，但很少能够**开包即用**，此工程脱胎于[123]1313,做了一些优化和修改，以使用户能够不用关注怎么配置和debug，拿来即可以研究oauth2。

# 应用
* clone到本地
* 把oauthdb.sql倒入数据库
* 设置每个工程sring-servlet.xml中的数据库配置
* 分别启动resourceServer，authServer，client工程
* 访问localhsot:8080/client

