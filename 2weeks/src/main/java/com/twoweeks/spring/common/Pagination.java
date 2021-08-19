package com.twoweeks.spring.common;

public class Pagination {
	
	public static String getPageBar(int totalData, int cPage, int numPerpage, String url) {
		String pageBar="<div class='pagination'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarsize=5;
		int pageNo=((cPage-1)/pageBarsize)*pageBarsize+1;
		int pageEnd=pageNo+pageBarsize-1;
		if(pageNo==1) {
			pageBar+="<a class='disable' href='#'>&laquo;</a>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;</a>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<a class='active' href='#'>"+pageNo+"</a>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {			
			pageBar+="<a class='disable' href='#'>&raquo;</a>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'>&raquo;</a>";
		}
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.assign('"+url+"?cPage='+cPage);}";
		pageBar+="</script>";
		pageBar+="<style>";
		pageBar+=".pagination { display: inline-block; font-size: 15px;}";
		pageBar+=".pagination a { color: black; float: left; padding: 8px 16px; text-decoration: none; border-radius:50%; }";
		pageBar+=".pagination a.active { background-color: #989AF5; color: white;}";				
		pageBar+=".pagination .disable {color: gray;}";
		pageBar+=".pagination .disable:hover:not(.active) {background-color: white; font-weight: normal;}";
		pageBar+=".pagination a:hover:not(.active) {background-color: #CCCDFA; font-weight: bolder; }";
		pageBar+="</style>";
		
		
		
		return pageBar;
	}

}
