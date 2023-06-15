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
                <button class="write" type="button" onclick="location.href='write'">
                    <span>글쓰기</span>
                </button>
            </Header>
            <hr class="article_hr" />
            <div style="justify-content: space-between; margin-top: 10px" class="board_search-select">
                <div>조회결과: 0건</div>
                <select name="board_search-select">
                    <option value="">출력 선택</option>
                    <option value="작성자">5개</option>
                    <option value="제목">10개</option>
                    <option value="내용">20개</option>
                </select>
            </div>
            <hr class="article_hr" />
            <section class="board_main">
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
                                    <button
                                        class="board_context_button"
                                        type="button"
                                        onclick='onUpdate(<c:out value="${board.bbsId}" />)'
                                    >
                                        <c:out value="${board.bbsSj}" />
                                    </button>
                                </li>
                                <li class="board_context_writer"><c:out value="${board.wrter}" /></li>
                                <li class="board_context_date"><c:out value="${board.writngDt.substring(0,10)}" /></li>
                                <li class="board_context_count"><c:out value="${board.rdcnt}" /></li>
                            </ul>
                        </article>
                        <hr class="article_hr" />
                    </c:forEach>
                    <div style="width: 100%">
                        <div class="board_search-container">
                            <div class="board_search-select">
                                <select id="board_search-select" name="searchSelect">
                                    <option value="writer">작성자</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <input
                                    class="board_search-input"
                                    name="searchWriter"
                                    type="text"
                                    value='<c:out value="${searchWritten}" />'
                                    placeholder="검색어를 입력하세요"
                                />
                                <button class="board_search-submit" type="button"><span> 검색 </span></button>
                            </div>
                            <div class="board_search-date">
                                <p>작성 기간</p>
                                <input class="search-date-input" type="text" placeholder="날짜를 선택하세요" />
                                <span>&nbsp; ~ &nbsp;</span>
                                <input class="search-date-input" type="text" placeholder="ex: 2023-06-11" />
                            </div>
                        </div>
                    </div>
                    <div class="board_page">
                        <button class="board_page_button" type="button">
                            <span class="board_page_num">1</span>
                        </button>
                        <button class="board_page_button" type="button">
                            <span class="board_page_num">2</span>
                        </button>
                        <button class="board_page_button" type="button">
                            <span class="board_page_num">3</span>
                        </button>
                    </div>
                </form>
            </section>
        </div>
    </body>
    <script>
      // Focus가 처음 Load될 때만 잡히게 하기
        const userId = $("#bbsId");
        const form = $("#frm")[0];
        const searchInput = $(".board_search-input");
        const searchSubmit = $(".board_search-submit");
        const searchSelect = $(".board_search-select");

        searchSubmit.click(function () {
            onSearchSubmit();
        });
        
        searchInput.keyup(function (e) {
            e.preventDefault();
            if (e.key === "Enter") {
                onSearchSubmit();
            }
        });

        function onSearchSubmit() {
            console.log(searchSelect.val("writer").prop("selected", true));
            if (searchInput.val().trim() === "") {
                alert("검색어를 입력해주세요.");
                searchInput.focus();
                return;
            }
            userId.val(0);
            form.action = "/";
            form.submit();
        }

        function onUpdate(id) {
            userId.val(id);
            form.action = "/update";
            form.submit();
        }
    </script>
</html>
