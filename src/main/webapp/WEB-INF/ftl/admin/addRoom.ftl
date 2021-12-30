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
                添加<label style="color: red">${catalog.catalog}</label>的客房
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="doAddRoom" method="post" id="doAddRoom"
                  enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">房间号</label>
                    <label id="isRoomNumValid"></label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="roomNum" id="roomNum"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">面积</label>
                    <div class="col-sm-10">
                        <input required type="number" class="form-control" name="area" id="area"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-10">
                        <input required type="number" class="form-control" name="price" id="price"/>
                    </div>
                </div>
<#--                <div class="form-group">-->
<#--                    <label class="col-sm-2 control-label">房间类型</label>-->
<#--                    <div class="col-sm-10">-->
<#--                        <input required type="number" class="form-control" name="roomCatalog" id="roomCatalog"/>-->
<#--                    </div>-->
<#--                </div>-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">简介</label>
                    <label id="isRePasswordValid"></label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="intro" id="intro"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">上传图片</label>
                    <input type="file" name="primaryPhoto" id="primaryPhoto"/>
                    <input id="addButton" type="button" value="+" class="addButton">
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="添加"/>
                    </div>
                </div>
            </form>
            <a href="/super/room/doShowRoomByCatalog">返回上一页</a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        var valid = false;
        $('#doAddRoom').on('submit', function (evt) {
            evt.preventDefault();
            if (valid) {
                this.submit();
            }
        });

        $('#roomNum').on('blur', function () {
            var roomNum = $(this).val();
            $.getJSON('checkRoomNum?roomNum=' + roomNum, function (json) {
                if (json.valid) {
                    $('#isRoomNumValid').text(json.message).css('color', 'red');
                    $('#roomNum').focus();
                } else {
                    $('#isRoomNumValid').text(json.message).css('color', 'green');
                    valid = true;
                }
            });
        });
    });
</script>
</body>
</html>
