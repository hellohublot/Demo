import React, { Component } from 'react'
import NavigationBar from '~/common/navigation/NavigationBar'
import { View, Text, Image, FlatList, TouchableOpacity, StyleSheet, Animated, Easing } from 'react-native'
import { BlurView } from "@react-native-community/blur"


export default class HTMenuPage extends Component {

	static navigationOptions = {
		header: null
	}

	constructor(props) {
		super(props)
		this.state = {
			data: [
				{ title: '首    页', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
				{ title: '文    字', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
				{ title: '声    音', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
				{ title: '影    像', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
				{ title: '谈    论', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
				{ title: '单向历', itemTransformX: new Animated.Value(-SCREEN_WIDTH) },
			],
			itemScale: new Animated.Value(0),
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
			this._itemAnimation(item.itemTransformX, -SCREEN_WIDTH, 1000, index * 70)
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
				<Image source={require('~/resource/img/menu_header_title.png')} />
				<View style={styleList.headerLineContainer}>
					<View style={styleList.headerLine}></View>
					<Text style={styleList.headerDetail}>We Read The World</Text>
					<View style={styleList.headerLine}></View>
				</View>
			</View>
		)
	}

	_renderFooter = () => {
		return (
			<View style={styleList.authorContainer}>
				<Text style={styleList.authorTitle}>Powered by OWSPACE</Text>
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
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
						<Animated.Image style={{transform: [ {scale: this.state.itemScale} ]}} source={require('~/resource/img/menu_navigation_search.png')} />
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
		marginTop: 40,
	},
	itemContainer: {
		justifyContent: 'center',
		alignItems: 'center',
		width: SCREEN_WIDTH,
		height: 62,
	},
	itemTitle: {
		fontSize: 37,
		color: 'white',
	},
	headerContainer: {
		alignItems: 'center',
		justifyContent: 'center',
		height: 100,
	},
	headerLineContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginTop: 40,
	},
	headerDetail: {
		fontSize: 12,
		color: 'white',
		paddingLeft: 15,
		paddingRight: 15,
	},
	headerLine: {
		flex: 1,
		height: 0.5,
		backgroundColor: 'rgba(255, 255, 255, 0.3)'
	},
	authorContainer: {
		marginBottom: 50,
		justifyContent: 'center',
		alignItems: 'center'
	},
	authorTitle: {
		fontSize: 8,
		color: 'white',
	}
})


