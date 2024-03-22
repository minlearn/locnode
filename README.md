

鉴于现在的主机论很难玩又融入奇特化
发布这个新的创新选择小玩具

## 演示

![](https://s2.loli.net/2024/03/23/hwsAiFReH3S8GEx.png)

地址：https://locnode.com  
仓库: https://github.com/minlearn/locnode  

## 安装

共3步

### 第一步. Fork本仓库到你的GitHub帐号

登你的github，然后点击 https://github.com/minlearn/locnode/fork 把仓库fork到你的github帐号

### 第二步. 在你fork到的仓库里面加几个部署相关的密码变量

进入你fork到的仓库的 [Settings -> Secrets -> Actions](../../settings/secrets/actions), 创建几个部署相关的密码变量，共3个（最后2个r2相关的不需要），如何获取这些变量及如何复制为变量(请展开查看细节)：  

<img width="826" alt="Screenshot 2022-12-04 at 4 10 46 PM" src="https://user-images.githubusercontent.com/1719237/205524410-268abf92-af61-467a-8883-78b8d4de3c56.png">

<details>
<summary><b>如何获得CLOUDFLARE_ACCOUNT_ID变量</b></summary>
登录cf面板会自动跳到:https://dash.cloudflare.com/[你的帐号id]  ，比如这样：https://dash.cloudflare.com/fff88980eeeeedcc3ffffd4f555f4999，  后面的 * fff88980eeeeedcc3ffffd4f555f4999 * 就是帐号id  
将其复制到仓库的[Settings -> Secrets -> Actions](../../settings/secrets/actions) 处即可，注意复制到不要有多余字符，会显示为星号，
<img width="846" alt="Screenshot 2022-12-17 at 10 31 10 AM" src="https://user-images.githubusercontent.com/1719237/208216752-56f00f51-29cb-43ea-b720-75244719898d.png">
</details>

<details>
<summary><b>如何获得CLOUDFLARE_API_TOKEN变量</b></summary>
登录cf，定位到: https://dash.cloudflare.com/profile/api-tokens  创建一个custom token:  
<img width="925" alt="Screenshot 2022-12-04 at 4 30 57 PM" src="https://user-images.githubusercontent.com/1719237/205525627-14da54ae-1733-4db5-b65d-94f5ec48f360.png">  
修改token的权限，放行Cloudflare Pages 和 D1:
<img width="990" alt="Screenshot 2022-12-04 at 4 31 41 PM" src="https://user-images.githubusercontent.com/1719237/205525675-4c8a6bce-21a8-45e3-bf0c-28981f123da3.png">  
像复制帐号id一样复制为仓库的对应名字变量
</details>


<details>
<summary><b>给要部署到cf的整套应用取一个名字前缀CLOUDFLARE_PROJECT_NAME</b></summary>
随便都可以，就是不要带._等特殊符号，比如你取名为discuss，或discussmyxxxdomain都可以
像复制帐号id一样复制为仓库的对应名字变量
</details>


### 第三步. 在你fork到的仓库里面运行部署

前往 [Actions -> Deploy to Cloudflare Pages](../../actions/workflows/deploy.yml) 运行deploy  
<img width="1606" alt="Screenshot 2022-12-04 at 4 11 19 PM" src="https://user-images.githubusercontent.com/1719237/205526856-05ea0ff4-703a-4d08-bc7f-4ae2dfc07cfe.png">


### 最后，检查结果

等部署完毕, 绿点表示成功. 你可以在 [Cloudflare dashboard](https://dash.cloudflare.com/sign-up/pages) 处看到已生成形式为 CLOUDFLARE_PROJECT_NAME变量.pages.dev 的pages应用，点击即可访问


## 更新/修改设置：

在fork的git仓库里编辑dist/_workers.js源码，找到以下并修改，注意格式，比如，invite后面的on改成off可关闭邀请

```
exports=JSON.parse('{"backend":"/","defaults":{"sitetitle":"Locnode","dismissmessage":"第一款能在cf上运行的分布式轻量论坛, 相关咨询联系tg：https://t.me/minlearn_1keydd"},"invite":"on"}'
```

然后覆盖部署即可

常规操作在论坛界面上即可操作。其它的将用户设为仲裁员和增加注册码的工作，请直接在d1数据库中操作。


