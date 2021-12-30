<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <h3 class="text-center">
                    欢迎来到雨翔酒店的注册页面
                </h3>
                <br/>
                <label style="color: red">${hint}</label>
                <br/>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <form class="form-horizontal" role="form" action="doRegister" method="post" id="registerForm" enctype="multipart/form-data" accept-charset="UTF-8">
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
                        <label class="col-sm-2 control-label">性别</label>
                        <input type="radio" name="gender" id="gender" value="男" checked/>男&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="gender" value="女">女
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <label id="isEmailValid"></label>
                        <div class="col-sm-10">
                            <input required type="email" class="form-control" name="email" id="email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话号码</label>
                        <label id="isTelValid"></label>
                        <div class="col-sm-10">
                            <input required type="number" class="form-control" name="phone" id="phone" />
                            <button id="sendCode">发送验证码</button>
                            <label id="sendStatus"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话验证码</label>
                        <label id="isCodeValid"></label>
                        <div class="col-sm-10">
                            <input  type="text" class="form-control" name="code" id="code" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上传头像</label>
                        <input type="file" name="photo" id="photo" />
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-default" value="注册"/>
                        </div>
                    </div>
                </form>
                <a href="/toIndex">返回首页</a>
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
                var tel=$('#phone').val();
                var email=$('#email').val();
                if(isValid&checkPassword(password)
                    & checkRePassword(rePassword,password)
                    & checkEmail(email)
                    & checkTel(tel)){
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
            //验证电话
            $("#phone").on('blur',function(){
                checkTel($(this).val());
            });
            //验证邮箱
            $("#email").on('blur',function(){
                checkEmail($(this).val());
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
                var flag=/\d*/.test(password);
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

            function checkEmail(email) {
                var flag = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(email);
                if(flag){
                    $('#isEmailValid').text('邮箱格式正确').css('color', 'green');
                }else{
                    $('#isEmailValid').text('邮箱格式正确错误').css('color', 'red');
                }
                return flag;
            }

            function checkTel(tel){
                var flag = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,3,5-9]))\d{8}$/.test(tel);
                if(flag){
                    $('#isTelValid').text('电话号码格式正确').css('color', 'green');
                }else{
                    $('#isTelValid').text('电话号码格式错误').css('color', 'red');
                }
                return flag;
            }

            //发送验证码
            $("#sendCode").on('click',function () {
                if (checkTel($('#phone').val())){
                    $("#sendCode").attr('disabled','disabled');
                    $('#code').attr('required','required')
                    $('sendStatus').text('正在发送验证码...');
                    $.getJSON('doSendCode?realName='+$('#realName').val()+'&phone='+$('#phone').val(),function (json) {
                        if(!json.success){
                            this.removeAttr('disabled');
                            $('#sendStatus').text('发送失败，请重新点击发送...');
                        }else{
                            $('#sendStatus').text('验证码发送成功...');
                        }
                    })
                }
            });
            //检查验证码
            $('#code').on('blur',function () {
                $.getJSON('doCheckCode?code='+$('#code').val(),function (json) {
                    isValid=json.success;
                    if(isValid){
                        $('#isCodeValid').text('验证码正确').css('color', 'green');
                    }else{
                        $('#isCodeValid').text('验证码错误').css('color', 'red');
                    }
                })
            })
        });
    </script>
</body>
</html>
