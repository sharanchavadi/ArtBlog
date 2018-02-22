var winnerList = [{"season":"1999-02", "team":"milan", "country":"italy"}, 
                  {"season":"2001-02", "team":"porto", "country":"portugal"},
                  {"season":"2003-04", "team":"milan", "country":"italy"}]

function countWins(list,country){
	var count=0;
	list.forEach(function(details){
		if(details.country == country){
			count++;
		}
	});
	return count;
}

console.log(countWins(winnerList,"italy"));