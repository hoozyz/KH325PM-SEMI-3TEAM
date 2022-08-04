package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class test {
	public static void main(String[] args) {
		String test = "b석 5원, c석 50원, ㅇㅇㅇㅇ A석 10,000원";
		test = test.replace("원", "");
		int result = 0;
		List<Integer> list = new ArrayList<>();
		while(true) {
			list.add(test.indexOf("석", result)); // 1
			result = test.indexOf("석", result) + 1;
			
			if(test.indexOf("석", result) == -1) {
				break;
			}
		}
		
		result = list.size();
		
		String[] testArr = new String[result];
		String[] testArr1 = new String[result];
		Map<String, String> map = new HashMap<>();
		
		if(result == 1) {
			testArr = test.split(" "); 
			for(int i = 0; i < testArr.length; i++) {
				
				if(testArr.length > 2) {
					for (int j = 0; j < testArr.length; j++) {
						String str1 = testArr[0] + "-" + testArr[1];
						map.put(str1, testArr[2]);
					}
				} else {
					map.put(testArr[0], testArr[1]);
				}
			}
		}
			
		testArr = test.split(", ");
		
		
		for(int i = 0; i < testArr.length; i++) {
			testArr1 = testArr[i].split(" ");
			
			if(testArr1.length > 2) {
				for (int j = 0; j < testArr1.length; j++) {
					String str1 = testArr1[0] + "-" + testArr1[1];
					map.put(str1, testArr1[2]);
				} 
			} else {
				map.put(testArr1[0], testArr1[1]);
			}
		}
		Set<String> seat = map.keySet();
		List<String> seatList = new ArrayList<>(seat);
		
		req.setattribute("seatList", seatList);
		System.out.println(map);
		System.out.println(seatList.get(0)); 
		System.out.println(map.values());
	}
}

$.each(list, (i, obj) => {
	str += '<tr>'
    str += '<td class="td-no">'+obj.board_no +'</td>';
    str += '<td class="td-title"><a href>'+ obj.title +'</a></td>';
    str += '<td class="td-writer">'+obj.user_id +'</td>';
    str += '<td class="td-date">'+obj.date +'</td>';
    str += '<td class="td-count">'+obj.readcount +'</td>';
	str += '</tr>'
});

$('.board-data').html(str);

var maxPage =     list[0].maxPage     ;
var startPage =   list[0].startPage   ;
var endPage =     list[0].endPage     ;
var currentPage   list[0].currentPage ;
var prevPage =    list[0].prevPage    ;
var nextPage =    list[0].nextPage    ;
var startList =   list[0].startList   ;
var endList =     list[0].endList     ;  

str = "";

<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>
<a class="page-prev" onclick="goPage(${pageInfo.getPrevPage()}); return false;"><i class="fi-chevron-left align-middle"></i></a>
<c:forEach var="pageNum" begin="${pageInfo.getStartPage()}" end="${pageInfo.getEndPage()}">
	<a class="page${currentPage eq pageNum ? '-on' : ''}" id="page${pageNum}" onclick="goPage(${pageNum}); return false;">${pageNum}</a>
</c:forEach>
<a class="page-next" onclick="goPage(${pageInfo.getNextPage()}); return false;"><i class="fi-chevron-right align-middle"></i></a>
<a class="page-end" onclick="goPage(${pageInfo.getMaxPage()}); return false;"><i class="fi-chevrons-right align-middle"></i></a>

if(currentPage != 1) {
	str += '<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>';
	str += '<a class="page-prev" onclick="goPage('+ list.prevPage +'); return false;"><i class="fi-chevron-left align-middle"></i></a>';
}

for (var i = 1; i <= endpage; i++) {
	if(i == currentPage) {
		str += '<a class="page-on" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
	} else {
		str += '<a class="page" id="page'+ i +'" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
	}
}

if(currentPage != maxPage) {
	str += '<a class="page-next" onclick="goPage('+ list.nextPage +'); return false;"><i class="fi-chevron-right align-middle"></i></a>';
	str += '<a class="page-end" onclick="goPage('+ list.maxPage +'); return false;"><i class="fi-chevrons-right align-middle"></i></a>';
}
