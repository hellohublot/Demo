import React, { Component } from 'react'
import { View, Text, Image, TextInput, FlatList, StyleSheet } from 'react-native'
import NavigationBar from '~/common/navigation/NavigationBar'
import Swiper from 'react-native-swiper'


export default class HTDiscoverPage extends Component {

	static navigationOptions = {
		header: null
	}

	constructor(props) {
		super(props)
		this.state = {
			buttonList: [
				{ title: '全部课程', image: require('~/resource/img/discover_button_course.png') },
				{ title: '活动挑战', image: require('~/resource/img/discover_button_activity.png') },
				{ title: 'KeepClass', image: require('~/resource/img/discover_button_class.png') },
			],
			bannerList: [],
			discoverList: []
		}
	}

	componentWillMount() {
		this._requestDiscoverList()
	}

	_requestDiscoverList = () => {
		fetch('https://api.gotokeep.com/explore/v2/api/explore?page=0', {
			headers: {
				Authorization: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfaWQiOiI1YzA5MDIxZGU2NjY4NjBkMGQ4YmRmNjgiLCJ1c2VybmFtZSI6IumUgOmtgueahGh1YmxvdCIsImF2YXRhciI6Imh0dHA6Ly9zdGF0aWMxLmtlZXBjZG4uY29tL2F2YXRhci8yMDE5LzA2LzE4LzExLzAzLzE4MzRlMmU2NWIxNmZhODk1YzA5MDIxZGU2NjY4NjBkMGQ4YmRmNjguanBnIiwiX3YiOiIxIiwiX2VkIjoiUlZuWXRSN0srUjVDd05PelpBL2NRSnFFQm9vclY1YURpUXNjcGtRVjh1K2NKMmVzWDhoaDh3ZzFDeGZmeDg0byIsImdlbmRlciI6IkYiLCJkZXZpY2VJZCI6IiIsImlzcyI6Imh0dHA6Ly93d3cuZ290b2tlZXAuY29tLyIsImV4cCI6MTU4NDI0MjQ3MiwiaWF0IjoxNTYwOTE0NDcyfQ.WXSpKpKs_8lUS0c6nhHta_k1Qi4s_eGtvOoazgqaopM'
			}
		})
		.then((response) => response.json())
		.then((response) => {
			console.log(response)
			let bannerList = response?.data?.top?.filter((item) => {
				return (item?.photo?.length || 0) > 0
			})
			this.setState({ 
				bannerList: bannerList,
				discoverList: response.data.contents
			})
		})
	}

	_renderTitleView = () => {
		return (
			<View style={styleList.titleViewContainer}>
				<Image source={require('~/resource/img/discover_navigation_search.png')} />
				<TextInput 
					style={styleList.titleViewTextInput}
					placeholder={'大家都在搜「踢足球的女孩超美」'}
					placeholderColor={'rgb(204, 204, 204)'}
				>
				</TextInput>
			</View>
		)
	}

	_renderBannerList = (bannerList) => {
		return (
			<View style={styleList.bannerListContainer}>
				<Swiper showsPagination={false}>
					{
						bannerList.map((item, index) => {
							return this._renderBannerItem(item, index)
						})
					}
				</Swiper>
			</View>
		)
	}

	_renderBannerItem = (item, index) => {
		return (
			<View style={styleList.bannerItemContainer} key={`${index}`}>
				<Image source={{uri: item.photo}} style={styleList.bannerItemImage} />
			</View>
		)
	}

	_renderButtonList = (buttonList) => {
		return (
			<View>
				<FlatList
					scrollEnabled={false}
					keyExtractor={(item, index) => `${index}`}
					style={styleList.buttonListContainer}
					numColumns={3}
					data={buttonList}
					renderItem={({item, index}) => this._renderButtonItem(item, index)}
				/>
				<View style={styleList.buttonMoreContainer}>
					<Text style={styleList.buttonMoreTitle}>更多精选内容</Text>
				</View>
			</View>
		)
	}

	_renderButtonItem = (item, index) => {
		return (
			<View style={styleList.buttonItemContainer}>
				<Image style={styleList.buttonItemImage} source={item.image} />
				<Text style={styleList.buttonItemTitle}>{item.title}</Text>
			</View>
		)
	}

	_renderDiscoverHeader = () => {
		return (
			<View>
				{
					this._renderBannerList(this.state.bannerList)
				}
				{
					this._renderButtonList(this.state.buttonList)
				}
			</View>
		)
	}

	_renderDiscoverList = (discoverList) => {
		return (
			<FlatList
				style={styleList.discoverListContainer}
				ListHeaderComponent={() => this._renderDiscoverHeader()}
				keyExtractor={(item, index) => `${index}`}
				data={discoverList}
				renderItem={({item, index}) => this._renderDiscoverItem(item, index)}
			/>
		)
	}

	_renderDiscoverItem = (item, index) => {
		let lookCount = Math.random() * 15 + 5
		lookCount = lookCount.toFixed(1)
		return (
			<View style={styleList.discoverItemContainer}>
				<Text style={styleList.discoverItemTitle}>{item.title}</Text>
				<Image style={styleList.discoverItemImage} source={{uri: item.picUrl}} />
				<Text numberOfLines={2} style={styleList.discoverItemDetail}>{item.subtitle}</Text>
				<Text style={styleList.discoverItemText}>{`${lookCount} 万 人正在围观`}</Text>
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
				<NavigationBar backgroundColor={'white'} titleView={this._renderTitleView()}></NavigationBar>
				{
					this._renderDiscoverList(this.state.discoverList)
				}
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	titleViewContainer: {
		backgroundColor: 'rgb(240, 240, 240)',
		height: '70%',
		width: '90%',
		borderRadius: 3,
		flexDirection: 'row',
		alignItems: 'center',
		paddingLeft: 7,
	},
	titleViewTextInput: {
		flex: 1,
		fontSize: 14,
		marginLeft: 7,
		marginRight: 7,
	},
	discoverListContainer: {
		backgroundColor: 'rgb(250, 250, 250)',
	},


	discoverItemContainer: {
		marginLeft: 10,
		marginRight: 10,
		marginBottom: 10,
		paddingLeft: 10,
		paddingRight: 10,
		paddingTop: 20,
		paddingBottom: 20,
		height: 276,
		backgroundColor: 'white',
		borderRadius: 3,
		shadowColor: '#000',
		shadowOpacity: 0.02,
		shadowRadius: 10,
		shadowOffset: {
			width: 2,
			height: 2
		}
	},
	discoverItemTitle: {
		color: 'rgb(51, 51, 51)',
		fontSize: 17,
		fontWeight: '500',
	},
	discoverItemImage: {
		borderRadius: 3,
		flex: 1,
		marginTop: 20,
	},
	discoverItemDetail: {
		fontSize: 13,
		lineHeight: 20,
		color: 'rgb(102, 102, 102)',
		marginTop: 15,
	},
	discoverItemText: {
		fontSize: 10,
		color: 'rgb(153, 153, 153)',
		marginTop: 8,
	},



	buttonListContainer: {
		backgroundColor: 'white',
		paddingBottom: 20,
	},
	buttonItemContainer: {
		flex: 1,
		alignItems: 'center',
	},
	buttonItemImage: {
		width: 42,
		height: 42,
		marginBottom: 10,
	},
	buttonItemTitle: {
		fontSize: 12,
		color: 'rgb(102, 102, 102)',
	},
	buttonMoreContainer: {
		height: 60,
		justifyContent: 'center',
		alignItems: 'center',
	},
	buttonMoreTitle: {
		fontSize: 12,
		color: 'rgb(153, 153, 153)'
	},
	bannerListContainer: {
		backgroundColor: 'white',
		height: 150,
		paddingTop: 5,
		paddingBottom: 15,
	},
	bannerItemContainer: {
		alignItems: 'center',
		justifyContent: 'center',
	},
	bannerItemImage: {
		width: '93%',
		height: '100%',
		borderRadius: 4,
	}
})