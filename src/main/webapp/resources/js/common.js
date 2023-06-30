/**
 * 
 */

//pageSize:한페이지당 게시글 수, pageBlockSize: 한블록당 페이징 개수, totalcnt: 총 게시글 수, currentPage: 현재 페이지, method: 실행할 메소드
	function fn_pagination(pageSize, pageBlockSize, totalcnt, currentPage, method) {
		//페이지네이션 html
		var blockhtml = null;
		
		pageSize = parseInt(pageSize);
		pageBlockSize = parseInt(pageBlockSize);
		totalcnt = parseInt(totalcnt);
		currentPage = parseInt(currentPage);
		
		//총 페이지 개수
		var totalPage =  Math.floor(totalcnt / pageSize)+1;
		
		if (totalPage == 0) {
			totalPage = 1;
		}
		
		
		//지금 페이지의 블럭 시작번호
		var pageStart = Math.floor((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		console.log(pageStart);
		//지금 페이지긔 블럭 끝 번호
		var pageEnd = totalPage<=((pageStart + pageBlockSize) -1)?totalPage:((pageStart + pageBlockSize) -1);
		
		var pre = pageStart == 1?pageStart:(pageStart-pageBlockSize);
		var after = pageEnd == totalPage?pageEnd:(pageStart+pageBlockSize);
	
		
		
		blockhtml = '<div style="display:inline-block; ">';
		
		blockhtml +='<ul class="pager">';
		
		if (pageStart != 1) {
			blockhtml +='<li class="previous"><a href="javascript:'+ method +'('+ pre +')" ><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
		}
		
		
		
		blockhtml += '<ul class="pagination">';
				for(var i=pageStart; i<=totalPage; i++) {
					if(i <= pageEnd) {
						var classs;
						if(currentPage == i) {
							classS = "active"
						}else {
							classS = null;
						}
						blockhtml += '<li class="'+ classS +'"><a href="javascript:'+ method +'('+ i +')"  >'+ i +'</a></li>';
						
					}else {
						break;
					}
					
				}
		blockhtml += '</ul>';
		console.log(totalPage +" "+ pageEnd);
		if(pageEnd != totalPage && totalPage > pageBlockSize) {
			blockhtml +='<li class="next"><a href="javascript:'+ method +'('+ after +')"><span class="glyphicon glyphicon-chevron-right"></span></a></a></li>';
		}
		blockhtml += '</ul>';
		blockhtml += '</div>';
		
		
		return blockhtml;
	}

//Ajax메소드
function fn_callAjax(url,type,async,data,dataType,callback) {
	$.ajax ({
	  // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
	  url	: url, // 요청이 전송될 URL 주소
	  type	: type, // http 요청 방식 (default: ‘GET’)
	  async : async,  // 요청 시 동기화 여부. 기본은 비동기(asynchronous) 요청 (default: true)
	  data  : data, // 요청 시 포함되어질 데이터
	  dataType    : dataType, // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
	  success : function(data) {
		  callback(data);
	  },
	  error	: function() {
	        alert("통신오류")
	  }
	});
}
