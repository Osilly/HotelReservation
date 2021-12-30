<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>客房信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                用户信息
            </h3>
            <form class="form-horizontal" role="form" action="/super/user/byUsername" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label">根据用户名查询</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input required type="submit" value="查询" class="btn btn-default"/>
                    </div>
                </div>
            </form>
            <br/>
            <form class="form-horizontal" role="form" action="/super/user/byPhone" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label">根据电话号码查询</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="phone"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input required type="submit" value="查询" class="btn btn-default"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <h4><p style="color: red">${hint}</p></h4>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        用户名
                    </th>
                    <th>
                        真实姓名
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        邮箱
                    </th>
                    <th>
                        电话号码
                    </th>
                    <th>
                        状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list userList as user>
                <tr>
                    <td>
                        ${user.username}
                    </td>
                    <td>
                        ${user.realName}
                    </td>
                    <td>
                        ${user.gender}
                    </td>
                    <td>
                        ${user.email}
                    </td>
                    <td>
                        ${user.phone}
                    </td>
                    <#assign status="${user.status}"/>
                    <#if status=="1">
                        <td id='td${user.id}'>
                            正常&nbsp;<a href="javascript:block(${user.id})">锁定</a>
                        </td>
                    <#else>
                        <td id='td${user.id}'>
                            锁定&nbsp;<a href="javascript:deblock(${user.id})">解锁</a>
                        </td>
                    </#if>
                </tr>
                </#list>
                </tbody>
            </table>
            <br/>
            <a href="/super/toSuper">返回</a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function block(userId) {
        if (confirm("确定锁定该用户？")){
            $.getJSON('modifyStatus?userId='+userId+'&status=0',function (json) {
                if(json){
                    $('#td'+userId).html('锁定&nbsp;<a href="javascript:block('+userId+')">解锁</a>');
                    alert('锁定成功');
                }else{
                    alert('锁定失败');
                }
            })
        }
    }
    function deblock(userId) {
        if (confirm("确定解锁该用户？")){
            $.getJSON('modifyStatus?userId='+userId+'&status=1',function (json) {
                if(json){
                    $('#td'+userId).html('正常&nbsp;<a href="javascript:block('+userId+')">锁定</a>');
                    alert('解锁成功');
                }else{
                    alert('解锁失败');
                }
            })
        }
    }
</script>
</body>
</html>