Page({

    /**
     * 页面的初始数据
     */
    data: {
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        var t = this;
        wx.request({
            url: getApp().data.api.url('/weapp/user/info'),
            data: {
                openid: getApp().data.user['openid']
            },
            success: function(result) {
                for (var index in result.data.shop) {
                    result.data.shop[index].type = 1;
                }
                result.data.shop.push({name: '加入他人店铺', type: 2});
                t.setData(result.data);
            },
        })
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    },

	selectedItem: function(e) {
		wx.navigateTo({
			url: '/pages/user/index',
		})
	},

	selectedHelp: function(e) {
		getApp().toHelp();
	}

})