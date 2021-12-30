<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                欢迎登陆雨翔酒店
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
            <form class="form-horizontal" role="form" action="/user/doLogin" method="post" id="loginForm">
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="username" id="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <img class="col-sm-2 control-label" id="imageCode" src="../getImageCode" width="80" height="30"/>
                    <label id="idImageCodeValid"></label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="code" id="imageCodeIn"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" id="password"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input required type="submit" value="登陆" class="btn btn-default"/>
                    </div>
                </div>
            </form>
            <a href="/toIndex">返回首页</a>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    var isValid=false;
    $('#loginForm').on('submit',function(evt){
        evt.preventDefault();
        if(isValid){
            this.submit();
        }
    });

    $('#imageCodeIn').on('blur',function () {
        $.getJSON('doCheckCode?code='+$('#imageCodeIn').val(),function (json) {
            isValid=json.success;
            if (isValid){
                $('#idImageCodeValid').text('验证码正确').css('color', 'green');
            }else {
                $('#idImageCodeValid').text('验证码错误').css('color', 'red');
            }
        })
    });

    $('#imageCode').on('click',function () {
        $('#imageCode').attr('src','../getImageCode?'+new Date())
    })
</script>
</body>
</html>