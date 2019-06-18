import {getHTML} from "./htmlResolver.js";
//MainPage
export class MainPage{
    constructor(){
        this.title = document.querySelector("title").innerText;
        this.desc = document.querySelector("meta[name=description]").content;
        this.articleList = document.querySelector(".article-list");
        this.articleCount = parseInt(document.getElementById("blog-count").textContent);
        this.btnMore = document.getElementById("moreclick");
	    this.btnMore.addEventListener("click", this.loadMore.bind(this), false);
        // 分享模块
        let imgs = document.querySelectorAll("#container .content>aside .shareclick img");
        for (let i = 0; i < imgs.length; i++) {
            imgs[i].addEventListener("click", () => {
                this.goShare(imgs[i].alt);
            }, false);
        }
    }

    //获取更多日志
    loadMore(){
        let params = {
            "mode": 1,
            "from": this.articleCount,
            "count": 4
        };
		getHTML(this,'/template/mainpage_article_list.jsp', params, (data) => {
		    if (null == data || "" == data.trim()){
		        this.btnMore.innerText = "没有更多的博客了";
		        this.btnMore.disabled = true;
            }
		    else {
                this.articleList.insertAdjacentHTML("afterend", data);
                this.articleCount += 4;
            }
        });

    }

    //搜索日志
    search(topic){
        let params = {
            "mode": 2,
            "topic": topic
        };
        getHTML(this, '/template/mainpage_article_list.jsp', params, (data) => {
            this.articleList.innerHTML = data;
        })
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
