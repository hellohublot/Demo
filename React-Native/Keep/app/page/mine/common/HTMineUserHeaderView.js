import React, { Component } from 'react'
import { View, Image, Text, StyleSheet } from 'react-native'

export default class HTMineUserHeaderView extends Component {

	constructor(props) {
		super(props)
		this.state = {
			contentOffset: { x: 0, y: 0 },
		}
	}

	reloadWithContentOffset = (contentOffset) => {
		this.setState({ contentOffset })
	}

	render() {
		let vipImage = require('~/resource/img/mine_vip_background.png')
		const { width, height } = Image.resolveAssetSource(vipImage)
		let reloadWidth = SCREEN_WIDTH - 10 - 10
		let reloadHeight = SCALE(reloadWidth, width, height)
		let paddingBottom = reloadHeight / 2.0

		return (
			<View style={styleList.headerContainer}>
				<Image style={[styleList.headerBackgroundImage, { marginBottom: paddingBottom }]} source={require('~/resource/img/mine_user_header_background.png')} />
				<View style={styleList.headerContent}>
					<View style={styleList.userContainer}>
						<Image style={styleList.userImage} source={require('~/resource/img/mine_user_image.png')} />
						<View style={styleList.userConetent}>
							<Text style={styleList.userContentName}>销魂的hublot</Text>
							<View style={styleList.userBadgeContainer}>
								<Image style={styleList.userBageBackground} source={require('~/resource/img/mine_user_badge.png')} />
								<View style={styleList.userBadgeContent}>
									<Text style={styleList.userBadgeTitle}>我的徽章</Text>
								</View>
							</View>
						</View>
						<Image source={require('~/resource/img/mine_user_white_right.png')} />
					</View>
					<View style={styleList.vipContaienr}>
						<Image style={[styleList.vipBackground, { width: reloadWidth, height: reloadHeight }]} source={vipImage} />
						<View style={styleList.vipContent}>
							<Image source={require('~/resource/img/mine_user_vip_logo.png')} />
							<Text style={styleList.vipContentTitle}>首月立减 10 元！</Text>
							<View style={styleList.vipContentButton}>
								<Text style={styleList.vipContentButtonTitle}>开通会员</Text>
							</View>
						</View>
					</View>
				</View>
			</View>
		)		
	}

}

const styleList = StyleSheet.create({
	headerContainer: {
		backgroundColor: 'white',
	},
	headerBackgroundImage: {
		
	},
	headerContent: {
		position: 'absolute',
		left: 0,
		right: 0,
		bottom: 0,
	},
	userContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginBottom: 20,
		paddingLeft: 15,
		paddingRight: 15,
	},
	userImage: {
		width: 65,
		height: 65,
		borderRadius: 65 / 2.0,
		borderColor: 'white',
		borderWidth: 3,
	},
	userConetent: {
		flex: 1,
		marginLeft: 15,
	},
	userContentName: {
		color: 'white',
		fontSize: 19,
		fontWeight: 'bold',
		marginBottom: 10,
	},
	userBadgeContainer: {
		alignSelf: 'flex-start',
	},
	userBadgeContent: {
		position: 'absolute',
		left: 0,
		right: 0,
		top: 0,
		bottom: 0,
		alignItems: 'center',
		justifyContent: 'center',
		paddingLeft: 20,
	},
	userBadgeTitle: {
		fontSize: 10,
		color: 'white',
	},
	vipContaienr: {
		paddingLeft: 10,
		paddingRight: 10,
	},
	vipBackground: {
		resizeMode: 'cover',
		width: '100%',
	},
	vipContent: {
		position: 'absolute',
		left: 0,
		top: 0,
		right: 0,
		bottom: 0,
		flexDirection: 'row',
		paddingLeft: 30,
		paddingRight: 30,
		alignItems: 'center',
	},
	vipContentTitle: {
		flex: 1,
		fontSize: 14,
		color: 'rgb(51, 51, 51)',
		marginLeft: 10,
	},
	vipContentButton: {
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: 'rgb(51, 51, 51)',
		paddingLeft: 15,
		paddingRight: 15,
		height: 26,
		borderRadius: 26 / 2.0,
	},
	vipContentButtonTitle: {
		fontSize: 12,
		color: 'rgb(243, 207, 128)',
	},


})