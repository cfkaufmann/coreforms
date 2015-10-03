<cfscript>

		
	function currentdate(){
		datetime = #dateformat(now(), "YYYY-MM-DD")#;
		return datetime;
		}
	function currentdatetime(){
		datetime = #dateformat(now(), "YYYY-MM-DD")# & ' ' & #timeformat(now(), "HH:MM:SS")#;
		return datetime;
		}
		
	/**
 	* Allows people to enter time without colon
 	*/
	function checktime(time){
		if (listlen(time, ":") is 2) {
			cleantime = time;
		} else{
			if (len(time) is 3){
				cleantime = left(time, 1) & ':' & right(time,2);
			} else {
				cleantime = left(time, 2) & ':' & right(time,2);
			}
		}
	return cleantime;
	}
	
/**
* Will take a number returned from a File.Filesize, calculate the number in terms of Bytes/Kilobytes/Megabytes and return the result.
* v2 by Haikal Saadh
*
* @param number   Size in bytes of the file. (Required)
* @return Returns a string.
* @author Kyle Morgan (&#97;&#100;&#109;&#105;&#110;&#64;&#107;&#121;&#108;&#101;&#109;&#111;&#114;&#103;&#97;&#110;&#46;&#99;&#111;&#109;)
* @version 2, August 7, 2006
*/

function fncFileSize(size) {
      if ((size gte 1024) and (size lt 1048576)) {
             return round(size / 1024) & "KB";
      } else if (size gte 1048576 and size lt 1073741824) {
             return decimalFormat(size/1048576) & "MB";
	  } else if (size gte 1073741824 and size lt 1099511627776) {
             return decimalFormat(size/1073741824) & "GB";
      } else {
             return "#size# b";
      }
}

/** Cleanup the date before insert **/
function checkdate(date){
		if (isdate(date)){
			cleandate = dateformat(date, "YYYY-MM-DD");
		}
		else{
			cleandate = '';
		}
		return cleandate;
		}
		
function utccurrentdatetime(){
  	utcDate = DateConvert("local2utc", now());
  	datetime = dateformat(utcDate, "YYYY-MM-DD") & ' ' & timeformat(utcDate, "HH:MM:SS");
  	return datetime;
  }
  
function utccurrentdate(){
  	utcDate = #DateConvert("local2utc", now())#;
  	datetime = #dateformat(utcDate, "YYYY-MM-DD")#;
  	return datetime;
  }
  
/** Calculate the hours and minutes between two datetime fields **/	
function hourminutedifference(date1,date2){
		if (isdate(date1) and isdate(date2)){
			
			hourcalculation = datediff("h", #date1#, #date2#);
			minutecalculation = datediff("n", #date1#, #date2#);
			
			leftoverminutes = evaluate(minutecalculation - (hourcalculation * 60));
			cleandate = hourcalculation & ':' & leftoverminutes;		
		}
		else{
			cleandate = '';
		}
		return cleandate;
		}
	
		
/**  Show a date properly formatted  **/
function viewdate(date){
		if (isdate(date)){
			date = dateformat(date, "M/D/YYYY");
		}
		else{
			date = '';
		}
		return date;
		}
	
	/**  Show time properly formatted  **/
	function viewtime(time){
		if (isdate(time)){
			time2 = timeformat(time, "HH:MM");
		}
		else{
			time2 = '';
		}
		return time2;
		}
		
	/**  Show a date and time properly formatted  **/
	function viewdatetime(date){
		if (isdate(date)){
			date2 = dateformat(date, "M/D/YYYY");
			time2 = timeformat(date, "h:mm tt");
			datetime = date2 & ' ' & time2;
		}
		else{
			datetime = '';
		}
		return datetime;
		}


	function viewtime2(time){
		if (isdate(time)){
			time2 = timeformat(time, "h:mm tt");
		}
		else{
			time2 = '';
		}
		return time2;
		}

	function combinedatetime(date,time){
		if (len(trim(time)) gt 0){
			if (listlen(time, ":") is 2) {
				cleantime = time;
			} else{
				if (len(time) is 3){
					cleantime = left(time, 1) & ':' & right(time,2);
				} else {
					cleantime = left(time, 2) & ':' & right(time,2);
				}
			}
		}else {
			cleantime='';
			error=1;
		}
		if (len(trim(date)) gt 0){
			if (isdate(date)){
				cleandate = dateformat(date, "YYYY-MM-DD");
			}else{
				cleandate = '';
				error=1;
			}
		}else {
			cleandate='';
			error=1;
		}
		cleandatetime = cleandate & ' ' & cleantime;
		return cleandatetime;
	
	}		
	
function StripHTML(value) {
			return rereplacenocase(value,"(<[^>]*>)|(&[^[:space:];];)","","all");
		}
	
	
function OddOrEven(num)
		{ var fvar = num/2; if(int(fvar) is fvar){ return "Even"; } else{ return "Odd"; }
	 } 
	 
function isnew(provideddate, xtimespan) {
 	if (abs(datediff("y", dateformat(now(),"MM/DD/YYYY"), dateformat(provideddate, "MM/DD/YYYY"))) lte xtimespan){ 
 	return '<span class="redtxt">New!</span>';
		}
 }

		
	/**
	 * Strips all non-numeric characters from a string.
	 * Modified by RCamden to use one line of code.
	 * 
	 * @param str 	 String to format. (Required)
	 * @return Returns a string. 
	 * @author Mindframe, Inc. (info@mindframe.com) 
	 * @version 1, September 6, 2002 
	 */
	function NumbersOnly(str) {
		return reReplace(str,"[^[:digit:]]","","all");
	}		
/**
 * Fixes an oversight in the jsstringformat() function
 * 
 * @param mystring 	 String to format. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 1, May 9, 2003 
 */
function jsFormat(mystring) {
	return Replace(jsstringformat(mystring),"/","\/","ALL"); 
}

	/**
	 * Allows you to specify the mask you want added to your phone number.
	 * v2 - code optimized by Ray Camden
	 * 
	 * @param varInput 	 Phone number to be formatted. (Required)
	 * @param varMask 	 Mask to use for formatting. x represents a digit. (Required)
	 * @return Returns a string. 
	 * @author Derrick Rapley (adrapley@rapleyzone.com) 
	 * @version 1, November 14, 2002 
	 */
	function PhoneFormat (varInput, varMask) {
		var curPosition = "";
		var newFormat = "";
		var i = "";
		
		newFormat = " " & reReplace(varInput,"[^[:digit:]]","","all");
	
		for (i=1; i lte len(trim(varmask)); i=i+1) {
			curPosition = mid(varMask,i,1);
			if(curPosition neq "x") newFormat = insert(curPosition,newFormat, i) & " ";
		}
	
		return trim(newFormat);
	}
</cfscript>
