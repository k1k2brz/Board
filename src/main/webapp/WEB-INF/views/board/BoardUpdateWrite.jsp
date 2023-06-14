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
                    <h1 class="header">게시글 수정</h1>
                </header>
                <hr />
                <section>
                    <form class="send_button" id="frm" name="frm" method="post">
                        <input type="hidden" id="bbsId" name="bbsId" value='<c:out value="${selectUpdate.bbsId}" />' />
                        <div class="write_title">
                            <P class="write_text">제목</P>
                            <input
                                type="text"
                                id="bbsSj"
                                name="bbsSj"
                                class="title"
                                maxlength="50"
                                value='<c:out value="${selectUpdate.bbsSj}" />'
                            />
                        </div>
                        <div class="write_user">
                            <P class="write_text">작성자</P>
                            <input
                                type="text"
                                name="wrter"
                                class="writer"
                                maxlength="30"
                                value='<c:out value="${selectUpdate.wrter}" />'
                            />
                        </div>
                        <div class="write_content">
                            <P class="write_text">내용</P>
                            <!-- 정렬 맞추면 공백 생김 -->
                            <textarea rows="12" cols="80" name="bbsCn" class="content" maxlength="2000">
<c:out value="${selectUpdate.bbsCn}" /></textarea
                            >
                        </div>
                        <div class="write_buttons">
                            <input class="default_button update_button" type="button" value="수정완료" />
                            <input
                                class="default_button write_buttons_gray"
                                type="button"
                                value="수정취소"
                                onclick='onDeleteCancel(<c:out value="${selectUpdate.bbsId}" />)'
                            />
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </body>
    <script>
        const frm = document.getElementById("frm");
        const title = document.querySelector(".title");
        const writer = document.querySelector(".writer");
        const content = document.querySelector(".content");

        const updateButton = document.querySelector(".update_button");

        updateButton.addEventListener("click", function (e) {
            e.preventDefault();

            let formData = new FormData($("#frm")[0]);

            if (title.value.trim() === "" || writer.value.trim() === "" || content.value.trim() === "") {
                alert("공백은 사용 불가능합니다.");
            }
            $.ajax({
                url: "/updateAction",
                type: "post",
                dataType: "json",
                contentType: false,
                processData: false,
                cache: false,
                data: formData,
                success: function (data, status) {
                    console.log(data.resultFlag, data, status);
                    if (data.resultFlag === "1") {
                        alert(status);
                        onDeleteCancel($("#bbsId").val())
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
        });


        function onDeleteCancel(id) {
            const form = $("#frm")[0];
            $("#bbsId").val(id);
            form.action = "/update";
            form.submit();
        }
    </script>
</html>
