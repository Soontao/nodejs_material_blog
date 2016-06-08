function onlypost(url) {
    var url = url || "/"
    $.post(url, {},
        function(data, status) {
            location.reload();
            Materialize.toast('成功', 300);
        }
    ).
    error(function(data, status) {
        console.log("失败");

    })
}

function logout() {
    $.post("/logout", function(data, status) {
        if (status) {
            onclick = Materialize.toast('注销成功', 800, '', function() {
                window.location = "/index";
            });

        }
    });
}

function deleteblog(id) {
    var url = "/articles/allblogs"
    $.post(url, {},
        function(data, status) {
            history.back(-1);
            location.reload();
            Materialize.toast('删除博客成功', 300);
        }
    ).
    error(function(data, status) {
        console.log("失败");
    })
}

function errorPro(err) {
    try {
        switch (err.status) {
            case 401:
                Materialize.toast('未授权', 1000);
                break;
            case 404:
                Materialize.toast('没有找到呢', 1000);
                break;
            case 500:
                Materialize.toast('每部错误', 1000);
                break;
        }
    } catch (e) {
        Materialize.toast('内部错误', 1000);
    }
}

function deletecomment(id) {
    var url = "/articles/comment/delete/" + id;
    $.post(url, {},
        function(data, status) {
            history.back(-1);
            location.reload();
            Materialize.toast('删除评论成功', 300);
        }
    ).
    error(function(data, status) {
        console.log("失败");
    })
}

function deleteuser(id) {
    var url = "/admin/users/delete/" + id;
    $.post(url, {},
        function(data, status) {
            history.back(-1);
            location.reload();
            Materialize.toast('删除用户成功', 300);
        }
    ).
    error(function(data, status) {
        console.log("失败");
    })
}
