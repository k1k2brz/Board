<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false"%>
<html>
    <head>
        <title>게시판만들기</title>
        <link rel="stylesheet" href="resources/css/common.css" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"
            integrity="sha512-57oZ/vW8ANMjR/KQ6Be9v/+/h6bq9/l3f0Oc7vn6qMqyhvPd1cvKBRWWpzu0QoneImqr2SkmO4MSqU+RpHom3Q=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/themes/base/jquery-ui.min.css"
            integrity="sha512-ELV+xyi8IhEApPS/pSj66+Jiw+sOT1Mqkzlh8ExXihe4zfqbWkxPRi8wptXIO9g73FSlhmquFlUOuMSoXz5IRw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
    </head>
    <body>
        <div class="container">
            <Header class="header">
                <h1 onclick="location.href='/'" style="cursor: pointer">게시판</h1>
                <button class="write" type="button" onclick="location.href='write'">
                    <span>글쓰기</span>
                </button>
            </Header>
            <hr class="article_hr" />
            <section class="board_main">
                <form id="frm" name="frm" method="post">
                    <div style="justify-content: space-between; margin-top: 10px" class="board_search-select">
                        <div>조회결과: <c:out value="${searchCount}" /></div>
                        <select id="pageCount" name="pageCount" onchange="onChangePageCount()">
                            <option value="5" <c:if test="${pagination.pageCount == 5}" >selected</c:if>>5개</option>
                            <option value="10" <c:if test="${pagination.pageCount == 10}" >selected</c:if>>10개</option>
                            <option value="20" <c:if test="${pagination.pageCount == 20}" >selected</c:if>>20개</option>
                        </select>
                    </div>
                    <hr class="article_hr" />
                    <ul class="board_container bold">
                        <li class="board_context_number">번호</li>
                        <li class="board_context_title">제목</li>
                        <li class="board_context_writer">작성자</li>
                        <li class="board_context_date">작성일</li>
                        <li class="board_context_count">조회수</li>
                    </ul>
                    <hr />
                    <input type="hidden" id="bbsId" name="bbsId" />
                    <div class="board_context_container">
                        <c:forEach var="board" items="${selectBoard}" varStatus="status">
                            <article class="board_context_wrapper">
                                <ul class="board_context">
                                    <li class="board_context_number"><c:out value="${board.rn}" /></li>
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
                    </div>
                    <div style="width: 100%">
                        <div class="board_search-container">
                            <div class="board_search-select">
                                <select id="board_search-select" name="searchSelect">
                                    <option value="writer" <c:if test="${searchBoard.searchSelect == 'writer'}">selected</c:if>>작성자</option>
                                    <option value="title" <c:if test="${searchBoard.searchSelect == 'title'}">selected</c:if>>제목</option>
                                    <option value="content" <c:if test="${searchBoard.searchSelect == 'content'}">selected</c:if>>내용</option>
                                </select>
                                <input
                                    class="board_search-input"
                                    name="searchWriter"
                                    type="text"
                                    value='<c:out value="${searchBoard.searchWriter}" />'
                                    placeholder="검색어를 입력하세요"
                                />
                                <button class="board_search-submit" type="button"><span> 검색 </span></button>
                            </div>
                            <div class="board_search-date">
                                <p>작성 기간</p>
                                <input
                                    class="search-date-input datepicker"
                                    type="text"
                                    name="searchDateL"
                                    placeholder="날짜를 선택하세요"
                                    value='<c:out value="${searchBoard.searchDateL}" />'
                                    readonly
                                    autocomplete="off"
                                />
                                <span>&nbsp; ~ &nbsp;</span>
                                <input
                                    class="search-date-input datepicker"
                                    type="text"
                                    name="searchDateR"
                                    placeholder="ex: 2023-06-11"
                                    value='<c:out value="${searchBoard.searchDateR}" />'
                                    readonly
                                    autocomplete="off"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="board_page">
                        <button class="board_page_prev bi-icon" type="button" onClick='onPageMove(1)' <c:if test="${pagination.currPage <= 1}">disabled</c:if>>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 256 512">
                                    <path d="M9.4 278.6c-12.5-12.5-12.5-32.8 0-45.3l128-128c9.2-9.2 22.9-11.9 34.9-6.9s19.8 16.6 19.8 29.6l0 256c0 12.9-7.8 24.6-19.8 29.6s-25.7 2.2-34.9-6.9l-128-128z"/>
                                </svg>
                            </div>
                        </button>
                        <button class="board_page_prev bi-icon" type="button" onClick='onPageMove(<c:out value="${pagination.prevPage}" />)' <c:if test="${pagination.currPage <= 1}">disabled</c:if>>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512">    
                                    <path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/>
                                </svg>
                            </div>
                        </button>
                        <c:forEach var="page" begin="${pagination.firstPage}" end="${pagination.lastPage}" step="1" varStatus="status">
                            <c:choose>
                                <c:when test="${page eq pagination.currPage}">
                                    <button class="board_page_button curr" type="button" onClick='onPageNumber(<c:out value="${page}" />)'>
                                        <span class="board_page_num"><c:out value="${page}" /></span>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button class="board_page_button" type="button" onClick='onPageNumber(<c:out value="${page}" />)'>
                                        <span class="board_page_num"><c:out value="${page}" /></span>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <button class="board_page_prev bi-icon" type="button" onClick='onPageMove(<c:out value="${pagination.nextPage}" />)' <c:if test="${pagination.currPage >= pagination.lastPage}">disabled</c:if>>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512">
                                    <path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                                </svg>
                            </div>
                        </button>
                        <button class="board_page_prev bi-icon" type="button" onClick='onPageMove(<c:out value="${pagination.pageSize}" />)' <c:if test="${pagination.currPage >= pagination.pageSize}">disabled</c:if>>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 256 512">
                                    <path d="M246.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-9.2-9.2-22.9-11.9-34.9-6.9s-19.8 16.6-19.8 29.6l0 256c0 12.9 7.8 24.6 19.8 29.6s25.7 2.2 34.9-6.9l128-128z"/>
                                </svg>
                            </div>
                        </button>
                    </div>
                    <input type="hidden" id="currPage" name="currPage" />
                </form>
            </section>
        </div>
    </body>
    <script>
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

        // 검색
        function onSearchSubmit() {
            if (searchInput.val().trim() === "") {
                alert("검색어를 입력해주세요.");
                searchInput.focus();
                return;
            }
            $("#currPage").val(1);
            userId.val(0);
            form.action = "/";
            form.submit();
        }

        // Page 출력 개수
        function onChangePageCount() {
            $("#pageCount").val();
            $("#currPage").val(0);
            userId.val(0);
            form.action = "/";
            form.submit();
        }

        // 게시글 클릭
        function onUpdate(id) {
            userId.val(id);
            $("#currPage").val(0);
            form.action = "/update";
            form.submit();
        }

        // 페이지네이션
        function onPageNumber(page) {
            $("#pageCount").val()
            $("#currPage").val(page);
            userId.val(0);
            form.action = "/";
            form.submit();
        }

        // Prev, Next
        function onPageMove(page) {
            $("#pageCount").val()
            $("#currPage").val(page);
            userId.val(0);
            form.action = "/";
            form.submit();
        }

        // 달력
        $(function () {
            $(".datepicker").datepicker({
                changeMonth: true, //select box로 월 표시
                changeYear: true, //select box로 년 표시
                minDate: "-100y", //최소 선택일자 // -1D:하루전, -1M:한달전, -1Y:일년전
                maxDate: new Date(), //최대 선택일자
                nextText: "다음 달", //next 아이콘 툴팁
                prevText: "이전 달", //prev 아이콘 툴팁
                numberOfMonths: [1, 1],
                stepMonths: 1, //이전, 이후 달 선택 시 한번에 이동할 개월 수
                yearRange: "c-22:c+10", // 연도 범위 설정
                showButtonPanel: true,
                currentText: "오늘 날짜", //’오늘 날짜’ 클릭시 오늘 날짜로 이동
                closeText: "닫기", //close text
                dateFormat: "yy-mm-dd", //input에 표출되는 날짜 형식 지정
                showMonthAfterYear: true, //월, 년 순서의 select box를 년, 월 순서로 변경
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"], //요일 부분 설정
                monthNamesShort: [
                    "1월",
                    "2월",
                    "3월",
                    "4월",
                    "5월",
                    "6월",
                    "7월",
                    "8월",
                    "9월",
                    "10월",
                    "11월",
                    "12월",
                ],
            });
        });
    </script>
</html>
