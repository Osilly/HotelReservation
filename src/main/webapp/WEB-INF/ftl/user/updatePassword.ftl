<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-pills">
                <li class="active">
                    <a href="/toIndex">首页</a>
                </li>
                <li>
                    <a href="/user/room/showRoomByCatalog">客房信息</a>
                </li>
                <li class="dropdown pull-right">
                    <p>
                        <#if user!=null>
                            <a href="/user/toInformation">${user.realName}</a>
                            &nbsp;&nbsp;
                            <a href="/user/reservation/showByUser">我的订单</a>
                            &nbsp;&nbsp;
                            <a href="/user/doLogout">注销</a>
                            <#else>
                                <a href="/user/toLogin">登录</a>
                                &nbsp;&nbsp;
                                <a href="/user/toRegister">注册</a>
                        </#if>
                    </p>
                </li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                修改密码
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" method="post" action="/user/updatePassword">
                <div class="form-group">
                    <label  class="col-sm-2 control-label">密码</label>
                    <label id="isPasswordValid">（不能全是符号,或全是字母，或全是数字，8-32位组合）</label>
                    <div class="col-sm-10">
                        <input required type="password" class="form-control" name="password" id="password" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">重复密码</label>
                    <label id="isRePasswordValid"></label>
                    <div class="col-sm-10">
                        <input required type="password" class="form-control" name="rePassword" id="rePassword" />
                    </div>
                </div>
                <button type="submit" class="btn btn-default">修改</button>
            </form>
            <a href="/user/toInformation">个人主页</a>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        //验证表单
        //如果是 registerForm 有问题，拿到的是 window 对象
        $('#registerForm').on('submit',function(evt){
            evt.preventDefault();
            var password=$('#password').val();
            var rePassword=$('#rePassword').val();
            if(checkPassword(password) & checkRePassword(rePassword,password)){
                this.submit();
            }
        });
        //验证密码
        $("#password").on('blur',function(){
            checkPassword($(this).val());
        });
        //验证重复密码
        $("#rePassword").on('blur',function(){
            checkRePassword($(this).val(),$('#password').val());
        });

        function checkPassword(password){
            var flag=/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]{8,18}$/.test(password);
            if(flag){
                $('#isPasswordValid').text('密码格式正确').css('color', 'green');
            }else{
                $('#isPasswordValid').text('密码格式错误').css('color', 'red');
            }
            return flag;
        }

        function checkRePassword(rePassword,password){
            var flag = rePassword==password;
            if(flag){
                $('#isRePasswordValid').text('密码一致').css('color', 'green');
            }else{
                $('#isRePasswordValid').text('密码不一致').css('color', 'red');
            }
            return flag;
        }
    });
</script>
</body>
</html>