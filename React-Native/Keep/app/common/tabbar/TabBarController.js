import React, { Component } from 'react'
import { Image } from 'react-native'
import { createBottomTabNavigator } from 'react-navigation'
import NavigationController from '~/common/navigation/NavigationController'

import HTSportPage from '~/page/sport/common/HTSportPage'
import HTDiscoverPage from '~/page/discover/common/HTDiscoverPage'
import HTCommunityPage from '~/page/community/common/HTCommunityPage'
import HTMinePage from '~/page/mine/common/HTMinePage'


const createTabBarItem = (title, normalImage, selectedImage) => {
	return {
		tabBarLabel: title,
		tabBarIcon: ({ focused }) => {
			let image = focused ? selectedImage : normalImage
			return (
				<Image source={image} />
			)
		},
		tabBarOptions: {
			activeTintColor: 'rgb(89.25, 79.05, 96.9)',
			inactiveTintColor: 'rgb(145.92, 145.92, 145.92)'
		}
	}
}

export default TabBarController = createBottomTabNavigator({
	HTSportPage: {
		screen: NavigationController(HTSportPage),
		navigationOptions: createTabBarItem(
			'运动', 
			require('~/resource/img/tabbar_sport_normal.png'),
			require('~/resource/img/tabbar_sport_selected.png'),
		),
	},
	HTDiscoverPage: {
		screen: NavigationController(HTDiscoverPage),
		navigationOptions: createTabBarItem(
			'发现', 
			require('~/resource/img/tabbar_discover_normal.png'),
			require('~/resource/img/tabbar_discover_selected.png'),
		),
	},
	HTCommunityPage: {
		screen: NavigationController(HTCommunityPage),
		navigationOptions: createTabBarItem(
			'社区', 
			require('~/resource/img/tabbar_community_normal.png'),
			require('~/resource/img/tabbar_community_selected.png'),
		),
	},
	HTMinePage: {
		screen: NavigationController(HTMinePage),
		navigationOptions: createTabBarItem(
			'我', 
			require('~/resource/img/tabbar_mine_normal.png'),
			require('~/resource/img/tabbar_mine_selected.png'),
		),
	},
}, {

})