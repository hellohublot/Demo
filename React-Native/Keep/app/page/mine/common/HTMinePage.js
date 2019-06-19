import React, { Component } from 'react'
import { View, FlatList, Text, Image, StyleSheet } from 'react-native'
import NavigationBar from '~/common/navigation/NavigationBar'
import HTMineUserHeaderView from './HTMineUserHeaderView'


export default class HTMinePage extends Component {

	static navigationOptions = {
		header: null,
	}

	constructor(props) {
		super(props)
		this.state = {
			section: [
				{
					headerSpace: false,
					showFooter: true,
					data: [
						{ title: 'KG.0', detail: '什么是 KG 等级？', showSeparator: true, largeTitle: true },
						{ title: '我的数据', detail: '', showSeparator: false, largeTitle: false },
					],
					recordList: [
						{ title: '今日运动', detail: '分钟', text: '0' },
						{ title: '本周运动', detail: '天', text: '0' },
						{ title: '连续运动', detail: '天', text: '0' },
						{ title: '今日步数', detail: '步', text: '0', image: require('~/resource/img/mine_record_append.png') },
						{ title: '身体数据', detail: '添加身体数据', text: '', image: require('~/resource/img/mine_record_append.png') },
						{ title: '体测评分', detail: '测一测运动能力', text: '', image: require('~/resource/img/mine_record_append.png') },
					]
				},
				{
					headerSpace: false,
					showFooter: false,
					data: [
						{ title: '我的 Class', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的活动', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的卡路里币', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的 Keepland', detail: '', showSeparator: false, largeTitle: false },
					]
				},
				{
					headerSpace: true,
					showFooter: false,
					data: [
						{ title: '我的收藏', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的运动影像', detail: '专属纪录片', showSeparator: true, largeTitle: false },
						{ title: '我的智能设备', detail: '', showSeparator: false, largeTitle: false },
					]
				},
				{
					headerSpace: true,
					showFooter: false,
					data: [
						{ title: '我的钱包', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的订单', detail: '', showSeparator: true, largeTitle: false },
						{ title: '我的购物车', detail: '', showSeparator: true, largeTitle: false },
						{ title: '帮助中心', detail: '', showSeparator: false, largeTitle: false },
					]
				}
			]
		}
	}

	_renderSection = (section, index) => {
		return (
			<View>
				{ this._renderSectionHeader(section, index) }
				<FlatList
					keyExtractor={(item, index) => `${index}`}
					data={section.data}
					renderItem={({item, index}) => this._renderItem(section, item, index)}
				/>
				{ this._renderSectionFooter(section, index) }
			</View>
		)
	}

	_renderSectionHeader = (section, index) => {
		if (!section.headerSpace) {
			return null
		}
		return (
			<View style={styleList.sectionSpaceContainer}></View>
		)
	}

	_renderSectionFooter = (section, index) => {
		if (!section.showFooter) {
			return null
		}
		return (
			<View style={styleList.sectionFooterContainer}>
				<View style={styleList.footerMainContainer}>
					{ 
						this._renderSectionFooterMainItem('总运动', (
							<Text style={styleList.footerMainItemDetail}>(分钟)</Text>
						), (
							<Text style={styleList.footerMainDurationText}>-</Text>
						))
					}
					{ 
						this._renderSectionFooterMainItem('本周排名', (
							<View style={styleList.footerMainRankTextContainer}>
								<Text style={styleList.footerMainItemDetail}>第</Text>
								<Text style={styleList.footerMainItemDetailSelected}>-</Text>
								<Text style={styleList.footerMainItemDetail}>名</Text>
							</View>
						), (
							<Image style={styleList.footerMainRankImage} source={require('~/resource/img/mine_user_image.png')} />
						))
					}
				</View>
				<FlatList
					keyExtractor={(item, index) => `${index}`}
					horizontal={true}
					showsHorizontalScrollIndicator={false}
					data={section.recordList}
					renderItem={({item, index}) => this._renderSectionFooterRecordItem(item, index)}
				/>
			</View>
		)
	}

	_renderSectionFooterMainItem = (title, detail, content) => {
		return (
			<View style={styleList.footerMainItemContainer}>
				<View style={styleList.footerMainItemTextContainer}>
					<Text style={styleList.footerMainItemTitle}>{title}</Text>
					{ detail }
				</View>
				{ content }
			</View>
		)
	}

	_renderSectionFooterRecordItem = (item, index) => {
		return (
			<View style={styleList.footerRecordItemContainer}>
				<View style={styleList.footerRecordItemMainContainer}>
					<Text style={styleList.footerRecordItemTitle}>{item.title}</Text>
					{ item.image && <Image source={item.image} /> }
				</View>
				<View style={styleList.footerRecordItemContent}>
					{ ((item.text?.length || 0) > 0) && <Text style={styleList.footerRecordItemText}>{item.text}</Text>}
					<Text style={styleList.footerRecordItemDetail}>{item.detail}</Text>
				</View>
			</View>
		)
	}

	_renderItem = (section, item, index) => {
		let titleStyle = item.largeTitle ? styleList.itemTitleSelected : styleList.itemTitleNormal
		return (
			<View style={styleList.itemContainer}>
				<Text style={[styleList.itemTitle, titleStyle]}>{item.title}</Text>
				<Text style={styleList.itemDetail}>{item.detail}</Text>
				<Image source={require('~/resource/img/mine_item_gray_right.png')} />
				{item.showSeparator && <View style={styleList.itemSeparator}></View> }
			</View>
		)
	}

	render() {
		return (
			<View style={CONTAINER}>
				<NavigationBar float={true} backgroundColor={'#0000'} leftItemList={[
					<Image source={require('~/resource/img/mine_navigation_setup.png')} />,
				]} rightItemList={[
					<Image style={styleList.navigationScanfImage} source={require('~/resource/img/mine_navigation_scanf.png')} />,
					15,
					<Image style={styleList.navigationMessageImage} source={require('~/resource/img/mine_navigation_message.png')} />,
				]}></NavigationBar>
				<View style={styleList.scrollColorView}></View>
				<FlatList
					ListHeaderComponent={() => (
						<HTMineUserHeaderView ref={(ref) => this.headerView = ref}></HTMineUserHeaderView>
					)}
					keyExtractor={(item, index) => `${index}`}
					data={this.state.section}
					renderItem={({item, index}) => this._renderSection(item, index)}
					onScroll={(event) => {
						let contentOffset = event.nativeEvent.contentOffset
						// this.navigationBar.reloadWithContentOffset(contentOffset)
						this.headerView.reloadWithContentOffset(contentOffset)
					}}
					scrollEventThrottle = {60}
				/>
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	sectionSpaceContainer: {
		backgroundColor: 'rgb(250, 250, 250)',
		height: 12,
	},
	scrollColorView: {
		backgroundColor: 'rgb(89, 79, 97)',
		position: 'absolute',
		left: 0,
		right: 0,
		top: 0,
		height: 400
	},
	itemContainer: {
		flexDirection: 'row',
		paddingLeft: 15,
		paddingRight: 15,
		alignItems: 'center',
		height: 60,
		backgroundColor: 'white',
	},
	itemTitle: {
		flex: 1,
		color: 'rgb(51, 51, 51)'
	},
	itemTitleNormal: {
		fontSize: 16,
		fontWeight: 'normal',
	},
	itemTitleSelected: {
		fontSize: 23,
		fontWeight: 'bold',
	},
	itemDetail: {
		fontSize: 14,
		color: 'rgb(153, 153, 153)',
		marginRight: 5,
	},
	itemSeparator: {
		position: 'absolute',
		left: 0,
		right: 0,
		bottom: 0,
		height: 0.5,
		backgroundColor: 'rgb(240, 240, 240)'
	},
	sectionFooterContainer: {
		paddingLeft: 15,
		paddingRight: 15,
		backgroundColor: 'white',
	},
	footerMainContainer: {
		flexDirection: 'row',
	},
	footerMainItemContainer: {
		flex: 1,
	},
	footerMainItemTitle: {
		color: 'rgb(102, 102, 102)',
		fontSize: 11,
		marginRight: 5,
	},
	footerMainItemDetail: {
		color: 'rgb(153, 153, 153)',
		fontSize: 11,
	},
	footerMainItemDetailSelected: {
		fontSize: 11,
		color: 'rgb(36, 199, 137)',
		marginLeft: 2,
		marginRight: 2,
	},
	footerMainItemTextContainer: {
		flexDirection: 'row',
		alignItems: 'center',
	},
	footerMainRankTextContainer: {
		flexDirection: 'row',
		alignItems: 'center',
	},
	footerMainDurationText: {
		fontSize: 42,
		color: 'rgb(89, 79, 97)'
	},
	footerMainRankImage: {
		marginTop: 10,
		width: 34,
		height: 34,
		borderRadius: 34 / 2.0,
		borderColor: 'rgb(36, 199, 137)',
		borderWidth: 1,
	},

	footerRecordItemContainer: {
		width: 113,
		height: 84,
		marginRight: 10,
		marginTop: 20,
		marginBottom: 15,
		paddingLeft: 15,
		paddingRight: 10,
		borderRadius: 3,
		backgroundColor: 'white',
		shadowColor: '#000',
		shadowOpacity: 0.05,
		shadowRadius: 5,
		shadowOffset: {
			width: 1,
			height: 2
		},
		justifyContent: 'flex-end',
	},
	footerRecordItemMainContainer: {
		flexDirection: 'row',
		alignItems: 'center',
	},
	footerRecordItemTitle: {
		fontSize: 11,
		color: 'rgb(51, 51, 51)',
		fontWeight: '400',
		flex: 1,
		lineHeight: 15,
	},
	footerRecordItemContent: {
		flexDirection: 'row',
		alignItems: 'flex-end',
		marginTop: 10,
		marginBottom: 10,
		height: '35%'
	},
	footerRecordItemText: {
		color: 'rgb(89, 79, 97)',
		fontSize: 23,
		fontWeight: '500',
		marginRight: 3,
	},
	footerRecordItemDetail: {
		color: 'rgb(102, 102, 102)',
		fontSize: 11,
		paddingBottom: 5,
		fontWeight: '300',
	},

})