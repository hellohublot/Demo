import React, { Component } from 'react'
import { View, Text, Image, FlatList, StyleSheet, Animated, Easing, TouchableOpacity } from 'react-native'
import NavigationBar from '~/common/navigation/NavigationBar'
import LinearGradient from 'react-native-linear-gradient'
import HTRequest from '~/common/request/HTRequest'

import HTMenuPage from '~/page/menu/common/HTMenuPage'
import HTUserPage from '~/page/user/common/HTUserPage'

export default class HTIndexPage extends Component {

	static navigationOptions = {
		header: null
	}

	constructor(props) {
		super(props)
		this.state = {
			data: [],
			menuPageLeft: new Animated.Value(0),
			userPageRight: new Animated.Value(0),
		}
	}

	componentWillMount() {
		this._requestArticleList(true)
	}

	_requestArticleList = (headerRefresh) => {
		let [ lastItem, ...otherList ] = [ ...this.state?.data ].reverse()
		let pageId = lastItem?.id
		let createTime = lastItem?.create_time
		if (headerRefresh) {
			pageId = 0
			createTime = 0
		}
		let url = `http://203.195.230.211/index.php?m=Home&c=Api2&a=getList&p=1&show_sdv=1&page_id=${pageId}&create_time=${createTime}`
		HTRequest(url, {
			requestType: 'getList'
		})
		.then((response) => response.json())
		.then((response) => {
			if (((response?.datas?.length || 0) <= 0)) {
				return
			}
			let itemList = response.datas
			if (!headerRefresh) {
				itemList = this.state.data.concat(itemList)
			}
			this.setState({ data: itemList})
		})
	}

	_pageAnimation = (key, value, complete) => {
		Animated.timing(key, {
			toValue: value,
			duration: 700,
			easing: Easing.inOut(Easing.ease),
		}).start(complete)
	}

	_menuButtonDidTouch = () => {
		this.menuPage.showPageBegin()
		this._pageAnimation(this.state.menuPageLeft, SCREEN_WIDTH, () => {
			this.menuPage.showPageEnd()
		})
	}

	_menuExitDidTouch = () => {
		this._pageAnimation(this.state.menuPageLeft, 0)
		this.menuPage.hiddenPageBegin()
	}

	_userButtonDidTouch = () => {
		this.userPage.showPageBegin()
		this._pageAnimation(this.state.userPageRight, SCREEN_WIDTH, () => {
			this.userPage.showPageEnd()
		})
	}

	_userExitDidTouch = () => {
		this._pageAnimation(this.state.userPageRight, 0)
		this.userPage.hiddenPageBegin()
	}

	_renderItem = (item, index) => {
		return (
			<View style={styleList.itemContainer}>
				<Image style={styleList.itemImage} source={{uri: item.thumbnail}} />
				<View style={styleList.itemTypeSeparator}></View>
				<View style={styleList.itemTypeTitleContainer}>
					<Text style={styleList.itemTypeTitle}>{item.category}</Text>
				</View>
				<Text style={styleList.itemTitle}>{item.title}</Text>
				<View style={styleList.itemDetailContainer}>
					<Text style={styleList.itemDetail}>{item.excerpt}</Text>
				</View>
				<View style={styleList.itemSeparator}></View>
				<Text style={styleList.itemAuthor}>{item.author}</Text>
				<View style={styleList.itemCountContainer}>
					<Image style={styleList.itemReplyImage} source={require('~/resource/img/index_article_reply.png')} />
					<Text style={styleList.itemReplyTitle}>{item.comment}</Text>
					<Image style={styleList.itemLikeImage} source={require('~/resource/img/index_article_like.png')} />
					<Text style={styleList.itemLikeTitle}>{item.good}</Text>
					<View style={CONTAINER}></View>
					<Text style={styleList.itemReadTitle}>{`阅读数 ${item.view}`}</Text>
				</View>
			</View>
		)
	}

	_renderDrawerPage = () => {
		return (
			<View
				pointerEvents={'box-none'}
				style={styleList.drawerPageContainer}
			>
				<Animated.View style={[styleList.menuPageContainer, { left: this.state.menuPageLeft }]}>
					<HTMenuPage ref={(ref) => this.menuPage = ref} exitButtonTouch={() => this._menuExitDidTouch()} />
				</Animated.View>
				<Animated.View style={[styleList.userPageContainer, { right: this.state.userPageRight }]}>
					<HTUserPage ref={(ref) => this.userPage = ref} exitButtonTouch={() => this._userExitDidTouch()} />
				</Animated.View>
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
				<NavigationBar 
					backgroundView={(
						<LinearGradient style={styleList.navigationBarBackgroundView} colors={['rgba(0, 0, 0, 0.5)', 'rgba(0, 0, 0, 0)']}>
						</LinearGradient>
					)}
					float={true} 
					title='单 读'
					leftItemList={[
						<TouchableOpacity activeOpacity={0.7} onPress={() => this._menuButtonDidTouch()}>
							<Image source={require('~/resource/img/index_navigation_menu.png')} />
						</TouchableOpacity>
					]}
					rightItemList={[
						<TouchableOpacity activeOpacity={0.7} onPress={() => this._userButtonDidTouch()}>
							<Image source={require('~/resource/img/index_navigation_user.png')} />
						</TouchableOpacity>
					]}
				>
				</NavigationBar>
				<FlatList
					style={styleList.itemListContainer}
					pagingEnabled={true}
					keyExtractor={(item, index) => `${index}`}
					data={this.state.data}
					renderItem={({item, index}) => this._renderItem(item, index)}
					onRefresh={ () => this._requestArticleList(true) }
		            refreshing={ false }
		            onEndReached={ () => this._requestArticleList(false) }
		            onEndReachedThreshold={0.1}
				/>
				{
					this._renderDrawerPage()
				}
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	navigationBarBackgroundView: {
		width: '100%', 
		height: '100%'
	},
	itemListContainer: {
		backgroundColor: 'rgb(33, 33, 33)',
	},
	itemContainer: {
		backgroundColor: 'white',
		height: SCREEN_HEIGHT,
		alignItems: 'center',
	},
	itemImage: {
		width: '100%',
		height: 270,
		resizeMode: 'cover',
	},
	itemTypeSeparator: {
		height: 2,
		width: '100%',
		backgroundColor: '#AE8954',
	},
	itemTypeTitleContainer: {
		justifyContent: 'center',
		alignItems: 'center',
		paddingTop: 2,
		paddingBottom: 2,
		paddingLeft: 25,
		paddingRight: 25,
		backgroundColor: '#AE8954',
	},
	itemTypeTitle: {
		fontSize: 12,
		color: 'white',
	},
	itemTitle: {
		fontSize: 34,
		color: '#000',
		marginTop: 40,
		textAlign: 'center',
		paddingLeft: 20,
		paddingRight: 20,
	},
	itemDetailContainer: {
		flex: 1,
		alignItems: 'center',
		justifyContent: 'center',
		paddingLeft: 20,
		paddingRight: 20,
		paddingBottom: 20,
	},
	itemDetail: {
		fontSize: 16,
		color: '#000',
		lineHeight: 24,
	},
	itemSeparator: {
		backgroundColor: '#eee',
		height: 0.5,
		width: '60%',
	},
	itemAuthor: {
		fontSize: 19,
		color: '#000',
		marginTop: 20,
	},
	itemCountContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginTop: 30,
		marginBottom: 20,
		paddingLeft: 15,
		paddingRight: 15,
	},
	itemReplyTitle: {
		marginLeft: 5,
		marginRight: 20,
		fontSize: 10,
	},
	itemLikeTitle: {
		marginLeft: 5,
		fontSize: 10
	},
	itemReadTitle: {
		fontSize: 11,
	},
	drawerPageContainer: {
		position: 'absolute',
		top: 0,
		bottom: 0,
		left: -SCREEN_WIDTH,
		width: '300%',
		zIndex: 999,
	},
	menuPageContainer: {
		position: 'absolute',
		top: 0,
		bottom: 0,
		width: SCREEN_WIDTH,
	},
	userPageContainer: {
		position: 'absolute',
		top: 0,
		bottom: 0,
		width: SCREEN_WIDTH,
	},


})