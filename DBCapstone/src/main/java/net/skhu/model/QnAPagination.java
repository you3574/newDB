package net.skhu.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class QnAPagination {
	
	int QnAcategory;
	String searchWord;
	
	public String getQueryString() {
        String url = null;
        try {
            String temp = (searchWord == null) ? "" : URLEncoder.encode(searchWord, "UTF-8");
            url = String.format("qnacategory=%d&searchWord=%s", QnAcategory , temp);
            //현재페이지와 페이지당 레코드 수를 전달 어떻게 정렬했고 어떤 카테고리로 검색했는지 전달
        } catch (UnsupportedEncodingException e) { }
        return url;
    }
	
	
	public int getQnAcategory() {
		return QnAcategory;
	}


	public void setQnAcategory(int qnAcategory) {
		QnAcategory = qnAcategory;
	}


	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	

}
