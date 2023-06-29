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
                        <div class="write_comment">
                            <div class="comment_input">
                                <input id="comment" name="comment" type="text" placeholder="댓글을 입력해주세요." />
                                <input class="cmt_button" type="button" value="댓글쓰기" />
                            </div>
                            <div class="comment_result"></div>
                        </div>
                        <hr />
                        <div class="comment-box">
                            <div class="header">
                                <span class="author">John Doe</span>
                                <span class="timestamp">June 30, 2023</span>
                            </div>
                            <div class="content">
                                <p>This is a comment. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="actions">
                                <button class="update button">수정</button>
                                <button class="delete button">삭제</button>
                              </div>
                        </div>
                        <hr />
                        <div class="write_buttons">
                            <input
                                id="updateModalBtn"
                                class="default_button update_button"
                                type="button"
                                value="수정하기"
                            />
                            <input
                                id="deleteModalBtn"
                                class="default_button delete_button"
                                type="button"
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
                <h2 style="margin-bottom: 25px">비밀번호 확인</h2>
                <div class="modal-flex">
                    <input
                        type="password"
                        id="passwordInput"
                        class="passwordInput"
                        placeholder="비밀번호를 입력하세요"
                    />
                    <button id="confirmBtn" class="updateConfirmBtn default_modal_button">확인</button>
                </div>
            </div>
        </div>
        <!-- delete modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="margin-bottom: 25px">삭제하기</h2>
                <div class="modal-flex">
                    <input
                        type="password"
                        id="deletePasswordInput"
                        class="passwordInput"
                        placeholder="비밀번호를 입력하세요"
                    />
                    <button id="confirmBtn" class="deleteConfirmBtn default_modal_button">확인</button>
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

        function onUpdateWrite(password) {
            $.ajax({
                url: "/passwordCompare",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: { bbsId: Number($("#bbsId").val()), password },
                success: function (response) {
                    if (response.success) {
                        alert(response.message);
                        console.log(response);
                        const form = $("#frm")[0];
                        // $("#bbsId").val();
                        form.action = "/updateWrite";
                        form.submit();
                    } else {
                        console.error(response.message);
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    console.error("res : " + xhr);
                    console.log("e : " + error);
                    alert("ERROR, 수정할 수 없습니다.");
                },
            });
        }

        function onDelete(id, pw) {
            const body = { bbsId: Number(id), password: pw };
            console.log(body);
            $.ajax({
                url: "/deleteAction",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: { bbsId: Number(id), password: pw },
                success: function (response) {
                    if (response.success) {
                        alert(response.message);
                        location.href = "/";
                    } else {
                        console.error(response.message);
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    console.log("res : " + xhr);
                    alert("ERROR, 삭제할 수 없습니다.");
                },
            });
        }

        // Modal관련 메소드
        $(document).ready(function () {
            $("#updateModalBtn").click(function () {
                $("#passwordModal").css("display", "block");
            });

            // 모달 창 닫기
            $(".close").click(function () {
                $("#passwordModal").css("display", "none");
                $("#passwordInput").val('');
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $(".updateConfirmBtn").click(function () {
                const passwordInput = $("#passwordInput").val();
                if (passwordInput.trim() === "") {
                    alert("비밀번호를 입력해주세요.");
                } else {
                    $("#passwordModal").css("display", "none");
                    onUpdateWrite(passwordInput);
                }
            });

            // 모달 창 바깥 클릭 시 닫기
            $(window).click(function (event) {
                if (event.target.id === "passwordModal") {
                    $("#passwordModal").css("display", "none");
                    $("#passwordInput").val('');
                }
            });

            // delete
            $("#deleteModalBtn").click(function () {
                $("#deleteModal").css("display", "block");
            });

            // 모달 창 닫기
            $(".close").click(function () {
                $("#deleteModal").css("display", "none");
                $("#deletePasswordInput").val('');
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $(".deleteConfirmBtn").click(function () {
                const passwordInput = $("#deletePasswordInput").val();
                // 받아올 데이터 "1" 부분에 입력
                if (passwordInput.trim() === "") {
                    alert("비밀번호를 입력해주세요.");
                } else {
                    $("#deleteModal").css("display", "none");
                    onDelete($("#bbsId").val(), passwordInput);
                }
            });

            // 모달 창 바깥 클릭 시 닫기
            $(window).click(function (event) {
                if (event.target.id === "deleteModal") {
                    $("#deleteModal").css("display", "none");
                    $("#deletePasswordInput").val('');
                }
            });
        });
    </script>
</html>
