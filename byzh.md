# 简单用测试接口



**查询所有用户**

`180.76.100.8:8080/byzh/user/list` 

| 参数 |
| :---|
| 无   |

查询成功返回json数据

```json
[{"id":30214141,"nickname":"yr","gender":"M","qq":"1840543823","wechat":"12345","pwd":"12345","major":"智造","campus":"x","heading":"yr.jpg"},{"id":3021001824,"nickname":"yr","gender":"M","qq":"1840543823","wechat":"12345","pwd":"12345","major":"智造","campus":"x","heading":"yr.jpg"}]
```

**添加用户**

180.76.100.8:8080/byzh/user/add

| 参数     | 是否必须 | 说明   |
| -------- | -------- | ------ |
| nickname | 是       | 用户名 |
| gender   | 是       | 性别   |
| qq       | 是       | qq     |
| wechat   | 是       | 微信   |
| pwd      | 是       | 密码   |
| major    | 是       | 专业   |
| campus   | 是       | 校区   |
| heading  | 是       | 头像   |
| id       | 是       | 学号   |

成功返回数据 1

失败返回数据 0

**验证登录**

180.76.100.8:8080/byzh/user/verify

| 参数 | 是否必须 | 说明 |
| ---- | -------- | ---- |
| id   | 是       | 学号 |
| pwd  | 是       | 密码 |

成功返回`json`数据`User`对象

失败返回`json`数据`User`空(null)对象

**更新用户**

180.76.100.8:8080/byzh/user/update

| 参数     | 是否必须 | 说明   |
| -------- | -------- | ------ |
| nickname | 是       | 用户名 |
| gender   | 是       | 性别   |
| qq       | 是       | qq     |
| wechat   | 是       | 微信   |
| pwd      | 是       | 密码   |
| major    | 是       | 专业   |
| campus   | 是       | 校区   |
| heading  | 是       | 头像   |
| id       | 是       | 学号   |

成功返回数据 1
失败返回数据 0

**删除用户**

180.76.100.8:8080/byzh/user/delete

| 参数     | 是否必须 | 说明   |
| -------- | -------- | ------ |
| nickname | 是       | 用户名 |
| gender   | 是       | 性别   |
| qq       | 是       | qq     |
| wechat   | 是       | 微信   |
| pwd      | 是       | 密码   |
| major    | 是       | 专业   |
| campus   | 是       | 校区   |
| heading  | 是       | 头像   |
| id       | 是       | 学号   |

成功返回数据 1
失败返回数据 0