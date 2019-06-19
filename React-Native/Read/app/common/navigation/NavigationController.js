import React, { Component } from 'react'
import { createStackNavigator } from 'react-navigation'
import NavigationBar from './NavigationBar'

import HTIndexPage from '~/page/index/common/HTIndexPage'

export default NavigationController = createStackNavigator({
	HTIndexPage: {
		screen: HTIndexPage,
	}
})


NavigationBar.defaultProps = {
	backgroundColor: '#0000',
	titleStyle: {
		fontSize: 20,
		fontWeight: 'normal',
		color: 'white'
	}  
}
