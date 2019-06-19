/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react'
import GlobalHook from '~/common/global/GlobalHook'
import GlobalStatic from '~/common/global/GlobalStatic'
import RootController from '~/common/root/RootController'

export default class App extends Component {

	render() {
		return (
			<RootController />
		)
	}

}