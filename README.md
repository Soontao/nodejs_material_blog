# NBlog

[![Build Status](https://travis-ci.org/Soontao/nodejs_material_blog.svg?branch=master)](https://travis-ci.org/Soontao/nodejs_material_blog)

这是一个NodeJS博客项目, 基于

Express框架

EJS模板引擎

ORM2持久化

等等.

使用的数据库为SQLite3, 但是由于ORM对于SQL的封装, 理论上切换到MySQL也没有什么问题.

## 部署

[Linux]

```bash
sudo npm install
sudo npm start
```

[windows]

```
npm install
npm start
```

---

视情况可以使用pm2托管

```
sudo npm install pm2 -g
pm2 start bin/www -n nblog 
```

## 目的

这个项目的作用就是为了学习NodeJS

## 成果

十分深刻的理解了 "异步" 的含义, 通过各种犯错, 笑.


代码不是最佳实践,只能算是勉强可用而已.


写权限管理模块的时候,深刻的理解了这件事的复杂性,API还是用RestFul比较好进行权限管理.


下一步会做这方面的工作.

## 其它

在完成半年以后，使用travis ci做持续集成，然后部署到cf上

## 作者

孙韬 UESTC 2014级学生


mrls@live.cn


## License

Apache 2