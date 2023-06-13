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
                                readonly
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
                                readonly
                            />
                        </div>
                        <div class="write_content">
                            <P class="write_text">내용</P>
                            <!-- 정렬 맞추면 공백 생김 -->
                            <textarea rows="12" cols="80" name="bbsCn" class="content" maxlength="2000" readonly>
<c:out value="${selectUpdate.bbsCn}" /></textarea
                            >
                        </div>
                        <div class="write_buttons">
                            <input class="default_button update_button" type="button" value="수정하기" />
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
        // 지우기 전에 이 부분 코드 수정한거 기록에 남겨야 할 듯

        const header = document.querySelector("header");

        const send = document.querySelector(".send_button");
        const frm = document.getElementById("frm");
        const able = document.getElementById("submit");
        const title = document.querySelector(".title");
        const writer = document.querySelector(".writer");
        const content = document.querySelector(".content");

        const writeButton = document.querySelector(".write_buttons");
        const createButton = document.createElement("input");
        const cancelButton = document.getElementById("cancel_button");
        const deleteButton = document.querySelector(".delete_button");

        const updateButton = document.querySelector(".update_button");
        let onUpdateClickable = false;

        function onCancelButton() {
            window.location.reload();
        }

        updateButton.addEventListener("click", function (e) {
            e.preventDefault();

            let formData = new FormData($("#frm")[0]);

            if (title.value.trim() === "" || writer.value.trim() === "" || content.value.trim() === "") {
                alert("공백은 사용 불가능합니다.");
            }

            if (onUpdateClickable === false) {
                onUpdateClickable = true;

                // readonly 제거 (수정불가)
                title.removeAttribute("readonly");
                writer.removeAttribute("readonly");
                content.removeAttribute("readonly");
                updateButton.value = "수정완료";
                header.innerHTML = "<h1>게시글 수정<h1>";

                updateButton.setAttribute("id", "submit");

                // button 추가
                onAddButton();
            } else if (onUpdateClickable === true) {
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

                            onUpdateClickable = false;

                            // readonly
                            title.setAttribute("readonly", true);
                            writer.setAttribute("readonly", true);
                            content.setAttribute("readonly", true);

                            // 변경
                            updateButton.removeAttribute("id");
                            updateButton.value = "수정하기";
                            header.innerHTML = "<h1>게시글 보기<h1>";

                            // button 제거
                            onCancelButton();
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
        });

        // 페이지 새로 빼서 수정하기
        function onAddButton() {
            writeButton.appendChild(createButton);
            createButton.className = "default_button write_buttons_gray";
            createButton.id = "cancel_button";
            createButton.type = "button";
            createButton.value = "취소하기";
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
