//app.js
App({
    data: {
        api: {
            url: function(url) {
              return 'https://xiaodianku.equantao.com' + url
            }
        },
        user: {
            openid: "oggYF0ZGUatYNThYN6aN1ftcCiF0"
        }
    },
	toHelp: function(e) {
		wx.navigateTo({
			url: '/pages/help/index',
		})
	}
})