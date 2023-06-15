<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>게시글 작성</title>
        <link rel="stylesheet" href="resources/css/common.css" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <header>
                <h1 class="header">게시글 작성</h1>
            </header>
            <hr />
            <section>
                <form class="send_button" id="frm" name="frm" method="post">
                    <div class="write_title">
                        <P class="write_text">제목</P>
                        <input class="title" type="text" id="bbsSj" name="bbsSj" />
                    </div>
                    <div class="write_user">
                        <P class="write_text">작성자</P>
                        <input class="writer" type="text" id="wrter" name="wrter" />
                    </div>
                    <div class="write_content">
                        <P class="write_text">내용</P>
                        <textarea class="content" rows="12" cols="80" id="bbsCn" name="bbsCn"></textarea>
                    </div>
                    <div class="write_buttons">
                        <input
                            class="default_button update_button"
                            type="submit"
                            id="submit"
                            name="submit"
                            value="등록하기"
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
        <script>
            const send = document.querySelector(".send_button");
            const frm = $("#frm")[0];

            send.addEventListener("submit", function (e) {
                var formData = new FormData(frm);
                const title = document.querySelector(".title");
                const writer = document.querySelector(".writer");
                const content = document.querySelector(".content");
                e.preventDefault();

                if (title.value.trim() === "" || writer.value.trim() === "" || content.value.trim() === "") {
                    alert("공백은 사용 불가능합니다.");
                } else {
                    $.ajax({
                        url: "/writeAction",
                        type: "post",
                        dataType: "json",
                        contentType: false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function (data, status) {
                            if (data.resultFlag === "1") {
                                alert(status);
                                location.href = "/";
                            } else {
                                alert("ERROR");
                            }
                        },
                        error: function (xhr, error) {
                            console.log("res : " + xhr);
                            console.log("e : " + error);
                            alert("ERROR");
                        },
                    });
                }
            });
        </script>
    </body>
</html>
