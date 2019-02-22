Page({

    /**
     * 页面的初始数据
     */
    data: {
		countList: [
			{count: 1, name: '商品款数'},
			{count: 1, name: '商品款数'},
			{count: 1, name: '商品款数'},
			{count: 1, name: '商品款数'}
		],
		menuList: [
      { image: 'https://xiaodianku.equantao.com/static/images/icon/AddGoods.png', name: '手动录入'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/ScanAdd.png', name: '单件入库'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/ScanDec.png', name: '单件出库'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/MassAdd.png', name: '批量入库'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/MassDec.png', name: '批量出库'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/Remark.png', name: '备注记录'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/Inventory.png', name: '查看库存'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/History.png', name: '出入库汇总'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/Export.png', name: '导出库存'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/shopcode.png', name: '邀请成员'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/Share.png', name: '分享给好友'},
      { image: 'https://xiaodianku.equantao.com/static/images/icon/Feedback.png', name: '使用反馈'}
		]
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

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

	selectedHelp: function() {
		getApp().toHelp();
	},

	selectedMenu: function(event) {
		var item = event.currentTarget.dataset.item;
		if (item.name != '使用反馈') {
			return;
		}
		wx.navigateTo({
			url: '/pages/issue/index?hello=world',
		});
	}

})