import React, { Component } from 'react'
import { View, Text, Image, StyleSheet } from 'react-native'
import { WaterfallList } from 'react-native-largelist-v3'
import NavigationBar from '~/common/navigation/NavigationBar'


export default class HTCommunityPage extends Component {

	static navigationOptions = {
		header: null
	}

	componentWillMount() {
		this._requestCommunityList(true)
	}

	_requestCommunityList = (headerRefresh) => {
		const [ lastItem, ...other ] = [...this.state.list].reverse()
		let lastId = lastItem?.entry._id
		let url = 'https://api.gotokeep.com/feed/v1/feed/list?feedType=hot&needCommentInfo=1&needFavoriteInfo=1&needLikeInfo=1&needRelationInfo=1&sort=byTime'
		if (!headerRefresh && (lastId?.length || 0) > 0) {
			url += `&lastId=${lastId}`
		}
		fetch(url)
		.then((response) => response.json())
		.then((response) => {
			let itemList = response.data.items
			itemList.map((item) => {
				item.height = Math.random() * 150 + 250
				return item
			})
			if (!headerRefresh) {
				itemList = this.state.list.concat(itemList)	
			}
			this.fallList.endRefresh()
			this.fallList.endLoading()
			this.setState({ list: itemList })
		})
	}

	constructor(props) {
		super(props)
		this.state = {
			list: []
		}
	}

	_renderItem = (item, index) => {
		const [ first, ...otherList ] = item.entry.images
		return (
			<View style={styleList.itemContainer}>
				<View style={styleList.itemContent}>
					<Image style={styleList.itemImage} source={{uri: first}} />
					<Text numberOfLines={2} style={styleList.itemTitle}>{item.entry.content}</Text>
					<View style={styleList.itemUserContainer}>
						<Image style={styleList.itemUserImage} source={{uri: item.entry.author?.avatar}} />
						<Text style={styleList.itemUserTitle}>{item.entry.author?.username}</Text>
						<View style={CONTAINER}></View>
						<Text style={styleList.itemLikeTitle}>{item.entry.likes}</Text>
					</View>
				</View>
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
				<NavigationBar title='社区' leftItemList={[
					<Image source={require('~/resource/img/community_navigation_append.png')} />
				]} rightItemList={[
					<Image source={require('~/resource/img/community_navigation_search.png')} />,
					15,
					<Image source={require('~/resource/img/community_navigation_camera.png')} />
				]}></NavigationBar>
				<WaterfallList
					ref={ref => this.fallList = ref}
					style={styleList.fallListContainer}
					showsVerticalScrollIndicator={false}
					data={this.state.list}
					heightForItem={(item) => { return item.height }}
					numColumns={2}
					renderItem={(item, index) => this._renderItem(item, index)}
					onRefresh={() => {
						this._requestCommunityList(true)
					}}
					onLoading={() => {
						this._requestCommunityList(false)
					}}
				/>
			</View>
		)
	}

}
const styleList = StyleSheet.create({
	fallListContainer: {
		paddingLeft: 5,
		paddingRight: 5,
		paddingTop: 5,
		paddingBottom: 5,
		backgroundColor: 'rgb(250, 250, 250)'
	},
	itemContainer: {
		flex: 1,
		marginTop: 6,
		marginLeft: 3,
		marginRight: 3,
		borderRadius: 3,
		backgroundColor: 'white',
		shadowColor: '#000',
		shadowOpacity: 0.05,
		shadowRadius: 5,
		shadowOffset: {
			width: 0,
			height: 3
		}
	},
	itemContent: {
		flex: 1,
		overflow: 'hidden',
	},
	itemImage: {
		flex: 1,
		resizeMode: 'cover',
	},
	itemTitle: {
		color: 'rgb(51, 51, 51)',
		fontSize: 13,
		lineHeight: 20,
		fontWeight: '500',
		marginTop: 8,
		marginLeft: 7,
		marginRight: 7,
	},
	itemUserContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginTop: 10,
		marginBottom: 10,
		marginLeft: 7,
		marginRight: 7,
	},
	itemUserImage: {
		width: 20,
		height: 20,
		borderRadius: 20 / 2.0,
		marginRight: 5,
	},
	itemUserTitle: {
		color: 'rgb(51, 51, 51)',
		fontSize: 10,
	},
	itemLikeTitle: {
		fontSize: 10,
		color: 'rgb(102, 102, 102)',
	},
})