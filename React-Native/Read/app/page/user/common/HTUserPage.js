import React, { Component } from 'react'
import { View, Text, Image, FlatList, TouchableOpacity, StyleSheet, Animated, Easing } from 'react-native'
import NavigationBar from '~/common/navigation/NavigationBar'
import { BlurView } from "@react-native-community/blur"


export default class HTUserPage extends Component {

	static navigationOptions = {
		header: null
	}

	constructor(props) {
		super(props)
		this.state = {
			data: [
				{ title: '消    息', itemTransformX: new Animated.Value(SCREEN_WIDTH) },
				{ title: '收    藏', itemTransformX: new Animated.Value(SCREEN_WIDTH) },
				{ title: '离    线', itemTransformX: new Animated.Value(SCREEN_WIDTH) },
				{ title: '笔    记', itemTransformX: new Animated.Value(SCREEN_WIDTH) },
			],
			itemScale: new Animated.Value(0)
		}
	}

	_exitButtonDidTouch = () => {
		this.props.exitButtonTouch()
	}

	_itemAnimation = (key, value, time, delay) => {
		Animated.timing(key, {
			toValue: value,
			duration: time,
			easing: Easing.inOut(Easing.ease),
			delay: delay,
			useNativeDriver: true,
		}).start()
	}

	showPageBegin = () => {
		this._itemAnimation(this.state.itemScale, 0, 0)
		this.state.data.map((item, index) => {
			this._itemAnimation(item.itemTransformX, 0, 1000, index * 70)
		})
	}

	showPageEnd = () => {
		this._itemAnimation(this.state.itemScale, 1, 500)
	}

	hiddenPageBegin = () => {
		this._itemAnimation(this.state.itemScale, 0, 500)
		this.state.data.map((item, index) => {
			this._itemAnimation(item.itemTransformX, SCREEN_WIDTH, 1000, index * 70)
		})
	}

	_renderItem = (item, index) => {
		return (
			<Animated.View style={[styleList.itemContainer, {transform: [{translateX: item.itemTransformX}]}]}>
				<Text style={styleList.itemTitle}>{item.title}</Text>
			</Animated.View>
		)
	}

	_renderHeader = () => {
		return (
			<View style={styleList.headerContainer}>
				<Image style={styleList.headerImage} source={require('~/resource/img/user_head_image.png')} />
				<Text style={styleList.headerTitle}>登录</Text>
			</View>
		)
	}

	_renderFooter = () => {
		return (
			<View style={styleList.footerContainer}>
				<Image style={styleList.footerImage} source={require('~/resource/img/user_author_image.png')} />
				<Text style={styleList.footerTitle}>version1.6.2</Text>
			</View>
		)
	}

	render() {
		return (
			<View style={[CONTAINER, { backgroundColor: '#0000' }]}>
				<BlurView
					style={styleList.blurContainer}
					blurType="dark"
					blurAmount={40}
				/>
				<NavigationBar
					leftItemList={[
						<TouchableOpacity activeOpacity={0.7} onPress={() => this._exitButtonDidTouch()}>
							<Animated.Image style={{transform: [ {scale: this.state.itemScale} ]}} source={require('~/resource/img/menu_navigation_close.png')} />
						</TouchableOpacity>
					]}
					rightItemList={[
						<Animated.Image style={{transform: [ {scale: this.state.itemScale} ]}} source={require('~/resource/img/user_navigation_setup.png')} />
					]}
				/>
				{
					this._renderHeader()
				}
				<View style={styleList.itemListContainer}>
					<FlatList
						scrollEnabled={false}
						keyExtractor={(item, index) => `${index}`}
						data={this.state.data}
						renderItem={({item, index}) => this._renderItem(item, index)}
					/>
				</View>
				{
					this._renderFooter()
				}
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	blurContainer: {
		position: 'absolute',
		left: 0,
		right: 0,
		top: 0,
		bottom: 0,
	},
	itemListContainer: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		marginTop: 20,
	},
	itemContainer: {
		justifyContent: 'center',
		alignItems: 'center',
		width: SCREEN_WIDTH,
		height: 64,
	},
	itemTitle: {
		fontSize: 40.5,
		color: 'white'
	},
	headerContainer: {
		alignItems: 'center',
		justifyContent: 'center',
		height: 160,
	},
	headerTitle: {
		color: 'white',
		fontSize: 13,
		marginTop: 25,
	},
	footerContainer: {
		alignItems: 'center',
		marginBottom: 50,
	},
	footerTitle: {
		marginTop: 20,
		color: 'white',
		fontSize: 7.5
	}
})