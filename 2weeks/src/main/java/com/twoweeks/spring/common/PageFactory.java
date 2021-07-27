package com.twoweeks.spring.common;

public class PageFactory {

	public static String getPageBar(int totalData, int cPage, int numPerpage, String url) {
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarsize=5;
		int pageNo=((cPage-1)/pageBarsize)*pageBarsize+1;
		int pageEnd=pageNo+pageBarsize-1;
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {			
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.assign('"+url+"?cPage='+cPage);}";
		pageBar+="</script>";
		
		
		return pageBar;
	}
}
