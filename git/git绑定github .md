1、git界面输入ssh-keygen -t rsa -C "注册GitHub的邮箱地址"生成密钥

![image-20230305013611933](git绑定github -img/image-20230305013611933.png)

2.密钥生成路径

![image-20230305013806458](./git绑定github -img/image-20230305013806458.png)

3.将生成的公钥id_rsa.pub打开并粘贴复制到github

![image-20230305014216309](img/git绑定github -img/image-20230305014216309.png)

4.使用ssh -T git@github.com 验证本地git是否与GitHub绑定成功

![image-20230305233241561](img/git绑定github -img/image-20230305233241561.png)

​	如果出现验证未通过，删除本地路径下原来证书（C:\Users\14526\.ssh）再重新生成

![image-20230305233310273](img/git绑定github -img/image-20230305233310273.png)

5. 设置用户名和登录邮箱

   ![image-20230305233708430](img/git绑定github -img/image-20230305233708430.png)

6. git init 命令初始化git仓库

   ![image-20230305233744259](img/git绑定github -img/image-20230305233744259.png)

7. git add .  将所有文件提交到本地仓库

8. 在github上创建仓库

9. git通过git remote add origin 仓库ssh地址 将远程仓库与本地关联

   ![image-20230305234129468](img/git绑定github -img/image-20230305234129468.png)

10. git commit -m " " [file name] 将暂存区的文件提交到本地库

    ![image-20230305235548321](img/git绑定github -img/image-20230305235548321.png)

11. git push -f origin master 将本地仓库强制提交到远程库

    origin 代表远程仓库名称，master 为分支。