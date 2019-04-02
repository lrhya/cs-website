# cs

 网站名称：计科院网站

## 后端设计
### 框架开发
1. spring+spring+springmvc+maven（注解形式开发）
 或者servlet+DBUtil
2. maven 管理jar包
### 数据库表设计(可以讨论下)
1. users 用户表（主要用于登录）
2. roll  角色表（控制用户登录身份，4种）
3. graduate 毕业风采表(页面上以图片形式展示)
4. teacher 教师表（教师展示）
5. news 动态新闻表
6. newstype 动态新闻表类型
7. staticnews 静态新闻
8. statictype 静态新闻类型
9. resource 资源上传

---

### 功能模块
+ 用户登录模块
+ 资源管理模块（包括首页图片轮播，文件上传）
+ 毕业风采图片展示模块(图片上传)
+ 教师基本信息介绍模块
+ 新闻展示模块（分动态新闻、静态新闻）

---

### 定义后端接口
#### dao层接口
1. 接口实现由mybatis-spring内部实现
2. 常用接口（ T 泛型）
+ public int addT(T t);//int 返回值————1,操作数据库成功；0，操作数据库失败
+ public int deleteT(int id);//根据主键删除
+ public int updateT(T t);
+ public Page<T> findT(Page page);//分页
+ public List<T> findTSelectiv(T t);//根据条件选择性查找
+ public T findTByPrimaryKey(int id);//根据主键查找
  
---

#### service层（接口尽量和这靠拢）
1. 后台不做数据校验：非空、字段合法，数据校验由前台负责（登录模块，数据校验由后台负责）
2. 常用接口（ 后台不做数据校验,T 泛型）
+ public JsonMessage addT(T t);//String 返回值————操作结果信息
+ public JsonMessage deleteT(int id);//根据主键删除
+ public JsonMessage updateT(T t);
+ public JsonMessage findT(Page page);//分页
+ public JsonMessage findTSelectiv(T t);//根据条件选择性查找
+ public JsonMessage findTByPrimaryKey(int id);//根据主键查找

---

#### controller层
1. 后台数据存在request、session域，供前端页面调用(或者后台返回json数据，前端js调用)
2. 常用接口 （返回值存放Model，部分数据返回json格式数据）   
+ public String addT(T t, Model model);//String 返回值————指向视图路径，由springmvc视图解析器解析，model存放结果
+ public String deleteT(int id, Model model);//根据主键删除
+ public String updateT(T t, Model model);
+ public String findT(Page page， Model model);//分页
+ public String findTSelectiv(T t， Model model);//根据条件选择性查找
+ public String findTByPrimaryKey(int id， Model model);//根据主键查找

