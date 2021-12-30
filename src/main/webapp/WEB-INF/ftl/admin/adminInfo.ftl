<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                下面是所有管理员的信息
            </h3>
            <br/>
            <a href="/super/toAddAdmin">添加管理员</a>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        登录名
                    </th>
                    <th>
                        真实姓名
                    </th>
                    <th>
                        员工编号
                    </th>
                    <th>
                        员工权限
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list adminList as admin>
                    <tr id="tr${admin.id}">
                        <td>
                            ${admin.username}
                        </td>
                        <td>
                            ${admin.realName}
                        </td>
                        <td>
                            ${admin.empNum}
                        </td>
                        <td>
                            <#assign status="${admin.superAdmin}">
                            <#if status=="true">
                                超级管理员
                            <#else>
                                普通管理员
                            </#if>
                        </td>
                        <td>
                            <a href="javascript:deleteAdmin(${admin.id})">删除该管理员</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <a href="/super/toSuper">返回上一页</a>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function deleteAdmin(id) {
        if (confirm("确定删除该管理员？")){
            $.getJSON('doDeleteAdmin?id='+id,function (json) {
                if(json.flag){
                    $('#tr'+id).remove();
                    alert(json.message);
                }else{
                    alert(json.message);
                }
            })
        }
    }
</script>
</body>
</html>