var url ='http://www.pro-football-reference.com/years/2013/games.htm';
 
// Start a PhantomJS "page" and point it to the desired URL.
var page = require('webpage').create();
page.open(url, function(status) {
 
    if (status === 'success') {
        var html = page.evaluate(function() {
	    table2csv('games');
            return document.getElementById('div_games').textContent;//documentElement.outerHTML;
        });
 
        console.log(html);
    }

    phantom.exit();
});
