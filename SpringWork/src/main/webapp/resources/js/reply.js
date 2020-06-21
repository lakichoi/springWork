/**
 * 
 */
console.log("Reply Module....");
var replyService = (function() {
	
	function rnoCount(param, callback, error){
		var bno = param.bno;
		$.get("/replies/count/"+bno+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getList(param, callback, error) {
		var bno = param.bno;
		$.getJSON("/replies/bno/" + bno + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});// fail END
	}// getList END

	function add(reply, callback, error) {
		console.log("add reply.....");
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=urf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},// success End
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}// error End
		}); // ajax End
	}// add END

	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},// callback END
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}// error END
		});
	}// remove END

	function update(reply, callback, error) {
		console.log("rno: " + reply.rno);
		var rno = reply.rno;
		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},//success END
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}//error END
		});
	}// update END
	
	function get(rno, callback, error){
		$.get("/replies/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime()-timeValue;
		var dateObj = new Date(timeValue);
		var str="";
		
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh>9? '':'0') + hh, ':', (mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+ 1;
			var dd = dateObj.getDate();
			
			return[	yy,'/',(mm>9?'':'0')+mm, '/',(dd>9?'':'0')+dd].join('');
		}
		
	}
	;
	return {
		getList : getList,
		add : add,
		remove : remove,
		update : update,
		get : get,
		displayTime:displayTime
	};

})();