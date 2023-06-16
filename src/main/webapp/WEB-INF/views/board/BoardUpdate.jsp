<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>게시글 보기</title>
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
                        <article>
                            <div class="write_user write_cnt_wrap">
                                <ul class="write_text_info">
                                    <li>작성자: <c:out value="${selectUpdate.wrter}" />&nbsp; &nbsp;</li>
                                    <li>수정자: <c:out value="${selectUpdate.updusr}" /></li>
                                </ul>
                                <ul class="write_text_info">
                                    <li>조회: <c:out value="${selectUpdate.rdcnt}" /> &nbsp; &nbsp;</li>
                                    <li>
                                        작성일: <c:out value="${selectUpdate.writngDt.substring(0,19)}" />&nbsp; &nbsp;
                                    </li>
                                    <li>수정일: <c:out value="${selectUpdate.updtDt.substring(0,19)}" /></li>
                                </ul>
                            </div>
                            <div class="write_content read_content">
                                <span><c:out value="${selectUpdate.bbsCn}" /></span>
                            </div>
                        </article>
                        <hr />
                        <div class="write_move_board">
                            <div class="write_next_board prev_next">
                                <h5>다음글</h5>
                                <span> || </span>
                                <c:choose>
                                    <c:when test="${selectNext.bbsSj != NULL}">
                                        <button
                                            class="w_next pn_button"
                                            type="button"
                                            onClick='onNextContent(<c:out value="${selectNext.bbsId}" />)'
                                        >
                                            <c:out value="${selectNext.bbsSj}" />
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="w_prev">등록된 게시글이 없습니다.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <hr class="article_hr" />
                            <div class="write_prev_board prev_next">
                                <h5>이전글</h5>
                                <span> || </span>
                                <c:choose>
                                    <c:when test="${selectPrev.bbsSj != NULL}">
                                        <button
                                            class="w_prev pn_button"
                                            type="button"
                                            onClick='onPrevContent(<c:out value="${selectPrev.bbsId}" />)'
                                        >
                                            <c:out value="${selectPrev.bbsSj}" />
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="w_prev">등록된 게시글이 없습니다.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr />
                        <div class="write_buttons">
                            <input
                                id="openModalBtn"
                                class="default_button update_button"
                                type="button"
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
        <!-- modal -->
        <div id="passwordModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>비밀번호 확인</h2>
                <div class="modal-flex">
                    <input type="password" id="passwordInput" placeholder="비밀번호를 입력하세요" />
                    <button id="confirmBtn" onclick='onUpdateWrite(<c:out value="${selectUpdate.bbsId}" />)'>확인</button>
                </div>
            </div>
        </div>
    </body>
    <script>
        // row num(Query), 수정자 나오게
        const prevButton = $(".w_prev");
        const nextButton = $(".w_next");

        function onPrevContent(id) {
            const form = $("#frm")[0];
            $("#bbsId").val(id);
            form.action = "/update";
            form.submit();
        }

        function onNextContent(id) {
            const form = $("#frm")[0];
            $("#bbsId").val(id);
            form.action = "/update";
            form.submit();
        }

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

        // Modal
        $(document).ready(function () {
            $("#openModalBtn").click(function () {
                $("#passwordModal").css("display", "block");
            });

            // 모달 창 닫기
            $(".close").click(function () {
                $("#passwordModal").css("display", "none");
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $("#confirmBtn").click(function () {
                const passwordInput = $("#passwordInput").val();
                console.log('d')
                // if (passwordInput === "password123") {
                //     alert("비밀번호 확인 성공");
                //     $("#passwordModal").css("display", "none");
                // } else {
                //     alert("비밀번호가 올바르지 않습니다");
                // }
            });

            // 모달 창 바깥 클릭 시 닫기
            $(window).click(function (event) {
                if (event.target.id === "passwordModal") {
                    $("#passwordModal").css("display", "none");
                }
            });
        });
    </script>
</html>
