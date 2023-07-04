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
        <div class="update_container">
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
                                <div class="column">
                                    <input
                                        id="answerWrter"
                                        class="answerWrter"
                                        name="answerWrter"
                                        type="text"
                                        maxlength="8"
                                        placeholder="아이디 입력"
                                    />
                                    <input
                                        id="password"
                                        class="password"
                                        name="password"
                                        type="password"
                                        maxlength="12"
                                        placeholder="비밀번호 입력"
                                    />
                                </div>
                                <textarea
                                    id="comment"
                                    class="answerCn"
                                    name="answerCn"
                                    type="text"
                                    placeholder="댓글을 입력해주세요."
                                ></textarea>
                                <input class="cmt_button" type="button" value="댓글쓰기" />
                            </div>
                        </div>
                        <hr />
                        <c:forEach var="comment" items="${selectComment}" varStatus="status">
                            <div id="comment-box-<c:out value='${comment.answerId}' />" class="comment-box">
                                <div class="header">
                                    <span class="author"
                                        ><c:out value="${comment.answerWrter}" />
                                        <c:if test="${comment.answerUpdusr != NULL}">
                                            <c:out value="(수정됨)" />
                                        </c:if>
                                    </span>
                                    <span class="timestamp"><c:out value="${comment.writngDt.substring(0,19)}" /></span>
                                </div>
                                <div class="content">
                                    <p class="comment-value" style="display: block">
                                        <c:out value="${comment.answerCn}" />
                                    </p>
                                    <textarea class="edit-textarea" name="answerCn" style="display: none">
<c:out value="${comment.answerCn}" /></textarea
                                    >
                                </div>
                                <div class="actions">
                                    <button
                                        class="update button edit"
                                        type="button"
                                        style="display: inline"
                                        onclick="onUpdateCommentModal(<c:out value='${comment.answerId}' />)"
                                    >
                                        수정
                                    </button>
                                    <button
                                        class="update button commit"
                                        type="button"
                                        style="display: none"
                                        onclick="onUpdateCommentCommit(<c:out value='${comment.answerId}' />)"
                                    >
                                        확인
                                    </button>
                                    <button
                                        class="delete button commit"
                                        type="button"
                                        style="display: inline"
                                        onclick="onDeleteCommentModal(<c:out value='${comment.answerId}' />)"
                                    >
                                        삭제
                                    </button>
                                    <button
                                        class="delete button cancel"
                                        type="button"
                                        style="display: none"
                                        onclick="onUpdateCommentCancel(<c:out value='${comment.answerId}' />)"
                                    >
                                        취소
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
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
                    <button id="updateConfirmBtn" class="updateConfirmBtn default_modal_button">확인</button>
                </div>
            </div>
        </div>
        <div id="cmtPasswordModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="margin-bottom: 25px">수정하기</h2>
                <div class="modal-flex">
                    <input
                        type="password"
                        id="cmtPasswordInput"
                        class="passwordInput"
                        placeholder="비밀번호를 입력하세요"
                    />
                    <button id="cmtUpdateConfirmBtn" class="cmtUpdateConfirmBtn default_modal_button">확인</button>
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
                    <button id="deleteConfirmBtn" class="deleteConfirmBtn default_modal_button">확인</button>
                </div>
            </div>
        </div>
        <div id="cmtDeleteModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="margin-bottom: 25px">삭제하기</h2>
                <div class="modal-flex">
                    <input
                        type="password"
                        id="cmtDeletePasswordInput"
                        class="passwordInput"
                        placeholder="비밀번호를 입력하세요"
                    />
                    <button id="cmtDeleteConfirmBtn" class="cmtDeleteConfirmBtn default_modal_button">확인</button>
                </div>
            </div>
        </div>
    </body>
    <script>
        const form = $("#frm")[0];
        let checked = false;

        $(function () {
            $(".cmt_button").click("submit", function () {
                if ($(".answerCn").val() === "" || $("#answerWrter").val() === "" || $(".password").val() === "") {
                    alert("공백은 사용 불가능합니다.");
                } else {
                    console.log($("#bbsId").val(), $("#answerWrter").val(), $(".answerCn").val());
                    const body = {
                        bbsId: $("#bbsId").val(),
                        answerWrter: $("#answerWrter").val(),
                        answerCn: $(".answerCn").val(),
                        password: $(".password").val(),
                    };
                    $.ajax({
                        url: "/commentAction",
                        type: "post",
                        dataType: "json",
                        processData: true,
                        cache: false,
                        data: body,
                        success: function (data, status) {
                            if (data.success === "1") {
                                $("#bbsId").val();
                                form.action = "/update";
                                form.submit();
                            } else {
                                alert("댓글을 작성할 수 없습니다.");
                            }
                        },
                        error: function (xhr, error) {
                            alert("댓글을 작성할 수 없습니다.");
                        },
                    });
                }
            });
        });

        // row num(Query), 수정자 나오게
        const prevButton = $(".w_prev");
        const nextButton = $(".w_next");

        function onPrevContent(id) {
            $("#bbsId").val(id);
            form.action = "/update";
            form.submit();
        }

        function onNextContent(id) {
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
                        form.action = "/updateWrite";
                        form.submit();
                    } else {
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    alert("게시글을 수정할 수 없습니다.");
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
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    alert("게시글을 삭제할 수 없습니다.");
                },
            });
        }

        // COMMENT
        function onUpdateComment(id, password) {
            $.ajax({
                url: "/commentPasswordCompare",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: { answerId: id, password },
                success: function (response) {
                    if (response.success) {
                        const commentTextarea = "#comment-box-" + id + " " + ".edit-textarea";
                        const commentContent = "#comment-box-" + id + " " + ".comment-value";
                        const updateButton = "#comment-box-" + id + " " + ".update.button.edit";
                        const commitButton = "#comment-box-" + id + " " + ".update.button.commit";
                        const deleteButton = "#comment-box-" + id + " " + ".delete.button.commit";
                        const cancelButton = "#comment-box-" + id + " " + ".delete.button.cancel";

                        $(commentTextarea).attr("id", "edit-active");

                        $(commentTextarea).css("display", "block");
                        $(commitButton).css("display", "inline");
                        $(cancelButton).css("display", "inline");
                        $(deleteButton).css("display", "none");
                        $(updateButton).css("display", "none");
                        $(commentContent).css("display", "none");
                        $("#cmtPasswordInput").val("");
                    } else {
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    alert("댓글을 수정할 수 없습니다.");
                    $("#cmtPasswordInput").val("");
                },
            });
        }

        function onUpdateCommentCommit(id) {
            const commentTextarea = "#comment-box-" + id + " " + ".edit-textarea";
            $.ajax({
                url: "/commentUpdateAction",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: { answerId: id, answerCn: $(commentTextarea).val() },
                success: function (response) {
                    if (response.success === "1") {
                        const commentContent = "#comment-box-" + id + " " + ".comment-value";
                        const updateButton = "#comment-box-" + id + " " + ".update.button.edit";
                        const commitButton = "#comment-box-" + id + " " + ".update.button.commit";
                        const deleteButton = "#comment-box-" + id + " " + ".delete.button.commit";
                        const cancelButton = "#comment-box-" + id + " " + ".delete.button.cancel";

                        $(commentTextarea).removeAttr("id", "edit-active");

                        $(commentTextarea).css("display", "none");
                        $(commitButton).css("display", "none");
                        $(cancelButton).css("display", "none");
                        $(deleteButton).css("display", "inline");
                        $(updateButton).css("display", "inline");
                        $(commentContent).css("display", "inline");
                        $("#cmtPasswordInput").val("");
                        $("#bbsId").val();
                        form.action = "/update";
                        form.submit();
                    } else {
                        alert("ERROR Message : " + response);
                    }
                },
                error: function (xhr, error) {
                    console.error("res : " + xhr);
                    alert("댓글을 수정할 수 없습니다.");
                },
            });
        }

        function onUpdateCommentCancel(id) {
            const commentTextarea = "#comment-box-" + id + " " + ".edit-textarea";
            const commentContent = "#comment-box-" + id + " " + ".comment-value";
            const updateButton = "#comment-box-" + id + " " + ".update.button.edit";
            const commitButton = "#comment-box-" + id + " " + ".update.button.commit";
            const deleteButton = "#comment-box-" + id + " " + ".delete.button.commit";
            const cancelButton = "#comment-box-" + id + " " + ".delete.button.cancel";

            $(commentTextarea).css("display", "none");
            $(commitButton).css("display", "none");
            $(cancelButton).css("display", "none");
            $(deleteButton).css("display", "inline");
            $(updateButton).css("display", "inline");
            $(commentContent).css("display", "inline");
            $("#cmtPasswordInput").val("");

            $(commentTextarea).removeAttr("id", "edit-active");
        }

        function onDeleteComment(id, pw) {
            const body = { answerId: Number(id), password: pw };
            console.log(body);
            $.ajax({
                url: "/commentDeleteAction",
                type: "post",
                dataType: "json",
                processData: true,
                cache: false,
                data: body,
                success: function (response) {
                    if (response.success) {
                        const form = $("#frm")[0];
                        $("#bbsId").val();
                        form.action = "/update";
                        form.submit();
                        $("#cmtDeletePasswordInput").val('');
                    } else {
                        alert("ERROR Message : " + response.message);
                    }
                },
                error: function (xhr, error) {
                    alert("댓글을 삭제할 수 없습니다.");
                    $("#cmtDeletePasswordInput").val('');
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
                $("#passwordInput").val("");
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $("#updateConfirmBtn").click(function () {
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
                    $("#passwordInput").val("");
                }
            });

            // delete
            $("#deleteModalBtn").click(function () {
                $("#deleteModal").css("display", "block");
            });

            // 모달 창 닫기
            $(".close").click(function () {
                $("#deleteModal").css("display", "none");
                $("#deletePasswordInput").val("");
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $("#deleteConfirmBtn").click(function () {
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
                    $("#deletePasswordInput").val("");
                }
            });

            // comment
            // 모달 창 닫기
            $(".close").click(function () {
                $("#cmtPasswordModal").css("display", "none");
                $("#cmtPasswordInput").val("");
            });

            // 모달 창 바깥 클릭 시 닫기
            $(window).click(function (event) {
                if (event.target.id === "cmtPasswordModal") {
                    $("#cmtPasswordModal").css("display", "none");
                    $("#cmtPasswordInput").val("");
                }
            });

            // delete

            // 모달 창 닫기
            $(".close").click(function () {
                $("#cmtDeleteModal").css("display", "none");
                $("#cmtDeletePasswordInput").val("");
            });

            // 모달 창 바깥 클릭 시 닫기
            $(window).click(function (event) {
                if (event.target.id === "cmtDeleteModal") {
                    $("#cmtDeleteModal").css("display", "none");
                    $("#cmtDeletePasswordInput").val("");
                }
            });

            // 비밀번호 확인 버튼 클릭 이벤트
            $("#cmtUpdateConfirmBtn").click(function () {
                const passwordInput = $("#cmtPasswordInput").val();
                if (passwordInput.trim() === "") {
                    alert("비밀번호를 입력해주세요.");
                } else {
                    $("#cmtPasswordModal").css("display", "none");
                    onUpdateComment($("#commentNumber").val(), passwordInput);
                    $("#commentNumber").remove();
                }
            });

            // 삭제 비밀번호 확인 버튼 클릭 이벤트
            $("#cmtDeleteConfirmBtn").click(function () {
                const passwordInput = $("#cmtDeletePasswordInput").val();
                // 받아올 데이터 "1" 부분에 입력
                if (passwordInput.trim() === "") {
                    alert("비밀번호를 입력해주세요.");
                } else {
                    $("#cmtDeleteModal").css("display", "none");
                    onDeleteComment($("#commentNumber").val(), passwordInput);
                    $("#commentNumber").remove();
                }
            });
        });

        // 수정 모달 클릭
        function onUpdateCommentModal(id) {
            const commentTextarea = "#comment-box-" + id;
            $(commentTextarea).append("<input id='commentNumber' type='hidden' value='" + id + "' />");
            if ($("#edit-active").length > 0) {
                alert("한번에 두가지 댓글 수정불가");
                return;
            } else {
                $("#cmtPasswordModal").css("display", "block");
            }
        }

        // 수정 삭제 클릭
        function onDeleteCommentModal(id) {
            const commentTextarea = "#comment-box-" + id;
            $(commentTextarea).append("<input id='commentNumber' type='hidden' value='" + id + "' />");

            $("#cmtDeleteModal").css("display", "block");
        }
    </script>
</html>
