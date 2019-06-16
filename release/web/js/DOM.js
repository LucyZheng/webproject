//MainPage
class MainPage{
    constructor(){
        this.title = document.querySelector("title").innerText;
        this.desc = document.querySelector("meta[name=description]").content;
        this.articleList = document.querySelector(".article-list");
        this.btnMore = document.getElementById("moreclick");
	    this.btnMore.addEventListener("click", this.loadMore, false);
        // 分享模块
        let imgs = document.querySelectorAll("#container .content>aside .shareclick img");
        for (let i = 0; i < imgs.length; i++) {
            imgs[i].addEventListener("click", function() {
                MainPage().goShare(this.alt);
            }, false);
        }
    }

    //获取更多日志
    loadMore(){
        //TODO:Use requestHTML to acquire content
		let artstr =
			'<article class="all-article" id="next">\
								<header>\
									<div class="sign">\
										<span id="sign2">转载</span>\
										<div></div>\
									</div>\
									<h3><a href="#">二营长，来碗意大利面</a></h3>\
								</header>\
								<section>\
									<img src="img/lengtu.jpg" id="tinyimage">\
									<div class="tiny-article">\
										意大利面真好吃。\
									</div>\
								</section>\
								<footer>\
									<img src="img/time_gray.png" /> 2019-6-13 22:00\
									<img src="img/eye_gray.png" /> 22\
									<img src="img/comment_gray.png" /> <span class="comment-count">6</span>\
									<img src="img/fabulous_gray.png" /> <span class="fabulous-count">5</span>\
								</footer>\
							</article>';
		this.articleList.insertAdjacentHTML("afterend", artstr);
    }

    goShare(s){
        //qq空间接口
        if (s === 'qzone')
            window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + document.location.href +
                '?sharesource=qzone&title=' + this.title + '&summary=' + this.desc);
        if (s === 'sina')
            window.open('http://service.weibo.com/share/share.php?url=' + document.location.href + '?sharesource=weibo&title=' +
                this.title);
        if (s === 'qq')
            window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + document.location.href +
                '?sharesource=qzone&title=' + this.title + '&summary=' + this.desc);
    }
}