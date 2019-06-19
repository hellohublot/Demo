import React, { Component } from 'react'
import { View, Text, SafeAreaView, StyleSheet } from 'react-native'

export default class NavigationBar extends Component {

	static propTypes = {
		float: PropTypes.bool,
        leftItemList: PropTypes.arrayOf(PropTypes.oneOfType([PropTypes.element, PropTypes.number])),
        backgroundColor: PropTypes.string,
        backgroundView: PropTypes.element,
        titleView: PropTypes.element,
        title: PropTypes.string,
        titleStyle: PropTypes.object,
        rightItemList: PropTypes.arrayOf(PropTypes.oneOfType([PropTypes.element, PropTypes.number])),
    }

    _renderNavigationItem = (itemList) => {
    	return itemList?.map((item, index) => {
			if (typeof(item) == 'number') {
				return (<View key={index} style={[styleList.navigationLeftItemSpaceContainer, { width: item }]}></View>)
			} else {
				return <View key={index}>{ item }</View>
			}
		})
    }

	render() {
		return (
			<View style={[styleList.navigationBar, this.props.float ? styleList.navigationBarFloat : null]}>
				<View style={[styleList.navigationBarBackground, { backgroundColor: this.props.backgroundColor }]}>
					{
						this.props.backgroundView
					}
				</View>
				<SafeAreaView />
				<View style={styleList.navigationContent}>
					<View style={styleList.navigationTitleContainer}>
					 	<Text style={this.props.titleStyle}>{ this.props.title }</Text>
					</View>
					<View style={styleList.navigationTitleView}>
					 	{ this.props.titleView }
					</View>

					<View style={styleList.navigationLeftContainer}>
						{ this._renderNavigationItem(this.props.leftItemList) }
					</View>
					<View style={CONTAINER}>
					</View>
					<View style={styleList.navigationRightContainer}>
						{ this._renderNavigationItem(this.props.rightItemList) }
					</View>
				</View>
			</View>
		)
	}

}

const styleList = StyleSheet.create({
	navigationBar: {
		zIndex: 999,
	},
	navigationBarFloat: {
		position: 'absolute',
		left: 0, 
		right: 0, 
		top: 0, 
	},
	navigationBarBackground: {
		position: 'absolute',
		left: 0, 
		right: 0, 
		top: 0,
		bottom: 0,
	},
	navigationContent: {
		height: 44,
		flexDirection: 'row',
		alignItems: 'center',
		paddingLeft: 15,
		paddingRight: 15,
	},
	navigationLeftContainer: {
		flex: 1,
		flexDirection: 'row',
		justifyContent: 'flex-start',
		alignItems: 'center',
	},
	navigationTitleView: {
		position: 'absolute',
		top: 0,
		left: 0,
		right: 0,
		bottom: 0,
		justifyContent: 'center',
		alignItems: 'center',
	},
	navigationTitleContainer: {
		position: 'absolute',
		top: 0,
		left: 0,
		right: 0,
		bottom: 0,
		justifyContent: 'center',
		alignItems: 'center',
	},
	navigationRightContainer: {
		flex: 1,
		flexDirection: 'row',
		justifyContent: 'flex-end',
		alignItems: 'center',
	},
	navigationScanfImage: {

	},
	navigationMessageImage: {
		marginLeft: 15,
	},
})