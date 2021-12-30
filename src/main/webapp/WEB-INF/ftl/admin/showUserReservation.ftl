<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查询预订订单</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                根据客房编号或客户昵称查询预订订单
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/admin/reservation/doShowReservation" method="post" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户昵称</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="username"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="查询"/>
                    </div>
                </div>
            </form>
            <br/>
            <a href="/admin/reservation/doShowAllReservation?flag=orderTime">按下单时间分页显示预定订单</a>
            &nbsp;&nbsp;
            <a href="/admin/reservation/doShowAllReservation?flag=checkInTime">按入住时间分页显示预定订单</a>
            <br/>
            <a href="/admin/toOperate">返回首页</a>
        </div>
    </div>
</div>
</body>
</html>