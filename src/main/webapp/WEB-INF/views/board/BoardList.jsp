<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false"%>
<html>
  <head>
    <title>게시판만들기</title>
    <link rel="stylesheet" href="resources/css/common.css" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  </head>
  <body>
    <div class="container">
      <Header class="header">
        <h1>게시판</h1>
        <button type="button" class="write" onclick="location.href='write'">
          <span>글쓰기</span>
        </button>
      </Header>
      <hr />
      <div class="board_main">
        <ul class="board_container bold">
          <li class="board_context_number">번호</li>
          <li class="board_context_title">제목</li>
          <li class="board_context_writer">작성자</li>
          <li class="board_context_date">작성일</li>
          <li class="board_context_count">조회수</li>
        </ul>
        <hr />
        <form id="frm" name="frm" method="post">
          <input type="hidden" id="bbsId" name="bbsId" />
          <c:forEach var="board" items="${selectBoard}" varStatus="status">
            <article class="board_context_wrapper">
              <ul class="board_context">
                <li class="board_context_number"><c:out value="${board.rownum}" /></li>
                <li class="board_context_title">
                  <button class="board_context_button" onclick='onUpdate(<c:out value="${board.bbsId}" />)'><c:out value="${board.bbsSj}" /></button>
                </li>
                <li class="board_context_writer"><c:out value="${board.wrter}" /></li>
                <li class="board_context_date"><c:out value="${board.writngDt.substring(0,10)}" /></li>
                <li class="board_context_count"><c:out value="${board.rdcnt}" /></li>
              </ul>
            </article>
            <hr class="article_hr" />
          </c:forEach>
        </form>
        <div class="board_page">
          <button class="board_page_button">
            <span class="board_page_num">1</span>
          </button>
          <button class="board_page_button">
            <span class="board_page_num">2</span>
          </button>
          <button class="board_page_button">
            <span class="board_page_num">3</span>
          </button>
        </div>
      </div>
    </div>
  </body>
  <script>

    const userId = $("#bbsId")
    const form = $("#frm")[0]

    function onUpdate(id) {
      userId.val(id);
      console.log(userId.val());
      console.log(form)
      form.action = '/update';
      form.submit();
    }

  </script>
</html>
