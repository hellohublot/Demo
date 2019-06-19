import React, { Component } from 'react'
import { View, Text, Image, FlatList, ScrollView, StyleSheet } from 'react-native'
import NavigationBar from '~/common/navigation/NavigationBar'

export default class HTSportPage extends Component {

	static navigationOptions = {
		header: null,
	}

	_renderUserAim = () => {
		return (
			<View style={styleList.userAimContainer}>
				<Image source={require('~/resource/img/mine_user_image.png')} style={styleList.userAimImage} />
				<View style={styleList.userAimButtonContainer}>
					<View style={styleList.userAimButtonTitleContainer}>
						<Text style={styleList.userAimButtonTitle}>定个目标，开始 Keep！</Text>
					</View>
					<Image style={styleList.userAimButtonImage} source={require('~/resource/img/sport_user_aim_button.png')} />
				</View>
			</View>
		)
	}

	_renderUserTime = () => {
		return (
			<View style={[styleList.userTimeContainer, styleList.shadowContainer]}>
				<View style={styleList.userTimeMainContainer}>
					<Text style={styleList.userTimeMainTitle}>在 Keep 已累计运动</Text>
					<Image style={styleList.userTimeMainImage} source={require('~/resource/img/sport_time_detail_right.png')} />
				</View>
				<View style={styleList.userTimeContentContainer}>
					<Text style={styleList.userTimeContentTitle}>-</Text>
					<Text style={styleList.userTimeContentText}>分钟</Text>
					<View style={CONTAINER}></View>
					<Text style={styleList.userTimeContentDetail}>今日运动</Text>
					<Text style={styleList.userTimeContentDetailSelected}>-</Text>
					<Text style={styleList.userTimeContentDetail}>分钟</Text>
				</View>
			</View>
		)
	}

	_renderUserCourseList = () => {
		return (
			<View style={[styleList.courseListContainer, styleList.shadowContainer]}>
				<View style={styleList.courseHeaderContainer}>
					<Text style={styleList.courseHeaderTitle}>我参加的课程</Text>
					<View style={CONTAINER}></View>
					<View style={styleList.courseHeaderButtonContainer}>
						<Text style={styleList.courseHeaderButtonTitle}>发现课程</Text>
					</View>
				</View>
				<FlatList
					keyExtractor={(item, index) => `${index}`}
					data={[
						{ title: '5分钟瑜伽体验课', detail: '还未进行过训练  32人正在练', text: '5 分钟 · K1', showSeparator: true },
						{ title: '2分钟体验课程', detail: '还未进行过训练  48人正在练', text: '2 分钟 · K1', showSeparator: false },
					]}
					renderItem={({item, index}) => this._renderUserCourseItem(item, index)}
				/>
				<View style={styleList.courseFooterContainer}>
					<Text style={styleList.courseFooterTitle}>查看全部</Text>
				</View>
			</View>
		)
	}

	_renderUserCourseItem = (item, index) => {
		return (
			<View style={styleList.courseItemContainer}>
				<View style={styleList.courseItemMainContainer}>
					<Text style={styleList.courseItemMainTitle}>{item.title}</Text>
					<View style={CONTAINER}></View>
					<Text style={styleList.courseItemMainText}>{item.text}</Text>
				</View>
				<Text style={styleList.courseItemDetail}>{item.detail}</Text>
				{ item.showSeparator && <View style={styleList.courseItemSeparator}></View> }
			</View>
		)
	}

	_renderSportGroup = () => {
		return (
			<View style={[styleList.sportGroupContainer, styleList.shadowContainer]}>
				<View style={styleList.sportGroupHeaderContainer}>
					<Text style={styleList.sportGroupHeaderTitle}>精选训练营</Text>
					<View style={CONTAINER}></View>
					<Image source={require('~/resource/img/sport_group_detail_right.png')} />
				</View>
				<View style={styleList.sportGroupMainContainer}>
					<Image style={styleList.sportGroupMainBackgroundImage} source={require('~/resource/img/sport_group_background.png')} />
					<View style={styleList.sportGroupMainContent}>
						<Text style={styleList.sportGroupMainTitle}>压力缓解放松营</Text>
						<Text style={styleList.sportGroupMainDetail}>累计 23798 人已参加</Text>
						<View style={CONTAINER}></View>
						<View style={styleList.sportGroupMainContentTextContainer}>
							<Text style={styleList.sportGroupMainContentTextDetail}>总时长</Text>
							<Text style={styleList.sportGroupMainContentTextTitle}>1</Text>
							<Text style={styleList.sportGroupMainContentTextDetail}>周</Text>
						</View>
					</View>
				</View>
				<Text style={styleList.sportGroupDetail}>简单运动 快乐生活</Text>
			</View>
		)
	}

	_renderSportPlan = () => {
		return (
			<View style={[styleList.sportPlanContainer, styleList.shadowContainer]}>
				<View style={styleList.sportPlanHeaderContainer}>	
					<Text style={styleList.sportPlanHeaderTitle}>智能训练计划</Text>
				</View>
				<Image style={styleList.sportPlanMainImage} source={require('~/resource/img/sport_plan_background.png')} />
				<View style={styleList.sportPlanContentContainer}>
					<Text style={styleList.sportPlanContentTitle}>为你定制的智能计划</Text>
					<View style={styleList.sportPlanContentButtonContainer}>
						<Text style={styleList.sportPlanContentButtonTitle}>会员专属</Text>
					</View>
				</View>
				<Text style={styleList.sportPlanDetail} numberOfLines={2}>想要让你的身材更好吗？Keep 智能计划已经改变了 2000 多万人的身材，希望也能改变你的！</Text>
				<View style={styleList.sportPlanButtonContainer}>
					<View style={styleList.sportPlanButtonContent}>
						<Text style={styleList.sportPlanButtonTitle}>获取智能训练计划</Text>
					</View>
				</View>
			</View>
		)
	}

	_renderContentMore = () => {
		return (
			<View style={styleList.contentMoreContainer}>
				<Text style={styleList.contentMoreTitle}>- 没有更多内容 -</Text>
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
				<NavigationBar title='运动' leftItemList={[
					(<Image source={require('~/resource/img/sport_navigation_gift.png')} />),
				]} rightItemList={[
					(<Image source={require('~/resource/img/sport_navigation_search.png')} />),
					15,
					(<Image source={require('~/resource/img/sport_navigation_append.png')} />)
				]}></NavigationBar>
				<ScrollView style={styleList.sectionListContainer}>
					{
						this._renderUserAim()
					}
					{
						this._renderUserTime()
					}
					{
						this._renderUserCourseList()
					}
					{
						this._renderSportGroup()
					}
					{
						this._renderSportPlan()
					}
					{
						this._renderContentMore()
					}
				</ScrollView>
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	sectionListContainer: {
		backgroundColor: '#FAFAFA',
		paddingLeft: 15,
		paddingRight: 15,
	},
	shadowContainer: {
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
	userAimContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginTop: 15,
	},
	userAimImage: {
		width: 40,
		height: 40,
		borderRadius: 40 / 2.0
	},
	userAimButtonContainer: {
		marginLeft: 15,
		flex: 1,
		height: 40,
		borderRadius: 40 / 2.0,
		borderColor: 'rgb(227, 227, 227)',
		borderStyle: 'dashed',
		borderWidth: 1,
		flexDirection: 'row',
		alignItems: 'center',
	},
	userAimButtonTitleContainer: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	},
	userAimButtonTitle: {
		fontSize: 14,
		color: 'rgb(204, 204, 204)'
	},
	userAimButtonImage: {
		marginRight: 4,
	},
	userTimeContainer: {
		paddingTop: 15,
		paddingLeft: 15,
		paddingRight: 15,
		paddingBottom: 13,
		marginTop: 25,
	},
	userTimeMainContainer: {
		flexDirection: 'row',
		alignItems: 'center',
	},
	userTimeMainTitle: {
		fontSize: 14,
		color: 'rgb(102, 102, 102)',
		marginRight: 10,
	},
	userTimeContentContainer: {
		marginTop: 7,
		flexDirection: 'row',
		flex: 1,
		alignItems: 'flex-end',
	},
	userTimeContentTitle: {
		fontSize: 48,
		color: 'rgb(89, 79, 97)',
		fontWeight: '400',
	},
	userTimeContentText: {
		fontSize: 14,
		color: 'rgb(89, 79, 97)',
		fontWeight: '400',
		paddingBottom: 12,
		marginLeft: 5,
	},
	userTimeContentDetail: {
		paddingBottom: 12,
		fontSize: 14,
		color: 'rgb(153, 153, 153)'
	},
	userTimeContentDetailSelected: {
		paddingBottom: 11,
		marginLeft: 3,
		marginRight: 3,
		fontSize: 14,
		color: 'rgb(36, 199, 137)'
	},

	courseListContainer: {
		marginTop: 10,
		paddingLeft: 15,
		paddingRight: 15,
	},
	courseHeaderContainer: {
		flexDirection: 'row',
		height: 60,
		alignItems: 'center',
	},
	courseHeaderTitle: {
		fontSize: 14,
		color: 'rgb(51, 51, 51)'
	},
	courseHeaderButtonContainer: {
		backgroundColor: '#24B17B',
		justifyContent: 'center',
		alignItems: 'center',
		paddingLeft: 15,
		paddingRight: 15,
		height: 28,
		borderRadius: 28 / 2.0
	},
	courseHeaderButtonTitle: {
		fontSize: 12,
		color: 'white',
	},
	courseItemContainer: {
		height: 90,
		justifyContent: 'center',
	},
	courseItemSeparator: {
		position: 'absolute',
		left: 0,
		right: 0,
		bottom: 0,
		height: 0.5,
		backgroundColor: 'rgb(240, 240, 240)'
	},
	courseItemMainContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginBottom: 10,
	},
	courseItemMainTitle: {
		fontSize: 18,
		color: 'rgb(51, 51, 51)',
		fontWeight: 'bold'
	},
	courseItemMainText: {
		fontSize: 12,
		color: 'rgb(89, 79, 97)'
	},
	courseItemDetail: {
		fontSize: 10,
		color: 'rgb(153, 153, 153)'
	},
	courseFooterContainer: {
		justifyContent: 'center',
		alignItems: 'center',
		height: 50,
	},
	courseFooterTitle: {
		color: 'rgb(89, 79, 97)',
		fontSize: 15,
	},


	sportGroupContainer: {
		marginTop: 10,
		paddingLeft: 15,
		paddingRight: 15,
	},
	sportGroupHeaderContainer: {
		height: 60,
		flexDirection: 'row',
		alignItems: 'center',
	},
	sportGroupHeaderTitle: {
		fontSize: 14,
		color: 'rgb(51, 51, 51)'
	},
	sportGroupMainContainer: {

	},
	sportGroupMainBackgroundImage: {
		width: '100%',
		resizeMode: 'cover',
		borderRadius: 3,
	},
	sportGroupMainContent: {
		position: 'absolute',
		left: 0,
		top: 0,
		bottom: 0,
		right: 0,
		backgroundColor: 'rgba(0, 0, 0, 0.4)',
		paddingLeft: 10,
		paddingTop: 20,
		paddingBottom: 20,
		paddingRight: 10,
	},
	sportGroupMainTitle: {
		color: 'white',
		fontSize: 20,
		fontWeight: '400',
	},
	sportGroupMainDetail: {
		marginTop: 5,
		fontSize: 10,
		color: 'rgba(255, 255, 255, 0.8)',
	},
	sportGroupMainContentTextContainer: {
		flexDirection: 'row',
		alignItems: 'flex-end',
	},
	sportGroupMainContentTextTitle: {
		fontSize: 14,
		fontWeight: 'bold',
		color: 'white',
		paddingLeft: 1.5,
		paddingRight: 1.5,
	},
	sportGroupMainContentTextDetail: {
		fontSize: 10,
		fontWeight: 'normal',
		color: 'rgba(255, 255, 255, 0.8)',
		paddingBottom: 2,
	},
	sportGroupDetail: {
		fontSize: 13,
		color: 'rgb(153, 153, 153)',
		marginTop: 17,
		marginBottom: 17,
	},


	sportPlanContainer: {
		paddingLeft: 15,
		paddingRight: 15,
		marginTop: 10,
	},
	sportPlanHeaderContainer: {
		height: 60,
		flexDirection: 'row',
		alignItems: 'center',
	},
	sportPlanHeaderTitle: {
		fontSize: 14,
		color: 'rgb(51, 51, 51)'
	},
	sportPlanMainImage: {
		width: '100%',
		height: 125,
		borderRadius: 3,
	},
	sportPlanContentContainer: {
		flexDirection: 'row',
		alignItems: 'center',
		marginTop: 15,
	},
	sportPlanContentTitle: {
		fontSize: 16,
		color: 'rgb(51, 51, 51)'
	},
	sportPlanContentButtonContainer: {
		backgroundColor: 'rgb(243, 207, 140)',
		borderRadius: 2,
		justifyContent: 'center',
		alignItems: 'center',
		paddingTop: 2,
		paddingBottom: 2,
		paddingLeft: 5,
		paddingRight: 5,
		marginLeft: 3,
	},
	sportPlanContentButtonTitle: {
		fontSize: 10,
		color: 'rgb(51, 51, 51)'
	},
	sportPlanDetail: {
		marginTop: 10,
		fontSize: 13,
		color: 'rgb(153, 153, 153)',
		lineHeight: 18,
	},
	sportPlanButtonContainer: {
		alignItems: 'center',
		marginTop: 15,
		marginBottom: 20,
	},
	sportPlanButtonContent: {
		height: 50,
		borderRadius: 50 / 2.0,
		width: '90%',
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#25C789',
	},
	sportPlanButtonTitle: {
		color: 'white',
		fontSize: 18,
	},
	contentMoreContainer: {
		justifyContent: 'center',
		alignItems: 'center',
		height: 60,
	},
	contentMoreTitle: {
		fontSize: 13,
		color: 'rgb(204, 204, 204)'
	},






})