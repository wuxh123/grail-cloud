# grail-cloud
spring cloud快速开发框架

## 框架工程
1 	grail-register-center 	注册中心 	Spring Cloud Eureka实现

2 	grail-config-center 	配置中心 	Spring Cloud Config实现，配置文件支持本地或者git

3 	grail-user-center 	    用户中心 	用户、角色、权限、绑定手机号、微信网页公众号授权

4 	grail-oauth-center 	    认证中心 	Spring Cloud Oauth2实现，授权后提供access_token、支持用户名+密码、手机号+密码、手机号+短信验证码、微信公众号登陆

5 	grail-gateway-zuul 	    网关 	    Spring Cloud Zuul实现，路由分发请求到各个微服务

6 	grail-manage-backend 	管理后台 	菜单、ip黑名单维护，邮件发送、后台管理前端（前端支持分离部署）

7 	grail-log-center 	    日志中心 	各微服务aop拦截并发送日志，基于rabbitmq处理日志,存储到mysql或者elasticsearch

8 	grail-file-center 	    文件中心 	文件上传，实现了本地存储、阿里云，可自行扩展第三方存储

9 	grail-monitor-center 	监控中心 	Spring Boot Admin实现

10 	grail-notification-center 	通知中心 	阿里云短信、发送验证码     

## 运行如图
 ![img](https://github.com/wuxh123/grail-cloud/tree/master/img/projects.png)
## 传送门
layui版前端: https://github.com/wuxh123/grail-layui

vue版前端:https://github.com/wuxh123/grail-vue

代码生成器:https://github.com/wuxh123/grail-generater
