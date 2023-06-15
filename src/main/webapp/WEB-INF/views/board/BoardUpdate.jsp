<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>게시글 수정</title>
        <link rel="stylesheet" href="resources/css/common.css" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div>
                <header>
                    <h1 class="update_title"><c:out value="${selectUpdate.bbsSj}" /></h1>
                </header>
                <hr />
                <section>
                    <form class="send_button" id="frm" name="frm" method="post">
                        <input type="hidden" id="bbsId" name="bbsId" value='<c:out value="${selectUpdate.bbsId}" />' />
                        <div class="write_user write_cnt_wrap">
                            <ul class="write_text_info">
                                <li>작성자: <c:out value="${selectUpdate.wrter}" />&nbsp; &nbsp;</li>
                                <li>수정자: <c:out value="${selectUpdate.updusr}" /></li>
                            </ul>
                            <ul class="write_text_info">
                                <li>조회: <c:out value="${selectUpdate.rdcnt}" /> &nbsp; &nbsp;</li>
                                <li>작성일: 
                                    <c:out value="${selectUpdate.writngDt.substring(0,19)}" />&nbsp; &nbsp;
                                </li>
                                <li>
                                    수정일:  <c:out value="${selectUpdate.updtDt.substring(0,19)}" />
                                </li>
                            </ul>
                        </div>
                        <div class="write_content read_content">
                            <span><c:out value="${selectUpdate.bbsCn}" /></span>
                        </div>
                        <hr />
                        <div class="write_buttons">
                            <input
                                class="default_button update_button"
                                type="button"
                                onclick='onUpdateWrite(<c:out value="${selectUpdate.bbsId}" />)'
                                value="수정하기"
                            />
                            <input
                                class="default_button delete_button"
                                type="button"
                                onclick='onDelete(<c:out value="${selectUpdate.bbsId}" />)'
                                value="삭제하기"
                            />
                            <input
                                class="default_button write_buttons_gray"
                                type="button"
                                value="목록으로"
                                onclick="location.href='/'"
                            />
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </body>
    <script>
        // row num(Query), 수정자 나오게
        
        function onUpdateWrite(id) {
            const form = $("#frm")[0];
            $("#bbsId").val(id);
            form.action = "/updateWrite";
            form.submit();
        }

        function onDelete(id) {
            const body = { bbsId: Number(id) };
            console.log(body);
            $.ajax({
                url: "/deleteAction",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: body,
                success: function (data, status) {
                    console.log(data.resultFlag, data, status);
                    if (data.resultFlag === "1") {
                        alert(status);
                        location.href = "/";
                    } else {
                        alert("ERROR Message : Not " + status);
                    }
                },
                error: function (xhr, error) {
                    console.log("res : " + xhr);
                    console.log("e : " + error);
                    alert("ERROR");
                },
            });
        }
    </script>
</html>
