<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                添加普通管理员
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/super/doAddAdmin" method="post" id="registerForm" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <label id="isUsernameValid">（大小写字母开头；数字，字母，下划线混合6到18位）</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="username" id="username" />
                    </div>
                </div>
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
                <div class="form-group">
                    <label class="col-sm-2 control-label">真实姓名</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="realName" id="realName" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">员工编号</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="empNum" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="添加"/>
                    </div>
                </div>
            </form>
            <a href="/super/toSuper">返回首页</a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        var isValid=false;
        //验证表单
        //如果是 registerForm 有问题，拿到的是 window 对象
        $('#registerForm').on('submit',function(evt){
            evt.preventDefault();
            var password=$('#password').val();
            var rePassword=$('#rePassword').val();
            if(isValid&checkPassword(password)
                    & checkRePassword(rePassword,password)){
                this.submit();
            }
        });
        //Ajax檢查用戶名唯一性
        $('#username').on('blur',function(){
            var username=$(this).val();
            if(checkUsername(username)){
                $.getJSON('doCheckUsername?username='+username,function(json){
                    isValid=json.valid;
                    if(isValid){
                        $('#isUsernameValid').text('√(合法用户名)').css('color', 'green');
                    }else {
                        $('#isUsernameValid').text('X(用户名已被占用，请更换)').css('color', 'red');
                        $('#username').focus();
                    }
                });
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
        function checkUsername(username){
            var flag=/^[a-zA-z]\w{6,18}$/.test(username);
            if(!flag){
                $('#isUsernameValid').text('X(非法用户名)').css('color', 'red');
                $('#username').focus();
            }else {
                $('#isUsernameValid').text('√(合法用户名)').css('color', 'green');
            }
            return flag;
        }
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