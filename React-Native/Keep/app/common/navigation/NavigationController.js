import React, { Component } from 'react'
import { createStackNavigator } from 'react-navigation'
import NavigationBar from './NavigationBar'

export default NavigationController = (screen) => {
	return createStackNavigator({
		screen: {
			screen: screen,
		}
	})
}


NavigationBar.defaultProps = {
	backgroundColor: 'white',
	titleStyle: {
		fontSize: 16,
		fontWeight: 'bold',
		color: 'rgb(51, 51, 51)'
	}  
}
